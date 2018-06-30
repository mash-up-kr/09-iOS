//
//  DataManager.swift
//  mashup09
//
//  Created by Daeyun Ethan Kim on 01/07/2018.
//  Copyright © 2018 mashup. All rights reserved.
//

import UIKit

struct GroupPurchase {
    var category: String = ""
    var subject: String = ""
    var content: String = ""
    var itemImages: [UIImage] = []
}

class DataManager {
    static let share: DataManager = DataManager()
    
    var dummyData: GroupPurchase = GroupPurchase()
    var groupPurchaseData: [GroupPurchase] = []
}
