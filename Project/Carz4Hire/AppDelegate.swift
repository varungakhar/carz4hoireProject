//
//  AppDelegate.swift
//  Carz4Hire
//
//  Created by user on 3/1/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps

import Stripe
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
var userData = UserDefaults()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
       // STPPaymentConfiguration.shared().publishableKey = "pk_test_6XeEDwEBDmQCDG1RvWYpTBDn"
        STPPaymentConfiguration.shared().publishableKey = "pk_live_3QMmFIh8I3TImS1my0ko43rU"
        
        // do any other necessary launch configuration
        GMSPlacesClient.provideAPIKey("AIzaSyDlrQ6AvB59AnKN14GHJ0Vs88qU9_4--BA")
        GMSServices.provideAPIKey("AIzaSyDlrQ6AvB59AnKN14GHJ0Vs88qU9_4--BA")
     //AIzaSyBIscXnlg5TC6noyOPuC1LhkS9kZr6gtz -_MI
        
        if(!(userData.value(forKey: "emailSave") == nil))
        {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let otherVC = sb.instantiateViewController(withIdentifier: "navigationBooking") as! UINavigationController
      
            window?.rootViewController = otherVC;
        }
//
   
        // Override point for customization after application launch.
        return true
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

