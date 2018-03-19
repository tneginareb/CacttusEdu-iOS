//
//  MapViewController.swift
//  CacttusEdu
//
//  Created by Gent Berani on 3/19/18.
//  Copyright © 2018 CacttusEdu. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func zoomLocation(_ coordinate: CLLocationCoordinate2D){
        let span = MKCoordinateSpanMake(0.2, 0.2)
        let region = MKCoordinateRegion.init(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
}

extension MapViewController : MKMapViewDelegate{
 
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        mapView.showsUserLocation = true
        let prishtinaCoordinate = CLLocationCoordinate2D(latitude: 42.651529, longitude: 21.161506)
        zoomLocation(prishtinaCoordinate)
    }
}
