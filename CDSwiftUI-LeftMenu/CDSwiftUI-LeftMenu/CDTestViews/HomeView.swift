//
//  HomeView.swift
//  CDSwiftUI-LeftMenu
//
//  Created by Chris on 3/28/20.
//  Copyright © 2020 Chris Dlc. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    init() {
        print("* HomeView init *")
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text("Welcome to your")
                .font(.system(size: 50))
            Text("#")
                .font(.system(size: 60))
            Text("Home View")
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


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
