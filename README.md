# CDSideMenu
> An elegant side menu for you app, made with love and SwiftUI.

CDSideMenu is a highly customizable side menu library made for SwiftUI for you apps. 

![](demo_basic.gif) ![](demo_favorite.gif) ![](demo_custom.gif)

## Features

- [x] An animated Side Menu with your own menu item
- [x] A high level of configuration to fit your app design
- [x] 3 pre-configured style for your convenience
- [x] A verbose configurator to let you know if your current configuration is right, or not
- [x] An observable UserData class model that you can extend to add your own properties
- [x] A list of example views to illustrate the usage of this library

## Coming soon features

- [x] Side menu opening alignment (left, right)
- [x] Landscape mode
- [x] CocoaPods integration


## Customizable properties

- [x] navigationBarHidden: Will hide the navigationBar. If hidden, a open/close button will be added
- [x] accountViewHidden: Will hide the side menu account view, containing the user profile picture, the username, the account and logout buttons: The side menu backgroundColor
- [x] menuBackgroundColor: The side menu backgroundColor
- [x] menuForegroundColor: The side menu texts and SF images color
- [x] viewsBackgroundColor: The content views' backgroundColor
- [x] menuFont: The side menu texts font
- [x] menuButtonSize: The open/close menu button size
- [x] menuSizeFactor: The menu size factor, 1 being half screen size
- [x] openedMenuButtonSFImage: The SF image used as the opened side menu button icon
- [x] closedMenuButtonSFImage: The SF image used as the closed side menu button icon
- [x] menuItems: The list of items to display in the side menu
- [x] userData: The ObservableObject user account data, optional

## Requirements

- iOS 13 or above
- Swift 5.2
- Xcode 11.4

## Installation

At the moment, the library is not available through CocoaPods yet. 
#### CocoaPods
You can use [CocoaPods](http://cocoapods.org/) to install `YourLibrary` by adding it to your `Podfile`:

```ruby
platform :ios, '8.0'
use_frameworks!
pod 'YourLibrary'
```

To get the full benefits import `YourLibrary` wherever you import UIKit

``` swift
import UIKit
import YourLibrary
```
#### Carthage
Create a `Cartfile` that lists the framework and run `carthage update`. Follow the [instructions](https://github.com/Carthage/Carthage#if-youre-building-for-ios) to add `$(SRCROOT)/Carthage/Build/iOS/YourLibrary.framework` to an iOS project.

```
github "yourUsername/yourlibrary"
```
#### Manually
1. Download and drop ```YourLibrary.swift``` in your project.  
2. Congratulations!  

## Usage example

```swift
import EZSwiftExtensions
ez.detectScreenShot { () -> () in
    print("User took a screen shot")
}
```

## Contribute

We would love you for the contribution to **YourLibraryName**, check the ``LICENSE`` file for more info.

## Meta

Your Name – [@YourTwitter](https://twitter.com/dbader_org) – YourEmail@example.com

Distributed under the XYZ license. See ``LICENSE`` for more information.

[https://github.com/yourname/github-link](https://github.com/dbader/)

[swift-image]:https://img.shields.io/badge/swift-3.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com
