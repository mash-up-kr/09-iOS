//
//  AddContentViewController.swift
//  mashup09
//
//  Created by Daeyun Ethan Kim on 30/06/2018.
//  Copyright © 2018 mashup. All rights reserved.
//

import UIKit

class AddContentViewController: UIViewController {

    @IBOutlet weak var nextButtonDummyView: UIView!
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
    
    @IBAction func actionClose(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    @IBAction func actionNext(_ sender: UIButton) {
        performSegue(withIdentifier: "AddImageSegue", sender: nil)
    }
}

// MARK: - UITextFieldDelegate
extension AddContentViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text,
            !text.isEmpty,
            !textView.text.isEmpty {
                nextButton.backgroundColor = UIColor(red: 252/255, green: 178/255, blue: 57/255, alpha: 1.0)
            nextButtonDummyView.backgroundColor = UIColor(red: 252/255, green: 178/255, blue: 57/255, alpha: 1.0)
        } else {
            nextButton.backgroundColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1.0)
            nextButtonDummyView.backgroundColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1.0)
        }
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - UITextViewDelegate
extension AddContentViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if let text = textField.text,
            !text.isEmpty,
            !textView.text.isEmpty {
            nextButton.backgroundColor = UIColor(red: 252/255, green: 178/255, blue: 57/255, alpha: 1.0)
            nextButtonDummyView.backgroundColor = UIColor(red: 252/255, green: 178/255, blue: 57/255, alpha: 1.0)
        } else {
            nextButton.backgroundColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1.0)
            nextButtonDummyView.backgroundColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1.0)
        }
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        
        return true
    }
}


