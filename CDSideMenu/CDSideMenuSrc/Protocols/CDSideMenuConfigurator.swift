//
//  CDSideMenuConfigurator.swift
//  CDSideMenu
//
//  Created by Chris on 3/31/20.
//

import SwiftUI

public protocol CDSideMenuConfigurator {
    /// Create the CDSideMenu configuration in this function
    func createConfiguration() -> CDSideMenuConfiguration
    /// Reuse this method as an observer, observing the CDSideMenuNotification.logout.rawValue notification name
    func didLogout(_ notification: Notification)
}
