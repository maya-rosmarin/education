//
//  ViewController.swift
//  MadLibs
//
//  Created by Maya Rosmarin on 6/25/21.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet var pastTenseVerbTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pastTenseVerbTextField.stringValue = "ate"

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

