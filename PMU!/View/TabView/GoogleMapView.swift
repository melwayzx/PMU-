//
//  GoogleMapView.swift
//  PMU!
//
//  Created by Danuruj Promteerawong on 8/2/2564 BE.
//

import Foundation
import GoogleMaps
import GooglePlaces
import SwiftUI
import MapKit
import UIKit

struct GoogleMapView: UIViewRepresentable {
    // 1
    @ObservedObject var locationManager = LocationManager()
    private let zoom: Float = 16.0
    let marker : GMSMarker = GMSMarker()
    
    // 2
    func makeUIView(context: Self.Context) -> GMSMapView {
        GMSServices.provideAPIKey("AIzaSyDpMwytCJjQzbK-UsscFycBVsOwR-08jTY")
        GMSPlacesClient.provideAPIKey("AIzaSyDpMwytCJjQzbK-UsscFycBVsOwR-08jTY")
        let camera = GMSCameraPosition.camera(withLatitude: 13.74151, longitude: 100.52547, zoom: zoom)
    //    let camera = GMSCameraPosition.camera(withLatitude: locationManager.latitude, longitude: locationManager.longitude, zoom: zoom)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        return mapView
    }
    
    // 3
    func updateUIView(_ mapView: GMSMapView, context: Context) {
        //        let camera = GMSCameraPosition.camera(withLatitude: locationManager.latitude, longitude: locationManager.longitude, zoom: zoom)
        //        mapView.camera = camera
     //   mapView.animate(toLocation: CLLocationCoordinate2D(latitude: locationManager.latitude, longitude: locationManager.longitude))
        marker.position = CLLocationCoordinate2D(latitude: 13.74151, longitude: 100.52547)
     //   marker.position = CLLocationCoordinate2D(latitude: locationManager.latitude, longitude: locationManager.longitude)
        marker.title = "คุณอยู่ที่นี่"
        marker.snippet = "You are here"
        marker.map = mapView
    }
}

struct GoogleMapView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleMapView()
    }
}
