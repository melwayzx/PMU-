//
//  PMU_App.swift
//  PMU!
//
//  Created by Melwayz's  on 7/2/21.
//

import SwiftUI
import UIKit
import GoogleMaps
import GooglePlaces

class AppDelegate: NSObject, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        GMSServices.provideAPIKey("AIzaSyDpMwytCJjQzbK-UsscFycBVsOwR-08jTY")
        GMSPlacesClient.provideAPIKey("AIzaSyDpMwytCJjQzbK-UsscFycBVsOwR-08jTY")
        return true
    }
}

@main
struct PMU_App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

    


