//
//  AddContentViewController.swift
//  mashup09
//
//  Created by Daeyun Ethan Kim on 30/06/2018.
//  Copyright © 2018 mashup. All rights reserved.
//

import UIKit
import ImagePicker

class AddContentViewController: UIViewController {

    @IBOutlet weak var selectButtonDummyView: UIView!
    @IBOutlet weak var selectButton: UIButton!
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
        dismiss(animated: true)
    }
    
    @IBAction func actionSelectImage(_ sender: UIButton) {
        if let subject = textField.text {
            DataManager.share.dummyData.subject = subject
            DataManager.share.dummyData.content = textView.text
        }
        
        let imagePickerController = ImagePickerController()
        imagePickerController.delegate = self
        present(imagePickerController, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension AddContentViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text,
            !text.isEmpty,
            !textView.text.isEmpty {
                selectButton.backgroundColor = UIColor(red: 252/255, green: 178/255, blue: 57/255, alpha: 1.0)
            selectButtonDummyView.backgroundColor = UIColor(red: 252/255, green: 178/255, blue: 57/255, alpha: 1.0)
            selectButton.isEnabled = true
        } else {
            selectButton.backgroundColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1.0)
            selectButtonDummyView.backgroundColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1.0)
            selectButton.isEnabled = false
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
            selectButton.backgroundColor = UIColor(red: 252/255, green: 178/255, blue: 57/255, alpha: 1.0)
            selectButtonDummyView.backgroundColor = UIColor(red: 252/255, green: 178/255, blue: 57/255, alpha: 1.0)
            selectButton.isEnabled = true
        } else {
            selectButton.backgroundColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1.0)
            selectButtonDummyView.backgroundColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1.0)
            selectButton.isEnabled = false
        }
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        
        return true
    }
}

// MARK: - ImagePickerDelegate
extension AddContentViewController: ImagePickerDelegate {
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        print("wrapperDidPress")
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        print("doneButtonDidPress")
        
        DataManager.share.dummyData.itemImages = images
        dismiss(animated: true) { [weak self] in
            self?.performSegue(withIdentifier: "AddDetailSegue", sender: nil)
        }
    }
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        print("cancelButtonDidPress")
        dismiss(animated: true)
    }
}


