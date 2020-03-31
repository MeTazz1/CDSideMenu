//
//  ExampleListView.swift
//  CDSideMenu
//
//  Created by Chris on 3/29/20.
//  Copyright © 2020 Chris Dlc. All rights reserved.
//

import SwiftUI

struct ExampleListView: View {
    
    private var items = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida",
                         "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland"]
    var body: some View {
        VStack(alignment: .center) {
            List(0 ..< items.count, id: \.self) { index in
                Text("State #\(index), \(self.items[index])")
                    .font(.system(.subheadline, design: .monospaced))
            }
        }
    }
}

struct ExampleListView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleListView()
    }
}
