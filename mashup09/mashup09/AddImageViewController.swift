//
//  AddImageViewController.swift
//  mashup09
//
//  Created by Daeyun Ethan Kim on 30/06/2018.
//  Copyright © 2018 mashup. All rights reserved.
//

import UIKit

class AddImageViewController: UIViewController {

    @IBOutlet weak var nextButtonDummyView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    var itemImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.itemSize = CGSize(width: view.frame.width, height: collectionView.frame.height)
    }
    
    @IBAction func actionClose(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    @IBAction func actionNext(_ sender: UIButton) {
        performSegue(withIdentifier: "AddDetailSegue", sender: nil)
    }
    
    @IBAction func actionCamera(_ sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func actionAlbum(_ sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
}

// MARK: - UIImagePickerControllerDelegate
extension AddImageViewController: UIImagePickerControllerDelegate,  UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            itemImages.append(image)
            collectionView.reloadData()
        }else {
            print("something went wrong")
        }
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UICollectionViewDataSource
extension AddImageViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if !itemImages.isEmpty {
        nextButton.backgroundColor = UIColor(red: 252/255, green: 178/255, blue: 57/255, alpha: 1.0)
        nextButtonDummyView.backgroundColor = UIColor(red: 252/255, green: 178/255, blue: 57/255, alpha: 1.0)
        } else {
            nextButton.backgroundColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1.0)
            nextButtonDummyView.backgroundColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1.0)
        }
        return itemImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddImageCell", for: indexPath) as? AddImageCell else {
            return UICollectionViewCell()
        }
        cell.configureCell(itemImages[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension AddImageViewController: UICollectionViewDelegate {
    
}

class AddImageCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    func configureCell(_ image: UIImage) {
        imageView.image = image
    }
}
