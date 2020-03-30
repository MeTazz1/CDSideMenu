//
//  CDViewsModifier.swift
//  CDSwiftUI-LeftMenu
//
//  Created by Chris on 3/29/20.
//  Copyright © 2020 Chris Dlc. All rights reserved.
//

import SwiftUI

struct CDViewsModifier: ViewModifier {
    
    let configuration: CDLeftMenuConfiguration
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(self.configuration.viewsBackgroundColor)
            .edgesIgnoringSafeArea(self.configuration.navigationBarHidden ? .all : [.leading, .bottom, .trailing])
    }
}
