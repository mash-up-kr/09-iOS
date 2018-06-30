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
        case items
    
        static var count: Int { return Sections.items.hashValue + 1 }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func 총대버튼클릭(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Input", bundle: nil)
        let inputViewContoller = storyboard.instantiateViewController(withIdentifier: "InputViewController")
        present(inputViewContoller, animated: true, completion: nil)
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
        case .items:
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sections = Sections(rawValue: indexPath.section) else { return UITableViewCell() }
        
        switch sections {
        case .collection:
            guard let homeCollectionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HomeCollectionTableViewCell", for: indexPath) as? HomeCollectionTableViewCell else { return UITableViewCell() }
            return homeCollectionTableViewCell
        case .items:
            guard let home09ItemsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Home09ItemsTableViewCell", for: indexPath) as? Home09ItemsTableViewCell else { return UITableViewCell() }
            return home09ItemsTableViewCell
        }
    }
}
