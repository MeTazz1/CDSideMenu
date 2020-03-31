//
//  CDUserData.swift
//  CDSideMenu
//
//  Created by Chris on 3/28/20.
//  Copyright © 2020 Chris Dlc. All rights reserved.
//

import Foundation

/// An open class that you can extend or inherit from to handle more UserData properties
open class CDUserData : ObservableObject {
    @Published var userName: String
    @Published var imageUrl: String
    
    /// UserData initializer
    public init(userName: String, imageUrl: String) {
        self.userName = userName
        self.imageUrl = imageUrl
    }
    
    #if DEBUG
    deinit {
        print("OS reclaiming memory for object CDUserData")
    }
    #endif
}
