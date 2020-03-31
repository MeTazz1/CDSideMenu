//
//  Modifiers.swift
//  CDSideMenu
//
//  Created by Chris on 3/29/20.
//  Copyright © 2020 Chris Dlc. All rights reserved.
//

import SwiftUI

extension CDSideMenuView {
    /// The main view modifier used for the Side menu, applying the Side menu background color, its position and frame
    struct Modifiers: ViewModifier {
        
        @EnvironmentObject var configuration: CDSideMenuConfiguration

        func body(content: Content) -> some View {
            content
                .padding(.top, self.configuration.navigationBarHidden ? 30 : 100)
                .background(self.configuration.menuBackgroundColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .edgesIgnoringSafeArea(.all) // to have the black shadow behind the NavigationBar to have the black shadow behind the NavigationBar
        }
    }
}
