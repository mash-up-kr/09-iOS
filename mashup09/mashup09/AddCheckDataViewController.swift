//
//  AddCheckDataViewController.swift
//  mashup09
//
//  Created by Daeyun Ethan Kim on 01/07/2018.
//  Copyright © 2018 mashup. All rights reserved.
//

import UIKit

class AddCheckDataViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func actionClose(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func actionConfirm(_ sender: UIButton) {
        DataManager.share.groupPurchaseData.append(DataManager.share.dummyData)
        NotificationCenter.default.post(name: .dataAdded, object: nil)
        dismiss(animated: true)
    }
}


