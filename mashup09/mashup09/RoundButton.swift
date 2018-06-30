//
//  RoundButton.swift
//  mashup09
//
//  Created by svmmac on 2018. 7. 1..
//  Copyright © 2018년 mashup. All rights reserved.
//

import UIKit

class RoundButton: UILabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 11
        clipsToBounds = true
    }
}
