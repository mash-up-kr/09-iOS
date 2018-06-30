//
//  Home09ItemsTableViewCell.swift
//  mashup09
//
//  Created by 이재성 on 30/06/2018.
//  Copyright © 2018 mashup. All rights reserved.
//

import UIKit

class Home09ItemsTableViewCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(_ index: Int) {
        let data = DataManager.share.groupPurchaseData[index]
        itemImageView.image = data.itemImages.first
        subjectLabel.text = data.subject
        contentLabel.text = data.content
    }
}
