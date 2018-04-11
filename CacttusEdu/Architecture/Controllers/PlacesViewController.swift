//
//  PlacesViewController.swift
//  CacttusEdu
//
//  Created by Gent Berani on 4/11/18.
//  Copyright © 2018 CacttusEdu. All rights reserved.
//

import UIKit

class PlacesViewController: UIViewController {

    lazy var places: [Place] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPlacesData()
    }
    
    private func fetchPlacesData(){
        let prPlace = Place.init(id: 1, name: "Prishtina")
        let lpPlace = Place(id: 2, name: "Lipjan")
        places.append(prPlace)
        places.append(lpPlace)
        
        print("Places count:\(places.count)")
        onSuccessResponse()
        
    }
    
    private func onSuccessResponse(){
        updateViews()
    }
    
    func updateViews(){
        //placeLabel.text = places[0].name
    }
}
