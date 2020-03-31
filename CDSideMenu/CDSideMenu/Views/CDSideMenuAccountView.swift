//
//  CDSideMenuAccountView.swift
//  CDSideMenu
//
//  Created by Chris on 3/30/20.
//

import SwiftUI

/// A view representing the entier User Account panel view in the CDSideMenu
struct CDSideMenuAccountView: View {
    
    let didSelectRowAt: (Int) -> Void
    let selectedRow: Int
    
    @EnvironmentObject var configuration: CDSideMenuConfiguration
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .center) {
                Image(self.configuration.userData!.imageUrl)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(self.configuration.menuForegroundColor, lineWidth: 3))
                
                Text("Hi, \(self.configuration.userData!.userName)")
                    .font(self.configuration.menuFont)
                    .bold()
                    .foregroundColor(self.configuration.menuForegroundColor)
            }
            .frame(maxWidth: .infinity)
            
            VStack(alignment: .leading) {
                
                ForEach(self.configuration.menuItems.filter() { !$0.inAccountPanel }.count ..< self.configuration.menuItems.count) { index in
                    CDSideMenuRow(index: index, didSelectRowAt: self.didSelectRowAt, selectedRow: self.selectedRow)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
              
                /// The logout button
                Button(action: { self.didSelectRowAt(CDAccountItems.logOut.rawValue) }, label: {
                    HStack {
                        Image(systemName: "power")
                            .imageScale(.large)
                        Text("Logout")
                            .font(self.configuration.menuFont)
                        
                    }
                    .foregroundColor(.cdOffOrange)
                    .padding()
                    
                })
            }
            .padding(.bottom, 40)
        }
    }
}
