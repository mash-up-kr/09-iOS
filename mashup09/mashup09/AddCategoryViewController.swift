//
//  AddCategoryViewController.swift
//  mashup09
//
//  Created by Daeyun Ethan Kim on 30/06/2018.
//  Copyright © 2018 mashup. All rights reserved.
//

import UIKit

enum ItemCategory: Int {
    case cosmetic
    case food
    case clothes
    case device
    case netflix
    case `default`
    
    func toString() -> String {
        switch self {
        case .cosmetic:
            return "화장품"
        case .food:
            return "음식"
        case .clothes:
            return "옷"
        case .device:
            return "기기"
        case .netflix:
            return "넷플릭스"
        default:
            return ""
        }
    }
}

class AddCategoryViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actionClose(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func actionNext(_ sender: UIButton) {
        performSegue(withIdentifier: "AddContentSegue", sender: nil)
    }
}

// MARK: - UITableViewDataSource
extension AddCategoryViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemCategory.default.rawValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddCategoryCell", for: indexPath) as? AddCategoryCell else {
            return UITableViewCell()
        }
        cell.configureCell(indexPath.row)

        return cell
    }
}

// MARK: - UITableViewDelegate
extension AddCategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        nextButton.isEnabled = true
    }
}

class AddCategoryCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    func configureCell(_ index: Int) {
        titleLabel.text = ItemCategory(rawValue: index)?.toString()
    }
}
