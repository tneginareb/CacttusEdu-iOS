//
//  SearchViewController.swift
//  CacttusEdu
//
//  Created by Gent Berani on 2/21/18.
//  Copyright © 2018 CacttusEdu. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let textWithSpaces = "hello @world.com"
        let textWithoutSpaces = textWithSpaces.removingWhiteSpaces()
        print("textWithoutSpaces: \(textWithoutSpaces)")
        
        let textWithOnlySpaces = "  "
        let emptyText = ""
        print("1. \(textWithOnlySpaces.isEmptyOrWhitespace())")
        print("2. \(emptyText.isEmptyOrWhitespace())")
        
        
        let pi: Double = 3.142898.rounded(toPlaces: 4)
        print("Double value: \(pi)")
        
    }

}
