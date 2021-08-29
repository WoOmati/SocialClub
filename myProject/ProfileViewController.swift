//
//  ViewController.swift
//  myProject
//
//  Created by macbook on 17.02.2021.
//  Copyright © 2021 macbook. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //переменные
    let countCell = 3
    let offset: CGFloat = 2.0
    let cellId = "cell"
    //аутлеты, экшены
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ImageCollectionview: UICollectionView!
    @IBOutlet weak var avatarImage: UIImageView!
    
    let photoGallery = PhotoGallery()
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        
        UIApplication.shared
        super.viewDidLoad()
        ImageCollectionview.dataSource = self
        ImageCollectionview.delegate = self
        imagePicker.delegate = self
        

        ImageCollectionview.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellId)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnImage(_ :)))
        avatarImage.addGestureRecognizer(tapGesture)
        avatarImage.isUserInteractionEnabled = true

        avatarImage.layer.borderWidth = 3.0
        //размер рамки аватара
        avatarImage.layer.borderColor = UIColor.lightGray.cgColor
        //цвет рамки обводки аватара

        
    }
    @objc func tapOnImage(_ sender: UITapGestureRecognizer){
        let alert = UIAlertController(title: "Изображения", message: nil, preferredStyle: .actionSheet)
        let actionPhoto = UIAlertAction(title: "Фотогалерея", style: .default) {  (alert) in
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let actionCamera = UIAlertAction(title: "Камера", style: .default) { (alert) in
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let actionCancel = UIAlertAction(title: "Отменв", style: .cancel, handler: nil)
        
        alert.addAction(actionPhoto)
        alert.addAction(actionCamera)
        alert.addAction(actionCancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let name = UserDefaults.standard.string(forKey: "nameKey"){
            nameLabel.text = name
        }
    }
    
}
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoGallery.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ImageCollectionViewCell
        let image = photoGallery.images[indexPath.item]
        cell.photoView.image = image
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameVC = collectionView.frame
        
        let widthCell = frameVC.width / CGFloat(countCell)
        let heightCell = widthCell
        
        let spacing = CGFloat((countCell + 1)) * offset / CGFloat(countCell)
        return CGSize(width: widthCell - spacing, height: heightCell - (offset * 2))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "FullScreenViewController") as! FullScreenViewController
        vc.photoGallery = photoGallery
        vc.indexPath = indexPath
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}
extension ProfileViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedimage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            avatarImage.image = pickedimage
        }
        dismiss(animated: true, completion: nil) 
    }
}
