//
//  QytetetViewController.swift
//  CacttusEdu
//
//  Created by Gent Berani on 4/16/18.
//  Copyright © 2018 CacttusEdu. All rights reserved.
//

import UIKit

class QytetetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let titleLabel: UILabel = cell.viewWithTag(10) as! UILabel
        titleLabel.text = "Hello from position :\(indexPath.row)"
        
        return cell
    }
    
    
}
