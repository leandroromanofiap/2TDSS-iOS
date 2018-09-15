//
//  ViewController.swift
//  Mapa
//
//  Created by Leandro Romano on 14/09/2018.
//  Copyright © 2018 Leandro Romano. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        searchBar.delegate = self
        
        mapView.delegate = self
        
        requestAuthorization()
    }
    
    func requestAuthorization() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }

}

extension ViewController : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        let request = MKLocalSearchRequest()
        
        request.region = mapView.region
        
        request.naturalLanguageQuery = searchBar.text
        
        let search = MKLocalSearch(request: request)
        
        search.start { (response, error) in
            if error == nil {
                guard let response = response else { return }
                
                self.mapView.removeAnnotations(self.mapView.annotations)
                
                for item in response.mapItems {
                    let annotation = MKPointAnnotation()
                    
                    annotation.coordinate = item.placemark.coordinate
                    
                    annotation.title = item.name
                    annotation.subtitle = item.url?.absoluteString
                    
                    self.mapView.addAnnotation(annotation)
                }
            }
        }
    }
    
}

extension ViewController : MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let request = MKDirectionsRequest()
        
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: mapView.userLocation.coordinate))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: view.annotation!.coordinate))
        
        let directions = MKDirections(request: request)
        
        directions.calculate { (response, error) in
            if error == nil {
                guard let response = response else { return }
                
                guard let route = response.routes.first else { return }
                
                print("Distancia:", route.distance)
                print("Tempo:", route.expectedTravelTime)
                print("Nome:", route.name)
                
                for step in route.steps {
                    print("Em", step.distance, "metros", step.instructions)
                }
                
                self.mapView.removeOverlays(self.mapView.overlays)
                
                self.mapView.add(route.polyline, level: .aboveRoads)
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolyline {
            let renderer = MKPolylineRenderer(overlay: overlay)
            
            renderer.lineWidth = 7.0
            renderer.strokeColor = .blue
            
            return renderer
        } else {
            return MKOverlayRenderer(overlay: overlay)
        }
    }
    
}
