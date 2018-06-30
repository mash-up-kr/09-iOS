//
//  AddDetailTableViewController.swift
//  mashup09
//
//  Created by svmmac on 2018. 7. 1..
//  Copyright © 2018년 mashup. All rights reserved.
//

import UIKit

class AddDetailTableViewController: UITableViewController {

    @IBOutlet weak var dateTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
        //        dateFormatter.timeStyle = DateFormatter.Style.short
        dateTextField.text = dateFormatter.string(from: sender.date)
    }

}
