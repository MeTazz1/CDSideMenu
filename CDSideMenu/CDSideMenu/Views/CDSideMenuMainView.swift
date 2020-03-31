//
//  CDSideMenuMainView.swift
//  CDSideMenu
//
//  Created by Chris on 3/28/20.
//  Copyright © 2020 Chris Dlc. All rights reserved.
//

import SwiftUI
import Combine

/// The main view container for the left menu and the page content
public struct CDSideMenuMainView: View {
    
    /// CDSideMenu Configuration
    @EnvironmentObject var configuration: CDSideMenuConfiguration
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    public init() {}
    
    /// The state properties used to handle the animations and content switches
    @State private var sideMenuOpen: Bool = false
    @State private var selectedRow: Int = 0
        
    public var body: some View {
        
        /// Your left-right drag gesture to open/close the left menu
        let drag = DragGesture(minimumDistance: 80)
            .onEnded {
                if (self.sideMenuOpen && $0.translation.width < -80) || (!self.sideMenuOpen && $0.translation.width > 80) {
                    withAnimation { self.sideMenuOpen.toggle() }
                }
        }
        
        return
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    
                    // MARK: - The Views
                    
                    self() /// callAsFunction, Swift 5.2 <3
                        .offset(x: self.sideMenuOpen ? geometry.size.width / (2 / self.configuration.menuSizeFactor) : 0)
                        .disabled(self.sideMenuOpen)
                        .modifier(CDViewsModifier())
                    
                    // MARK: - The open/close button if navigationBar is hidden
                    /// If the navigationBar is hidden, we need to display a custom buttom, top left corner
                    /// and make it move at the same time than the rest
                    if self.configuration.navigationBarHidden {
                        CDSideMenuButton(sideMenuOpen: self.$sideMenuOpen, toggleLeftMenu: self.toggleLeftMenu)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .padding(.top, 16)
                            .padding(.leading, 23)
                            .offset(x: self.sideMenuOpen ? geometry.size.width / (2 / self.configuration.menuSizeFactor) : 0)
                    }
                    
                    // MARK: - The Left Menu View
                    // if the left menu is close, we don't load the view
                    if self.sideMenuOpen {
                        CDSideMenuView(didSelectRowAt: self.didSelectRow(index:), selectedRow: self.selectedRow)
                            .frame(width: geometry.size.width / (2 / self.configuration.menuSizeFactor), alignment: .leading)
                            .offset(x: self.sideMenuOpen ? 0 : -geometry.size.width)
                            .transition(.move(edge: .leading))
                    }
                    
                }
                .gesture(drag)
                .navigationBarHidden(self.configuration.navigationBarHidden)
                .navigationBarTitle(Text(self.navigationBarTitle), displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: (
                    /// Top left menu button
                    CDSideMenuButton(sideMenuOpen: self.$sideMenuOpen, toggleLeftMenu: self.toggleLeftMenu)
                ))
            }
        }
    
    
    // MARK: - Functioning methods
    
    /// Generates the navigationBarTitle based on selectedRow
    private var navigationBarTitle: String {
        switch self.selectedRow {
        case CDAccountItems.logOut.rawValue:
            return "Welcome"
        default:
            return self.configuration.menuItems[self.selectedRow].title
        }
    }
    
    /// Open/Close the left menu
    private func toggleLeftMenu() {
        withAnimation {
            print(self.sideMenuOpen ? "-- CDSideMenu closing" : "-- CDSideMenu opening")
            self.sideMenuOpen.toggle()
        }
    }
    
    /// Return the required view item depending on the current selectedRow
    private func callAsFunction() -> some View {
        if selectedRow >= 0 {
            return self.configuration.menuItems[self.selectedRow].view
        }
        return AnyView(Text("Logging you out..."))
    }
    
    /// Callback called when clicking a left menu item
    func didSelectRow(index: Int) {
        self.selectedRow = index
        if self.selectedRow == CDAccountItems.logOut.rawValue {
            self.presentationMode.wrappedValue.dismiss()
            NotificationCenter.default.post(name: Notification.Name(CDSideMenuNotification.logout.rawValue), object: self.configuration.userData)
        }
        else {
            self.toggleLeftMenu()
        }
    }
}
