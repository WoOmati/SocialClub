//
//  SettingsTableViewController.swift
//  myProject
//
//  Created by macbook on 06.04.2021.
//  Copyright © 2021 macbook. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    let nameKey = "nameKey"
    let soundKey = "soundKey"
    let volumeKey = "volumeKey"


    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var soundSwitch: UISwitch!
    @IBOutlet weak var volumeSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSettings()

    }
        func loadSettings(){
            if let name = UserDefaults.standard.string(forKey: nameKey){
                nameField.text = name
        }
            soundSwitch.isOn = UserDefaults.standard.bool(forKey: soundKey)
            volumeSlider.value = UserDefaults.standard.float(forKey: volumeKey)
    }
    
    
    @IBAction func soundAction(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: soundKey)
    }
    @IBAction func volumeAction(_ sender: UISlider) {
        UserDefaults.standard.set(sender.value, forKey: volumeKey)
    }
    @IBAction func changeNameAction(_ sender: UITextField) {
        if (sender.text != nil) {
        UserDefaults.standard.set(sender.text!, forKey: nameKey)
    }
        
    }
    
}
