//
//  ExampleImageView.swift
//  CDSideMenu
//
//  Created by Chris on 3/29/20.
//  Copyright © 2020 Chris Dlc. All rights reserved.
//

import SwiftUI

struct ExampleImageView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image("background1")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct ExampleImageView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleImageView()
    }
}
