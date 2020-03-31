//
//  ContentView.swift
//  CDSideMenu
//
//  Created by Chris on 3/31/20.
//  Copyright © 2020 Chris Dlc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    /// Conforms to CDSideMenuConfigurator protocol
    func createConfiguration() -> CDSideMenuConfiguration {
        #warning("Step 2 (required): Configure your CDSideMenu")

        /// Creating the left menu items, with SF Symbols for images
        var menuItems = [CDSideMenuItem]()
        menuItems.append(CDSideMenuItem(title: "Home", sfImage: "house", view: AnyView(ExampleHomeView())))
        menuItems.append(CDSideMenuItem(title: "Map View", sfImage: "map", view: AnyView(ExampleMapView())))
        menuItems.append(CDSideMenuItem(title: "List View", sfImage: "list.dash", view: AnyView(ExampleListView())))
        menuItems.append(CDSideMenuItem(title: "Image View", sfImage: "photo", view: AnyView(ExampleImageView())))
        menuItems.append(CDSideMenuItem(title: "My Account", sfImage: "person", view: AnyView(ExampleAccountView()), inAccountPanel: true))

        /// If planning to use the logout button, register to the following event to be notified when the user clicks the logout button
        NotificationCenter.default.addObserver(forName: Notification.Name(CDSideMenuNotification.logout.rawValue),
                                               object: nil, queue: nil, using: self.didLogout)
        
        do { /// You must setup your left menu in a do-catch as the Configurator will let you know if there is anything wrong with your configuration
           
            /// Choice #1 : Default configuration
            //return try CDSideMenuConfiguration(accountViewHidden: true, menuItems: menuItems)
            
            /// Choice #2 : Chris's favorite configuration
            return try CDSideMenuConfiguration(navigationBarHidden: false,
                                               accountViewHidden: false,
                                               menuBackgroundColor: .cdDarkGray,
                                               menuForegroundColor: .white,
                                               viewsBackgroundColor: .cdOffGreen,
                                               menuFont: Font.system(.body, design: .rounded),
                                               menuButtonSize: 28,
                                               menuSizeFactor: 1.1,
                                               menuItems: menuItems,
                                               userData: CDUserData(userName: "Chris", imageUrl: "turtlerock"))
            
            /// Choice #3 : Custom configuration
            //  return try CDSideMenuConfiguration(navigationBarHidden: true, accountViewHidden: false, menuBackgroundColor: .cdDarkGray, menuForegroundColor: .white, viewsBackgroundColor: .cdOffGreen, menuFont: Font.system(size: 15), menuButtonSize: 32, menuSizeFactor: 1.5, openedMenuButtonSFImage: "chevron.right.2", closedMenuButtonSFImage: "chevron.right.2", menuItems: menuItems, userData: CDUserData(userName: "Chris", imageUrl: "turtlerock"))
        }
        catch {
            print("CDSideMenu configuration failed. Please check your error below:")
            print(error.localizedDescription)
            print("CDSideMenu Default configuration loaded instead.")
            return try! CDSideMenuConfiguration(accountViewHidden: true, menuItems: menuItems)
        }
    }
    
    /// Conforms to CDSideMenuConfigurator protocol
    func didLogout(_ notification: Notification) {
        print("User logged out! UserData will be in notification.object")
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 30) {
                Text("Welcome, my friend!")
                    .font(.system(.subheadline, design: .monospaced))
                
                #warning("Step 3 (required): Create a NavigationLink to push the CDSideMenuMainView")
                NavigationLink(destination: CDSideMenuMainView()
                    .environmentObject(createConfiguration()), label: {
                        Text("Now, click here ;) ")
                            .font(.system(.subheadline, design: .monospaced))
                })
            }
            .navigationBarTitle("CDSideMenu Example", displayMode: .inline)
            // Enable/Disable this if you want a navigationBar, or not :)
            //.navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
