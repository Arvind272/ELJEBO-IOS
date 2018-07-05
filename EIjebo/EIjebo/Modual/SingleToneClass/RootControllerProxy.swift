 //
 //  RootControllerProxy.swift
 //  Foosto
 //
 //  Created by Sukhpreet Kaur on 3/10/18.
 //  Copyright © 2018 Sukhpreet Kaur. All rights reserved.
 //
 import Foundation
 import UIKit
 import SWRevealViewController
 class RootControllerProxy {
    static var shared: RootControllerProxy {
        return RootControllerProxy()
    }
    fileprivate init(){}
    
    func rootWithoutDrawer(_ storyboardVal:UIStoryboard,identifier: String){
        let blankController = storyboardVal.instantiateViewController(withIdentifier: identifier)
        var homeNavController:UINavigationController = UINavigationController()
        homeNavController = UINavigationController.init(rootViewController: blankController)
        homeNavController.isNavigationBarHidden = true
        KAppDelegate.window!.rootViewController = homeNavController
        KAppDelegate.window!.makeKeyAndVisible()
        
    }
    
    func goWithDrawer(storyboard: UIStoryboard, identifier: String){
        let mainViewController = storyboard.instantiateViewController(withIdentifier:identifier)
        let sideViewController = storyboard.instantiateViewController(withIdentifier: "DrawerVC")
        let mainNav: UINavigationController = UINavigationController(rootViewController: mainViewController)
        let sideNav: UINavigationController = UINavigationController(rootViewController: sideViewController)
        let mainRevealController = SWRevealViewController(rearViewController: sideViewController, frontViewController: mainNav)
        mainRevealController?.rearViewRevealWidth = 250
        mainRevealController?.delegate = mainViewController as? SWRevealViewControllerDelegate
        let swRevealViewController: SWRevealViewController!
        swRevealViewController = mainRevealController
        KAppDelegate.swRevealController = mainRevealController
        
        KAppDelegate.window?.rootViewController = swRevealViewController
        KAppDelegate.window?.makeKeyAndVisible()
        mainNav.isNavigationBarHidden = true
        sideNav.isNavigationBarHidden = true
    }
 
 }
