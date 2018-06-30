//
//  AddContentViewController.swift
//  mashup09
//
//  Created by Daeyun Ethan Kim on 30/06/2018.
//  Copyright © 2018 mashup. All rights reserved.
//

import UIKit

class AddContentViewController: UIViewController {

    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        textView.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func actionClose(_ sender: UIButton) {
        navigationController?.dismiss(animated: true)
    }
    
    @IBAction func actionPrev(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionNext(_ sender: UIButton) {
        performSegue(withIdentifier: "AddDetailSegue", sender: nil)
    }
}

// MARK: - UITextFieldDelegate
extension AddContentViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - UITextViewDelegate
extension AddContentViewController: UITextViewDelegate {
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
}


