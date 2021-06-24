//
//  ViewController.swift
//  HelloWorld
//
//  Created by Maya Rosmarin on 6/23/21.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet var nameField: NSTextField!
    
    @IBOutlet var label: NSTextField!
    
    @IBAction func sayButtonClicked(_ sender: Any) {
        var name = nameField.stringValue
        if name.isEmpty {
            name = "World"
        }
        let greeting = "Hello \(name)!"
        
        label.stringValue = greeting
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

