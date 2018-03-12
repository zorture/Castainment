//
//  AppDelegate.swift
//  Castainment
//
//  Created by Kanwar Zorawar Singh Rana on 3/11/18.
//  Copyright © 2018 Kanwar Zorawar Singh Rana. All rights reserved.
//

import UIKit
import GoogleCast

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private lazy var kReceiverAppID:String = {
        // You can add your own app id here that you get by registering with the
        // Google Cast SDK Developer Console https://cast.google.com/publish
        return kGCKMediaDefaultReceiverApplicationID
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Cast Option
        //let dicoverCriteria = GCKDiscoveryCriteria.init(applicationID: kReceiverAppID)
       // let castOptions = GCKCastOptions.init(receiverApplicationID: kReceiverAppID)
       // GCKCastContext.setSharedInstanceWith(castOptions)
        
        // Set the logger
        GCKLogger.sharedInstance().delegate = self
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

extension AppDelegate : GCKLoggerDelegate{
    func logMessage(_ message: String, at level: GCKLoggerLevel, fromFunction function: String, location: String) {
        print(message + " " + function )
    }
}

