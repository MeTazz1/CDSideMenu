//
//  CDLeftMenuMainView.swift
//  CDSwiftUI-LeftMenu
//
//  Created by Chris on 3/28/20.
//  Copyright © 2020 Chris Dlc. All rights reserved.
//

import SwiftUI

/// The main view container for the left menu and the page content
struct CDLeftMenuMainView: View {
    
    /// CDLeftMenu Configuration
    let configuration: CDLeftMenuConfiguration
    
    /// The state properties used to handle the animations and content switches
    @State private var leftMenuOpen: Bool = false
    @State private var selectedRow: Int = 0
    
    var body: some View {
        
        /// Your left-right drag gesture to open/close the left menu
        let drag = DragGesture(minimumDistance: 80)
            .onEnded {
                if (self.leftMenuOpen && $0.translation.width < -80) || (!self.leftMenuOpen && $0.translation.width > 80) {
                    withAnimation { self.leftMenuOpen.toggle() }
                }
        }
        
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    
                    // MARK: - The Views
                    self() /// callAsFunction, Swift 5.2 <3
                        .offset(x: self.leftMenuOpen ? geometry.size.width / 2 : 0)
                        .disabled(self.leftMenuOpen)
                        .modifier(CDViewsModifier(configuration: self.configuration))
                    
                    // MARK: - The open/close button if navigationBar is hidden
                    /// If the navigationBar is hidden, we need to display a custom buttom, top left corner
                    /// and make it move at the same time than the rest
                    if self.configuration.navigationBarHidden {
                        VStack {
                            HStack(alignment: .top) {
                                Button(action: {
                                    self.toggleLeftMenu()
                                }, label: {
                                    Image(systemName: self.leftMenuOpen ? self.configuration.openedLeftMenuButtonSFImage : self.configuration.closedLeftMenuButtonSFImage)
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(self.configuration.menuBackgroundColor)
                                        .rotationEffect(self.leftMenuOpen ? .degrees(-180) : .degrees(0))
                                        .animation(.linear)
                                })
                                Spacer()
                            }
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(.top, 16)
                        .padding(.leading, 23)
                        .offset(x: self.leftMenuOpen ? geometry.size.width / 2 : 0)
                    }
                    
                    // MARK: - The Left Menu View
                    // if the left menu is close, we don't load the view
                    if self.leftMenuOpen {
                        CDLeftMenuView(didSelectRowAt: self.leftMenuClicked(index:), selectedRow: self.selectedRow,
                                       configuration: self.configuration)
                            .frame(width: geometry.size.width / 2, alignment: .leading)
                            .offset(x: self.leftMenuOpen ? 0 : -geometry.size.width)
                            .transition(.move(edge: .leading))
                    }
                    
                }
                .gesture(drag)
                .navigationBarHidden(self.configuration.navigationBarHidden)
                .navigationBarTitle(Text(self.selectedRow == CDAccountItems.yourAccount.rawValue ? self.configuration.accountButtonTitle : self.configuration.menuItems[self.selectedRow].title), displayMode: .inline)
                .navigationBarItems(leading: (
                    /// Top left menu button
                    Button(action: {
                        self.toggleLeftMenu()
                    }, label: {
                        Image(systemName: self.leftMenuOpen ? self.configuration.openedLeftMenuButtonSFImage : self.configuration.closedLeftMenuButtonSFImage)
                            .foregroundColor(self.configuration.menuBackgroundColor)
                            .imageScale(.large)
                            .rotationEffect(self.leftMenuOpen ? .degrees(-180) : .degrees(0))
                            .animation(.linear)
                    })
                ))
            }
        }
    }
    
    // MARK: - Functioning methods
    
    /// Open/Close the left menu
    private func toggleLeftMenu() {
        withAnimation {
            print(self.leftMenuOpen ? "-- CDSwiftUI-LeftMenu closing" : "-- CDSwiftUI-LeftMenu opening")
            self.leftMenuOpen.toggle()
        }
    }
    
    /// Return the required view item depending on the current selectedRow
    private func callAsFunction() -> some View {
        if selectedRow >= 0 {
            return self.configuration.menuItems[self.selectedRow].view
        }
        else if selectedRow == CDAccountItems.yourAccount.rawValue { // Account View
            return self.configuration.accountView ?? AnyView(EmptyView())
        }
        else if selectedRow == CDAccountItems.logOut.rawValue { // Logout
            // Perform your logout actions here
        }
        return AnyView(EmptyView())
    }
    
    /// Callback called when clicking a left menu item
    func leftMenuClicked(index: Int) {
        print("LeftMenu row clicked \(index)")
        self.selectedRow = index
        self.toggleLeftMenu()
    }
}
