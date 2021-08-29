//
//  PhotoGallery.swift
//  myProject
//
//  Created by macbook on 17.03.2021.
//  Copyright © 2021 macbook. All rights reserved.
//

import Foundation
import UIKit

class PhotoGallery{
    var images = [UIImage]()
    
    init() {
        setupGallery()
    }
    
    func setupGallery(){
        for i in 0...6{
            let image = UIImage(named: "image\(i)")!
            images.append(image)
            //цикл заполнение массива фотографиями
        }
    }
}
