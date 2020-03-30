//
//  ImageView.swift
//  CDSwiftUI-LeftMenu
//
//  Created by Chris on 3/29/20.
//  Copyright © 2020 Chris Dlc. All rights reserved.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image("background1")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
