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
    
    lazy var qytetet: [Qytet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func fillQytetetArray(){
        let prishtina = Qytet.init(id: 1, name: "Prishtina")
        qytetet.append(prishtina)
        
        let lipjani = Qytet.init(id: 2, name: "Lipjan City")
        qytetet.append(lipjani)
        
        let ferizaj = Qytet.init(id: 3, name: "Ferizaj")
        qytetet.append(ferizaj)
        
        let podujeva = Qytet.init(id: 4, name: "Podujeva")
        qytetet.append(podujeva)
        
        let tirana = Qytet.init(id: 5, name: "Tirana")
        qytetet.append(tirana)
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        fillQytetetArray()
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return qytetet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let qyteti = qytetet[indexPath.row]
        
        let titleLabel: UILabel = cell.viewWithTag(10) as! UILabel
        titleLabel.text = "\(qyteti.name)"
        
        return cell
    }
    
    
}
