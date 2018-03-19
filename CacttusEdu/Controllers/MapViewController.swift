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
  
    lazy var locationManager: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationManager()
    }
    
    private func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    private func zoomLocation(_ coordinate: CLLocationCoordinate2D){
        let span = MKCoordinateSpanMake(0.2, 0.2)
        let region = MKCoordinateRegion.init(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    private func addAnnotationTo(_ coordinate: CLLocationCoordinate2D){
        let annotation = MKPointAnnotation()
        annotation.title = "Ferizaj"
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
    }
    
    
}

extension MapViewController : CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let coordinate: CLLocationCoordinate2D = manager.location!.coordinate
        //zoomLocation(coordinate)
        //print("U thirr delegati per lokacionin e ri, me kordinaten: \(coordinate)")
    }
    
}

extension MapViewController : MKMapViewDelegate{
 
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        mapView.showsUserLocation = true
        //let prishtinaCoordinate = CLLocationCoordinate2D(latitude: 42.651529, longitude: 21.161506)
        //42.3665232,21.1131999,13z
        let ferizajCoordinate = CLLocationCoordinate2D.init(latitude: 42.3665232, longitude: 21.1131999)
        zoomLocation(ferizajCoordinate)
        addAnnotationTo(ferizajCoordinate)

        
        let ferizajPakMaAnejCoordinate = CLLocationCoordinate2D.init(latitude: 42.370154, longitude: 21.150055)
        addAnnotationTo(ferizajPakMaAnejCoordinate)
        
    }
}
