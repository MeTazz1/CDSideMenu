//
//  String.swift
//  CDSideMenu
//
//  Created by Chris on 3/29/20.
//  Copyright © 2020 Chris Dlc. All rights reserved.
//

import SwiftUI

extension String: LocalizedError {
    public var errorDescription: String? { return self } 
}
