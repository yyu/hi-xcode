//
//  AppDelegate.swift
//  RandomPassword
//
//  Created by Yuan Yu on 12/31/18.
//  Copyright © 2018 Y². All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var mainWindowController: MainWindowController?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create a window controller with a XIB file of the same name
        let mainWindowController = MainWindowController(windowNibName: "MainWindowController")

        // Put the window of the window controller on screen
        mainWindowController.showWindow(self)

        // Set the property to point to the window controller
        self.mainWindowController = mainWindowController
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

