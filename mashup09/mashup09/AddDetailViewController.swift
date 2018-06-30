//
//  AddDetailViewController.swift
//  mashup09
//
//  Created by Daeyun Ethan Kim on 30/06/2018.
//  Copyright © 2018 mashup. All rights reserved.
//

import UIKit

class AddDetailViewController: UIViewController {

    @IBOutlet weak var confirmButtonDummyView: UIView!
    @IBOutlet weak var confirmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddDetailContainerSegue",
            let controller = segue.destination as? AddDetailTableViewController {
            controller.delegate = self
        }
    }
    
    @IBAction func actionClose(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func actionConfirm(_ sender: UIButton) {
        performSegue(withIdentifier: "AddConfirmSegue", sender: nil)
    }
}

// MARK: -
extension AddDetailViewController: AddDetailTableViewControllerDelegate {
    func buttonEnable(_ dateTextFieldIsEmpty: Bool?, amountTextFieldIsEmpty: Bool?, locationTextFieldIsEmpty: Bool?) {
        
        if let dateTextFieldIsEmpty = dateTextFieldIsEmpty,
            let amountTextFieldIsEmpty = amountTextFieldIsEmpty,
            let locationTextFieldIsEmpty = locationTextFieldIsEmpty,
            !dateTextFieldIsEmpty, !amountTextFieldIsEmpty, !locationTextFieldIsEmpty {
            confirmButton.backgroundColor = UIColor(red: 252/255, green: 178/255, blue: 57/255, alpha: 1.0)
            confirmButtonDummyView.backgroundColor = UIColor(red: 252/255, green: 178/255, blue: 57/255, alpha: 1.0)
            confirmButton.isEnabled = true
        } else {
            confirmButton.backgroundColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1.0)
            confirmButtonDummyView.backgroundColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1.0)
            confirmButton.isEnabled = false
        }
    }
}
