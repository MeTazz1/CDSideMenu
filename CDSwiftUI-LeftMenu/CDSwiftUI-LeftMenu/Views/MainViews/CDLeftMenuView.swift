//
//  CDLeftMenuView.swift
//  CDSwiftUI-LeftMenu
//
//  Created by Chris on 3/28/20.
//  Copyright © 2020 Chris Dlc. All rights reserved.
//

import SwiftUI

enum CDAccountItems: Int {
    case yourAccount = -1
    case logOut = -2
}

struct CDLeftMenuView: View {
    
    let didSelectRowAt: (Int) -> Void
    let selectedRow: Int
    let configuration: CDLeftMenuConfiguration
    
    var body: some View {
        VStack(alignment: .leading) {
            
            /// The Item list
            VStack {
                ForEach(0 ..< self.configuration.menuItems.count) { index in
                    Button(action: { self.internalDidSelectRowAt(index) }, label: {
                        HStack {
                            Image(systemName: self.configuration.menuItems[index].sfImage)
                                .imageScale(.large)
                            
                            Text(self.configuration.menuItems[index].title)
                                .fontWeight(self.selectedRow == index ? .bold : .none)
                        }
                        .foregroundColor(self.configuration.menuForegroundColor)
                        .padding()
                    })
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.top, self.configuration.navigationBarHidden ? 30 : 0)
            
            Spacer()
            
            /// The User Data profile
            if !configuration.accountViewHidden && configuration.userData != nil {
                VStack(alignment: .center) {
                    Image(self.configuration.userData!.imageUrl)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(self.configuration.menuForegroundColor, lineWidth: 3))
                    
                    Text("Hi, \(self.configuration.userData!.userName)")
                        .bold()
                        .foregroundColor(self.configuration.menuForegroundColor)
                }
                .frame(maxWidth: .infinity)
                
                VStack(alignment: .leading) {
                    if configuration.accountView != nil {
                        Button(action: { self.internalDidSelectRowAt(CDAccountItems.yourAccount.rawValue) }, label: {
                            HStack {
                                Image(systemName: "person.crop.circle")
                                    .imageScale(.large)
                                Text(self.configuration.accountButtonTitle)
                                    .fontWeight(self.selectedRow == CDAccountItems.yourAccount.rawValue ? .bold : .none)
                                
                            }
                            .foregroundColor(self.configuration.menuForegroundColor)
                            .padding()
                            
                        })
                    }
                    Button(action: { self.internalDidSelectRowAt(CDAccountItems.logOut.rawValue) }, label: {
                        HStack {
                            Image(systemName: "power")
                                .imageScale(.large)
                            Text("Logout")
                            
                        }
                        .foregroundColor(.cdOffOrange)
                        .padding()
                        
                    })
                }
                .padding(.bottom, 40)
            }
            
        }
        .modifier(CDLeftMenuView.Modifiers(configuration: self.configuration))
    }
    
    // MARK: - Internal functioning
    private func internalDidSelectRowAt(_ index: Int) {
        self.didSelectRowAt(index)
    }
}
