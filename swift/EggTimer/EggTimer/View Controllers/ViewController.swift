//
//  ViewController.swift
//  EggTimer
//
//  Created by Maya Rosmarin on 6/23/21.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet var timeLeftField: NSTextField!
    @IBOutlet var eggImageView: NSImageView!
    @IBOutlet var startButton: NSButton!
    @IBOutlet var stopButton: NSButton!
    @IBOutlet var resetButton: NSButton!
    @IBAction func startButtonClicked(_ sender: Any) {
    }
    @IBAction func stopButtonClicked(_ sender: Any) {
    }
    @IBAction func resetButtonClicked(_ sender: Any) {
    }
    @IBAction func startTimerMenuItemSelected(_ sender: Any) {
        startButtonClicked(sender)
    }
    @IBAction func stopTimerMenuItemSelected(_ sender: Any) {
        stopButtonClicked(sender)
    }
    @IBAction func resetTimerMenuItemSelected(_ sender: Any) {
        resetButtonClicked(sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

