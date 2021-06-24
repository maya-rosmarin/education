//
//  AppDelegate.swift
//  EggTimer
//
//  Created by Maya Rosmarin on 6/23/21.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    
    @IBOutlet var startTimerMenuItem: NSMenuItem!
    
    @IBOutlet var stopTimerMenuItem: NSMenuItem!
    
    @IBOutlet var resetTimerMenuItem: NSMenuItem!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

