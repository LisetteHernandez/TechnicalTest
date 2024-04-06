//
//  MapView.swift
//  TechnicalTest
//
//  Created by Lisette HG on 05/04/24.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var location: Location
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: location.lat, longitude: location.lon)
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)

        // Remove all annotations
        let allAnnotations = view.annotations
        view.removeAnnotations(allAnnotations)
        
        // Add new annotation
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = location.city
        view.addAnnotation(annotation)
    }
}
