//
//  MapView.swift
//  TechnicalTest
//
//  Created by Lisette HG on 05/04/24.
//

import Foundation
import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var locations: [RandomLocation]
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        updateAnnotations(from: view)
    }
    
    private func updateAnnotations(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations) // Remove old annotations
        
        let annotations = locations.map { location -> MKPointAnnotation in
            let annotation = MKPointAnnotation()
            annotation.title = "Random Pin"
            annotation.coordinate = CLLocationCoordinate2D(
                latitude: location.latitude,
                longitude: location.longitude
            )
            return annotation
        }
        
        mapView.addAnnotations(annotations)
    }
}
