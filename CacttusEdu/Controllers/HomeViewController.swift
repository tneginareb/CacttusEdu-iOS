//
//  ViewController.swift
//  CacttusEdu
//
//  Created by Gent Berani on 2/14/18.
//  Copyright © 2018 CacttusEdu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var firstLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstLabel.text = "Hello World"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondController = segue.destination as? SecondViewController
        secondController?.test = "Hello from HomeViewController"
    }
    
    @IBAction func topButtonPressed(_ sender: UIButton) {
        firstLabel.text = "Ndryshimi i Labeles"
    }
    @IBAction func searchButtonPressed(_ sender: UIBarButtonItem) {
        //TODO: Me kalu ne SearchController
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let searchController = storyboard.instantiateViewController(withIdentifier: "searchViewControllerID") as! SearchViewController
        //self.navigationController?.pushViewController(searchController, animated: true)
        self.navigationController?.pushWithAnim(viewController: searchController)
    }
    
    @IBAction func onLabelaEParePressed(_ sender: UITapGestureRecognizer) {
        firstLabel.text = "Touched!"
    }
}

