//
//  RestaurantMapView.swift
//  PMU!
//
//  Created by Melwayz's  on 22/3/21.
//

import GoogleMaps
import GooglePlaces
import SwiftUI




struct RestaurantMapView: UIViewRepresentable {
    
    
    var restaurant : Restaurant
    
    func makeUIView(context: Self.Context) -> GMSMapView {
        GMSServices.provideAPIKey("AIzaSyDpMwytCJjQzbK-UsscFycBVsOwR-08jTY")
        GMSPlacesClient.provideAPIKey("AIzaSyDpMwytCJjQzbK-UsscFycBVsOwR-08jTY")
        let camera = GMSCameraPosition.camera(withLatitude: restaurant.lat, longitude: restaurant.lng, zoom: 18)
        
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        return mapView
    }
    
    // 3
    func updateUIView(_ mapView: GMSMapView, context: Context) {
        
        let marker : GMSMarker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: restaurant.lat, longitude: restaurant.lng )
        marker.title = restaurant.name
        marker.map = mapView
        
    }
}

