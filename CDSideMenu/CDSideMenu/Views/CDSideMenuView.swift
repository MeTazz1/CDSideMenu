//
//  CDSideMenuView.swift
//  CDSideMenu
//
//  Created by Chris on 3/28/20.
//  Copyright © 2020 Chris Dlc. All rights reserved.
//

import SwiftUI

/// Account View item button value
enum CDAccountItems: Int {
    case logOut = -1
}

/// The actual side menu view panel
struct CDSideMenuView: View {
    
    /// Callback used to call the main didSelectRowAt on main view
    let didSelectRowAt: (Int) -> Void
    
    /// Used to highlight the selected Row
    let selectedRow: Int
    
    @EnvironmentObject var configuration: CDSideMenuConfiguration

    var body: some View {
        VStack(alignment: .leading) {
            
            /// The Item list
            CDSideMenuItemList(didSelectRowAt: self.internalDidSelectRowAt, selectedRow: self.selectedRow)
                .padding(.top, self.configuration.navigationBarHidden ? 30 : 0)
            
            Spacer()
            
            /// The User Data profile
            if !configuration.accountViewHidden && configuration.userData != nil {
                CDSideMenuAccountView(didSelectRowAt: self.internalDidSelectRowAt, selectedRow: self.selectedRow)
            }
        }
        .modifier(CDSideMenuView.Modifiers())
    }
    
    // MARK: - Internal functioning
    private func internalDidSelectRowAt(_ index: Int) {
        self.didSelectRowAt(index)
    }
}
