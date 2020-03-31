//
//  CDSideMenuRow.swift
//  CDSideMenu
//
//  Created by Chris on 3/30/20.
//

import SwiftUI

struct CDSideMenuRow: View {
    
    let index: Int
    let didSelectRowAt: (Int) -> Void
    let selectedRow: Int
    
    @EnvironmentObject var configuration: CDSideMenuConfiguration
    
    var body: some View {
        Button(action: { self.didSelectRowAt(self.index) }, label: {
            HStack {
                Image(systemName: self.configuration.menuItems[index].sfImage)
                    .imageScale(.large)
                
                Text(self.configuration.menuItems[index].title)
                    .fontWeight(self.selectedRow == index ? .heavy : .none)
                    .font(self.configuration.menuFont)
            }
            .foregroundColor(self.configuration.menuForegroundColor)
            .padding()
        })
    }
}
