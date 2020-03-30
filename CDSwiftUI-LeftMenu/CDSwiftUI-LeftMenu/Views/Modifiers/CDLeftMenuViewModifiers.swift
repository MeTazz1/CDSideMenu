//
//  Modifiers.swift
//  CDSwiftUI-LeftMenu
//
//  Created by Chris on 3/29/20.
//  Copyright © 2020 Chris Dlc. All rights reserved.
//

import SwiftUI

extension CDLeftMenuView {
    
    struct Modifiers: ViewModifier {
        
        let configuration: CDLeftMenuConfiguration
        
        func body(content: Content) -> some View {
            content
                .padding(.top, self.configuration.navigationBarHidden ? 30 : 100)
                .background(self.configuration.menuBackgroundColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .edgesIgnoringSafeArea(.all) // to have the black shadow behind the NavigationBar to have the black shadow behind the NavigationBar
        }
    }
}
