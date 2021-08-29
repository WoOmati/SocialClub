//
//  FriedProfileViewController.swift
//  myProject
//
//  Created by macbook on 17.04.2021.
//  Copyright © 2021 macbook. All rights reserved.
//

import UIKit

class FriedProfileViewController: UIViewController {
    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var friendCityLabel: UILabel!
    @IBOutlet weak var friendImageView: UIImageView!
    var user:User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendNameLabel.text = user.name
        friendCityLabel.text = user.city
        friendImageView.image = user.image
        
        friendImageView.layer.borderWidth = 3.0
        
        if user.gender == .male {
            friendImageView.layer.borderColor = UIColor.blue.cgColor
        }else{
            friendImageView.layer.borderColor = UIColor.systemPink.cgColor

        }

    }
}
