//
//  AddCheckDataTableViewController.swift
//  mashup09
//
//  Created by Daeyun Ethan Kim on 01/07/2018.
//  Copyright © 2018 mashup. All rights reserved.
//

import UIKit

class AddCheckDataTableViewController: UITableViewController {

    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var content: JSGrowingTextView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        category.text = DataManager.share.dummyData.category
        subject.text = DataManager.share.dummyData.subject
        content.text = DataManager.share.dummyData.content
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
}

// MARK: -
extension AddCheckDataTableViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataManager.share.dummyData.itemImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddCheckDataCollectionViewCell", for: indexPath) as? AddCheckDataCollectionViewCell else {
            return UICollectionViewCell()
        }
        let image = DataManager.share.dummyData.itemImages[indexPath.row]
        cell.configureCell(image)
        return cell
    }
}

extension AddCheckDataTableViewController: UICollectionViewDelegate {
}

class AddCheckDataCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    func configureCell(_ image: UIImage) {
        imageView.image = image
    }
}
