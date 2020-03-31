//
//  CDSideMenuItem.swift
//  CDSideMenu
//
//  Created by Chris on 3/28/20.
//  Copyright © 2020 Chris Dlc. All rights reserved.
//

import SwiftUI

/// Each item represents one clickable row in the CDSideMenu panel
public struct CDSideMenuItem {
    let title: String
    let sfImage: String
    let view: AnyView
    let inAccountPanel: Bool
    
    /// Initialazer for each item
    public init(title: String, sfImage: String, view: AnyView, inAccountPanel: Bool = false) {
        self.title = title
        self.sfImage = sfImage
        self.view = view
        self.inAccountPanel = inAccountPanel
    }
}
