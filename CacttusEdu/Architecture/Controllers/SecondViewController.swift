//
//  SecondViewController.swift
//  CacttusEdu
//
//  Created by Gent Berani on 2/14/18.
//  Copyright © 2018 CacttusEdu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var test: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Greetings from: \(test)")
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
