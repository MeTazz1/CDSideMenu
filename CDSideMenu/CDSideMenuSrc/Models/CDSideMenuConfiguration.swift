//
//  CDSideMenuConfiguration.swift
//  CDSideMenu
//
//  Created by Chris on 3/28/20.
//  Copyright © 2020 Chris Dlc. All rights reserved.
//

import SwiftUI

/// The environment object used to configure and customize the CDSideMenu
public class CDSideMenuConfiguration: ObservableObject {
    // MARK: - Customizations properties
    
    /// Will hide the navigationBar. If hidden, a open/close button will be added
    public let navigationBarHidden: Bool
    
    /// Will hide the side menu account view, containing the user profile picture, the username, the account and logout buttons
    public let accountViewHidden: Bool
    
    /// The side menu backgroundColor
    public let menuBackgroundColor: Color
    
    /// The side menu texts and SF images color
    public let menuForegroundColor: Color
    
    /// The content views' backgroundColor
    public let viewsBackgroundColor: Color
    
    /// The side menu texts font
    public let menuFont: Font?
    
    /// The open/close menu button size
    public let menuButtonSize: CGFloat
    
    /// The menu size factor, 1 being half screen size
    public let menuSizeFactor: CGFloat
    
    /// The SF images used for the open/close side menu button icons
    public let openedMenuButtonSFImage: String
    public let closedMenuButtonSFImage: String
    
    /// The list of items to display in the side menu
    public let menuItems: [CDSideMenuItem]
        
    /// The user account data, optional
    public let userData: CDUserData?
    
    /// A complete initializer for all customizable properties within the CDSideMenu
    public init(navigationBarHidden: Bool = false, accountViewHidden: Bool,
                menuBackgroundColor: Color = .cdDarkGray, menuForegroundColor: Color = .cdOffWhite, viewsBackgroundColor: Color = .clear, menuFont: Font = Font.system(.body),  menuButtonSize: CGFloat = 25, menuSizeFactor: CGFloat = 1, openedMenuButtonSFImage: String = "chevron.right.square.fill", closedMenuButtonSFImage: String = "chevron.right.square",
         menuItems: [CDSideMenuItem], userData: CDUserData? = nil) throws {
        
        self.navigationBarHidden = navigationBarHidden
        self.accountViewHidden = accountViewHidden
        self.menuBackgroundColor = menuBackgroundColor
        self.menuForegroundColor = menuForegroundColor
        self.viewsBackgroundColor = viewsBackgroundColor
        self.menuFont = menuFont
        self.menuButtonSize = menuButtonSize
        self.menuSizeFactor = menuSizeFactor
        self.openedMenuButtonSFImage = openedMenuButtonSFImage
        self.closedMenuButtonSFImage = closedMenuButtonSFImage
        self.menuItems = menuItems
        self.userData = userData

        try checkConfiguration()
    }
    
    /// Allows the user to know if the current configuration is usable, or not
    private func checkConfiguration() throws {
        var errorMessage: String? = nil
        if self.menuSizeFactor < 0.5 || self.menuSizeFactor > 2.0 {
            errorMessage = "menuSizeFactor must be between 0.5 and 2.0"
        }
        if self.menuItems.count == 0 {
            errorMessage = "menuItems array empty. Please appends item to it. "
        }
        if !self.accountViewHidden && self.userData == nil {
            errorMessage = "You are willing to have the left menu account panel visible; however you do not have any user data. Please set the property 'userData'."
        }
        
        print("-- CDSideMenu Configuration Check : \(errorMessage != nil ? "FAILED": "PASSED")")
        if let errorMessage = errorMessage {
            throw errorMessage
        }

    }
    
    #if DEBUG
    deinit {
        print("OS reclaiming memory for object CDSideMenuConfiguration")
    }
    #endif
}
