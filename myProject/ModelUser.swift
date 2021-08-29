//
//  ModelUser.swift
//  myProject
//
//  Created by macbook on 17.04.2021.
//  Copyright © 2021 macbook. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class ModelUser {
    var users = [[User]]()
    init() {
        setup()
    }
    
    func setup () {
        let man1 = User(name: "Мага", city: "Махачкала", image: UIImage(named: "image6")!, gender: .male, coordinate: CLLocationCoordinate2D(latitude: 55.755186, longitude: 37.617933))
        let man2 = User(name: "Абу", city: "Каспийск", image: UIImage(named: "image6")!, gender: .male, coordinate: CLLocationCoordinate2D(latitude: 55.755986, longitude: 37.616933))
        
        let manArray = [man1, man2]
        
        let woman1 = User(name: "Патя", city: "Буйнакск", image: UIImage(named: "image3")!, gender: .female, coordinate: CLLocationCoordinate2D(latitude: 55.753186, longitude: 37.618933))
        let woman2 = User(name: "Хадя", city: "Дербент", image: UIImage(named: "image3")!, gender: .female, coordinate: CLLocationCoordinate2D(latitude: 55.757186, longitude: 37.616933))
        
        
        let womanArray = [woman1, woman2]
        
        users.append(womanArray)
        users.append(manArray)

    }
}
