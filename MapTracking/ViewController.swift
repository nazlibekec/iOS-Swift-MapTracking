//
//  ViewController.swift
//  MapTracking
//
//  Created by Nazlı Bekeç on 11.02.2023.
//

import UIKit
import MapKit


class ViewController: UIViewController, MKMapViewDelegate{

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self

        
        var locationList = [CLLocationCoordinate2D(latitude: 39.958448, longitude: 32.855009),
                            CLLocationCoordinate2D(latitude: 39.959303, longitude: 32.863849),
                            CLLocationCoordinate2D(latitude: 39.958448, longitude: 32.877153)]
        
        
        let annotation1 = Annotation(coordinate: locationList[0])
        mapView.addAnnotation(annotation1)
        
        let annotation2 = Annotation(coordinate: locationList[1])
        mapView.addAnnotation(annotation2)
        
        let annotation3 = Annotation(coordinate: locationList[2])
        mapView.addAnnotation(annotation3)
        
        
        let span = MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
        let region = MKCoordinateRegion(center:locationList[1] , span: span)
        mapView.setRegion(region, animated: true)
    }

}

