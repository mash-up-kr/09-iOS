//
//  ViewController.swift
//  mashup09
//
//  Created by 이재성 on 30/06/2018.
//  Copyright © 2018 mashup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    enum Sections: Int {
        case collection
        case itemsHeader
        case items
    
        static var count: Int { return Sections.items.hashValue + 1 }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: .dataAdded, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: .dataAdded, object: nil)
    }
    
    @objc func reloadTableView(notification: NSNotification) {
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let setctions = Sections(rawValue: section) else { return 0 }
        
        switch setctions {
        case .collection:
            return 1
        case .itemsHeader:
            return 1
        case .items:
            return DataManager.share.groupPurchaseData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sections = Sections(rawValue: indexPath.section) else { return UITableViewCell() }
        
        switch sections {
        case .collection:
            guard let homeCollectionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HomeCollectionTableViewCell", for: indexPath) as? HomeCollectionTableViewCell else { return UITableViewCell() }
            return homeCollectionTableViewCell
        case .itemsHeader:
            let recentTableViewCell = tableView.dequeueReusableCell(withIdentifier: "RecentTabelViewCell", for: indexPath)
            return recentTableViewCell
        case .items:
            guard let home09ItemsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Home09ItemsTableViewCell", for: indexPath) as? Home09ItemsTableViewCell else { return UITableViewCell() }
            home09ItemsTableViewCell.configureCell(indexPath.row)
            return home09ItemsTableViewCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
