//
//  ViewController.swift
//  MapTracking
//
//  Created by Nazlı Bekeç on 11.02.2023.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var timer = Timer()
    var index = 0
    
    let locations: [CLLocationCoordinate2D] = [
        CLLocationCoordinate2D(latitude: 39.958634, longitude: 32.856416),
        CLLocationCoordinate2D(latitude: 39.958602, longitude: 32.856217),
        CLLocationCoordinate2D(latitude: 39.958509, longitude: 32.855407),
        CLLocationCoordinate2D(latitude: 39.958351, longitude: 32.854280),
        CLLocationCoordinate2D(latitude: 39.958219, longitude: 32.853513),
        CLLocationCoordinate2D(latitude: 39.958104, longitude: 32.852596),
        CLLocationCoordinate2D(latitude: 39.958020, longitude: 32.851894),
        CLLocationCoordinate2D(latitude: 39.957901, longitude: 32.851142),
        CLLocationCoordinate2D(latitude: 39.957802, longitude: 32.850424),
        CLLocationCoordinate2D(latitude: 39.957691, longitude: 32.849689),
        CLLocationCoordinate2D(latitude: 39.957568, longitude: 32.848938),
        CLLocationCoordinate2D(latitude: 39.957391, longitude: 32.848197),
        CLLocationCoordinate2D(latitude: 39.957202, longitude: 32.847564),
        CLLocationCoordinate2D(latitude: 39.956922, longitude: 32.846819),
        CLLocationCoordinate2D(latitude: 39.956614, longitude: 32.846105),
        CLLocationCoordinate2D(latitude: 39.956355, longitude: 32.845488),
        CLLocationCoordinate2D(latitude: 39.956087, longitude: 32.844893),
        CLLocationCoordinate2D(latitude: 39.955767, longitude: 32.844120),
        CLLocationCoordinate2D(latitude: 39.955462, longitude: 32.843386)
    ]

    var annotation : Annotation? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateMap), userInfo: nil, repeats: true)
      
        createMap()
    }

    @objc func updateMap(){
        if(index < locations.count){
            annotation = Annotation(title: "06ABC001",subTitle: "Chevrolet Cruze",coordinate: locations[index])
            removeAnnotations()
            mapView.addAnnotation(annotation!)
            
            let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            let region = MKCoordinateRegion(center:locations[index],span: span)
            mapView.setRegion(region, animated: true)
            print("Map is updated to location:"  + stringFromCoordinate(coordinate: locations[index]))
            index+=1
        }
        
    }
    
    func stringFromCoordinate(coordinate: CLLocationCoordinate2D) -> String {
        return "\(coordinate.latitude), \(coordinate.longitude)"
    }
    
    @objc func createMap(){
        let span = MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
        let region = MKCoordinateRegion(center:locations[0] , span: span)
        mapView.setRegion(region, animated: true)
        annotation = Annotation(coordinate: locations[0])
        mapView.addAnnotation(annotation!)
    }
    
    func removeAnnotations(){
        let allAnnotations = mapView.annotations
        mapView.removeAnnotations(allAnnotations)
    }
}

