//
//  FullScreenCollectionViewCell.swift
//  myProject
//
//  Created by macbook on 17.03.2021.
//  Copyright © 2021 macbook. All rights reserved.
//

import UIKit

class FullScreenCollectionViewCell: UICollectionViewCell, UIScrollViewDelegate {
    @IBOutlet weak var ScrollView: UIScrollView!
    
    @IBOutlet weak var PhotoView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.ScrollView.delegate = self
        self.ScrollView.minimumZoomScale = 1.0
        self.ScrollView.maximumZoomScale = 3.5
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return PhotoView
    }
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        
        print("did end zoom")
        return ScrollView.zoomScale = 1.0
    }

}
