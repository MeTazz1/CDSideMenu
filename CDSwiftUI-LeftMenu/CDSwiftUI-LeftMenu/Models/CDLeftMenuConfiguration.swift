//
//  CDLeftMenuConfiguration.swift
//  CDSwiftUI-LeftMenu
//
//  Created by Chris on 3/28/20.
//  Copyright © 2020 Chris Dlc. All rights reserved.
//

import SwiftUI

struct CDLeftMenuConfiguration {
    // MARK: - Customizations properties
    
    /// Will hide the navigationBar. If hidden, a open/close button will be added
    let navigationBarHidden: Bool
    
    /// Will hide the left menu account view, containing the user profile picture, the username, the account and logout buttons
    let accountViewHidden: Bool
    
    /// The User Account button title
    let accountButtonTitle: String
    
    /// the left menu backgroundColor
    let menuBackgroundColor: Color
    
    /// the left menu texts and SF images color
    let menuForegroundColor: Color
    
    /// the views' backgroundColor
    let viewsBackgroundColor: Color
    
    /// the SF images used for the open/close left menu button
    let openedLeftMenuButtonSFImage: String
    let closedLeftMenuButtonSFImage: String
    
    /// the list of items to display in the left menu
    let menuItems: [CDLeftMenuItem]
    
    /// the user account view, optional. If you don't have any, the left menu item won't appear
    let accountView: AnyView?
    
    /// the user account data, optional
    let userData: CDUserData?
    
    init(navigationBarHidden: Bool = false, accountViewHidden: Bool, accountButtonTitle: String = "My Account",
         menuBackgroundColor: Color = .cdDarkGray, menuForegroundColor: Color = .cdOffWhite, viewsBackgroundColor: Color = .clear,
         openedLeftMenuButtonSFImage: String = "chevron.right.square.fill", closedLeftMenuButtonSFImage: String = "chevron.right.square",
         menuItems: [CDLeftMenuItem], accountView: AnyView? = nil, userData: CDUserData? = nil) throws {
        
        self.navigationBarHidden = navigationBarHidden
        self.accountViewHidden = accountViewHidden
        self.accountButtonTitle = accountButtonTitle
        self.menuBackgroundColor = menuBackgroundColor
        self.menuForegroundColor = menuForegroundColor
        self.viewsBackgroundColor = viewsBackgroundColor
        self.openedLeftMenuButtonSFImage = openedLeftMenuButtonSFImage
        self.closedLeftMenuButtonSFImage = closedLeftMenuButtonSFImage
        self.menuItems = menuItems
        self.accountView = accountView
        self.userData = userData

        if self.menuItems.count == 0 {
            throw "menuItems array empty. Please appends item to it. "
        }
        if !self.accountViewHidden && (self.accountView == nil || self.userData == nil) {
            throw "You are willing to have the left menu account panel visible; however you do not have any user account view set. Please set the property 'accountView' like so: AnyView(\"YourAccountView\")."
        }
    }
}
