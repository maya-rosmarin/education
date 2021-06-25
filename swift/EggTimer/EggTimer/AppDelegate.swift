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
        enableMenus(start: true, stop: false, reset: false)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func enableMenus(start: Bool, stop: Bool, reset: Bool) {
        startTimerMenuItem.isEnabled = start
        stopTimerMenuItem.isEnabled = stop
        resetTimerMenuItem.isEnabled = reset
    }

}

