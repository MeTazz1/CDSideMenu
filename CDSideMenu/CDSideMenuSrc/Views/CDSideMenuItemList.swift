//
//  CDSideMenuItemList.swift
//  CDSideMenu
//
//  Created by Chris on 3/30/20.
//

import SwiftUI

struct CDSideMenuItemList: View {
    
    let didSelectRowAt: (Int) -> Void
    let selectedRow: Int
    
    @EnvironmentObject var configuration: CDSideMenuConfiguration
    
    var body: some View {
        VStack {
            ForEach(0 ..< self.configuration.menuItems.filter() { !$0.inAccountPanel }.count) { index in
               CDSideMenuRow(index: index, didSelectRowAt: self.didSelectRowAt, selectedRow: self.selectedRow)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct CDSideMenuItemList_Previews: PreviewProvider {
    
    static func testDidSelectRowAt(index: Int) {
        
    }
    static var previews: some View {
        CDSideMenuItemList(didSelectRowAt: CDSideMenuItemList_Previews.testDidSelectRowAt(index:),
                           selectedRow: 0)
    }
}
