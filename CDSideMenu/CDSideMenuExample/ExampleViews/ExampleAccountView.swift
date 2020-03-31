//
//  ExampleAccountView.swift
//  CDSideMenu
//
//  Created by Chris on 3/28/20.
//  Copyright © 2020 Chris Dlc. All rights reserved.
//

import SwiftUI

struct ExampleAccountView: View {
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text("This is View")
                .font(.system(size: 50))
            Text("#")
                .font(.system(size: 60))
            Text("Account")
                .font(.system(size: 50))
            
            Spacer()
            
            Text("To open the left menu, you can either click the upper left arrow icon")
                .multilineTextAlignment(.center)
            Image(systemName: "chevron.right.square")
                .imageScale(.large)
                .foregroundColor(.black)
            Text("Or swipe to the right! ")
            
            Spacer()
        }
        .padding()
    }
}

struct ExampleAccountView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleAccountView()
    }
}
