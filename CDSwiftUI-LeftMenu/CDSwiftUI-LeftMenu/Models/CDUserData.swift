//
//  CDUserData.swift
//  CDSwiftUI-LeftMenu
//
//  Created by Chris on 3/28/20.
//  Copyright © 2020 Chris Dlc. All rights reserved.
//

import Foundation

final class CDUserData : ObservableObject {
    @Published var userName: String
    @Published var imageUrl: String
    
    init(userName: String, imageUrl: String) {
        self.userName = userName
        self.imageUrl = imageUrl
    }
    
    deinit {
        print("OS reclaiming memory for object UserData")
    }
}
