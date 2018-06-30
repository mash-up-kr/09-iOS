//
//  AddDetailViewController.swift
//  mashup09
//
//  Created by Daeyun Ethan Kim on 30/06/2018.
//  Copyright © 2018 mashup. All rights reserved.
//

import UIKit

class AddDetailViewController: UIViewController {

    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actionClose(_ sender: UIButton) {
        navigationController?.dismiss(animated: true)
    }
    
    @IBAction func actionPrev(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionConfirm(_ sender: UIButton) {
        navigationController?.dismiss(animated: true)
    }
}
