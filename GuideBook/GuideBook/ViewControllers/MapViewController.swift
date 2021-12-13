//
//  MapViewController.swift
//  GuideBook
//
//  Created by Paweł Brzozowski on 06/12/2021.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager: CLLocationManager?
    var lastKnownLocation: CLLocation?
    
    var place: Place?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Showing user on start (if lcoation is known)
        mapView.showsUserLocation = true
        
        // Create and cofigure locationManager
        locationManager = CLLocationManager()
        locationManager?.delegate = self
    }
    
    // Map could take a while to load.
    override func viewDidAppear(_ animated: Bool) {
        // Check for a place and put a PIN
        
        if place != nil {
            putPin(place: place!)
        }
    }
        
    func putPin(place: Place) {
        
        // Create a PIN class
        let pin = MKPointAnnotation()
        
        // Create cords by corerting a double into the degrees
        let lat = CLLocationDegrees(place.lat)
        let lon = CLLocationDegrees(place.long)
        
        // Set up a pin
        pin.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        pin.title = place.name
        
        // Add the PIN
        mapView.addAnnotation(pin)
        
        // Center the map around pin
        mapView.showAnnotations([pin], animated: true)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        // Dismiss the map view controller
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func locateTapped(_ sender: UIButton) {
        // Static func to check if location is enabled
        if CLLocationManager.locationServicesEnabled() {
            
            // Check the autoriaztion status
            let status = CLLocationManager.authorizationStatus()
            if status == .denied || status == .restricted {
                
                // Show the error popup
                showGeolationError()
                
            } else if status == .authorizedWhenInUse || status == .authorizedAlways {
                
                // Start geolocation user
                locationManager?.startUpdatingLocation()
                
                // Center the map around lat know lcoation
                if let lastKnownLocation = lastKnownLocation {
                    mapView.setCenter(lastKnownLocation.coordinate, animated: true)
                }
                
            } else if status == .notDetermined {
                
                // Ask the user for permision
                locationManager?.requestWhenInUseAuthorization()
                
            }
            
        } else {
            // Show error dialog
            showGeolationError()
        }
    }
    func showGeolationError() {
        // Create an error alert
        let alert = UIAlertController(title: "Geolocation failed", message: "Location services are turned off or this app doesnt have permissions to geolocate.", preferredStyle: .alert)
        
        // Create a settings button
        let settingAction = UIAlertAction(title: "Setings", style: .default) { alert in
            let url = URL(string: UIApplication.openSettingsURLString)
            if let url = url {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        
        // Create an cancel button
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        // Add actions
        alert.addAction(settingAction)
        alert.addAction(cancelAction)
        
        // Present/show alert
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func routeTapped(_ sender: Any) {
        guard place != nil && place?.address != nil else {
            return
        }
        
        // Using URL Scheems to calcualte a route
        
        // Repalce spaces with +
        let newAdress =  place!.address!.replacingOccurrences(of: " ", with: "+")
        
        // Create a URL
        let url = URL(string: "http://maps.apple.com/adress=" + newAdress)
        
        if let url = url {
            // Call it
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // This function isn't real time operating, it use array because user could been in different locations
        let location = locations.last
        
        if let location = location {
            // Center the mapView around this location
            if lastKnownLocation == nil {
                mapView.setCenter(location.coordinate, animated: true)
            }
            lastKnownLocation = location
        }
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus){
        if status == .denied || status == .restricted {
            // User chose 'dont allow'
            showGeolationError()
        } else if status == .authorizedAlways || status == .authorizedWhenInUse {
            // Start lcoating the user
            locationManager?.startUpdatingLocation()
        }
    }
}
