//
//  HomeCollectionViewCell.swift
//  mashup09
//
//  Created by 이재성 on 30/06/2018.
//  Copyright © 2018 mashup. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    func setImage(image: UIImage) {
        imageView.image = image
    }
}
