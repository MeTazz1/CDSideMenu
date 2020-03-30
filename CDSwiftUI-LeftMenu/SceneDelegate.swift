//
//  SceneDelegate.swift
//  CDSwiftUI-LeftMenu
//
//  Created by Chris on 3/28/20.
//  Copyright © 2020 Chris Dlc. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        // Create the SwiftUI view that provides the window contents.
        
        
        
        // MARK: - LEFT MENU CONFIGURATION AND CREATION
        
        // Creating the left menu items, with SF Symbols for images
        var menuItems = [CDLeftMenuItem]()
        menuItems.append(CDLeftMenuItem(title: "Home", sfImage: "house", view: AnyView(HomeView())))
        menuItems.append(CDLeftMenuItem(title: "Map View", sfImage: "map", view: AnyView(MapView())))
        menuItems.append(CDLeftMenuItem(title: "List View", sfImage: "list.dash", view: AnyView(ListView())))
        menuItems.append(CDLeftMenuItem(title: "Image View", sfImage: "photo", view: AnyView(ImageView())))
        
        #warning("Change levelOfCustomization to play with pre-configured settings")
        let levelOfCustomization = CDLeftMenuConfiguration.Level.favorite
        let leftMenuConfiguration: CDLeftMenuConfiguration
        
        do { /// You must setup your left menu in a do-catch as the Configurator will let you know if there is anything wrong with your configuration
            switch levelOfCustomization {
                case .basic:
                    leftMenuConfiguration = try CDLeftMenuConfiguration(accountViewHidden: true, menuItems: menuItems)
                case .favorite:
                    leftMenuConfiguration = try CDLeftMenuConfiguration(accountViewHidden: false, menuItems: menuItems, accountView: AnyView(AccountView()), userData: CDUserData(userName: "Chris", imageUrl: "turtlerock"))
                case .custom:
                    leftMenuConfiguration = try CDLeftMenuConfiguration(navigationBarHidden: true, accountViewHidden: false, accountButtonTitle: "User Account", menuBackgroundColor: .cdDarkGray, menuForegroundColor: .white, viewsBackgroundColor: .clear, openedLeftMenuButtonSFImage: "chevron.left.circle.fill", closedLeftMenuButtonSFImage: "chevron.left.circle", menuItems: menuItems, accountView: AnyView(AccountView()), userData: CDUserData(userName: "Chris", imageUrl: "turtlerock"))
            }
        }
        catch {
            print("-- CDLeftMenu Configuration Error:")
            print(error.localizedDescription)
            return
        }
        
        let cdMainView = CDLeftMenuMainView(configuration: leftMenuConfiguration)
        
        /// Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: cdMainView)
            self.window = window
            window.makeKeyAndVisible()
        }
        
        // MARK: - END OF LEFT MENU CONFIGURATION AND CREATION
        
        
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

