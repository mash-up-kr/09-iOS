//
//  AddDetailTableViewController.swift
//  mashup09
//
//  Created by svmmac on 2018. 7. 1..
//  Copyright © 2018년 mashup. All rights reserved.
//

import UIKit

protocol AddDetailTableViewControllerDelegate: class {
    func buttonEnable(_ dateTextFieldIsEmpty: Bool?,
                      amountTextFieldIsEmpty: Bool?,
                      locationTextFieldIsEmpty: Bool?)
}

class AddDetailTableViewController: UITableViewController {

    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    weak var delegate: AddDetailTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountTextField.delegate = self
        locationTextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    @IBAction func textFieldEditing(_ sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.dateAndTime
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(datePickerValueChanged), for: UIControlEvents.valueChanged)
    }
    
    @objc func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd hh:mm a"
        dateTextField.text = dateFormatter.string(from: sender.date)
        
        view.endEditing(true)
        delegate?.buttonEnable(dateTextField.text?.isEmpty,
                               amountTextFieldIsEmpty: amountTextField.text?.isEmpty,
                               locationTextFieldIsEmpty: locationTextField.text?.isEmpty)
    }
}


// MARK: - UITextFieldDelegate
extension AddDetailTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        delegate?.buttonEnable(dateTextField.text?.isEmpty,
                               amountTextFieldIsEmpty: amountTextField.text?.isEmpty,
                               locationTextFieldIsEmpty: locationTextField.text?.isEmpty)
        return true
    }
}
