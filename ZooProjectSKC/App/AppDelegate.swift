//
//  AppDelegate.swift
//  ZooProjectSKC
//
//  Created by Dana Emile de Castro da Costa on 12/11/26.
//
import UIKit


class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
    -> Bool {
        print ("APPLICATION")
        return true
    }
    func applicationWithWillResignActive(_application: UIApplication) {
        print("APPLICATION WILL RESIGN ACTIVE")
    }
    func applicationDidEnterBackground(_application: UIApplication) {
        print("APPLICATION DID ENTER BACKGROUND")
    }
    func applicationWillEnterForeground(_application: UIApplication) {
        print("APPLICATION WILL ENTER FOREGROUND")
    }
    func applicationDidBecomeActive(_application: UIApplication) {
        print("APPLICATION DID BECOME ACTIVE")
    }
    func applicationWillTerminate(_application: UIApplication) {
        print("APPLICATION DID BECOME ACTIVE")
    }
}

