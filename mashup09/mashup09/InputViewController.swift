//
//  InputViewController.swift
//  mashup09
//
//  Created by svmmac on 2018. 6. 30..
//  Copyright © 2018년 mashup. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {
    
    @IBOutlet weak var nextButtonDummyView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    @IBAction func 닫기버튼액션(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
