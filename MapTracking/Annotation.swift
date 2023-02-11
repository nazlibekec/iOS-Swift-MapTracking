//
//  Annotation.swift
//  MapTracking
//
//  Created by Nazlı Bekeç on 11.02.2023.
//

import MapKit

class Annotation: NSObject, MKAnnotation {
    
    var title:  String?
    var subTitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String? = nil, subTitle: String? = nil, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subTitle = subTitle
        self.coordinate = coordinate
    }

}
