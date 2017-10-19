//
//  FirstViewController.swift
//  PlanR
//
//  Created by Adam McBride on 3/12/17.
//  Copyright © 2017 Adam McBride Studios. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class FirstViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet var map: MKMapView!
    @IBOutlet var segmentedcontrol: UISegmentedControl!
    var manager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func segmentchanged(_ sender: AnyObject) {
        switch segmentedcontrol .selectedSegmentIndex {
        case 0:
            map.mapType = MKMapType.standard
            break
        case 1:
            map.mapType = MKMapType.satellite
            break
        case 2:
            map.mapType = MKMapType.hybrid
            break
        default:
            break
        }
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        let location = locations.last as! CLLocation
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        map.setRegion(region, animated: true)
//        map.userTrackingMode = true
    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        
//        let userLocation:CLLocation = locations[0]
//        
//        let latitude:CLLocationDegrees = userLocation.coordinate.latitude
//        let longitude:CLLocationDegrees = userLocation.coordinate.longitude
//        
//        let latDelta:CLLocationDegrees = 0.05
//        let lonDelta:CLLocationDegrees = 0.05
//        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
//        
//        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
//        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
    
//        map.setRegion(region, animated: true)
    
        
//        map.setRegion(MKCoordinateRegionMakeWithDistance(location, latitude, longitude), animated: true)
        
//        let pin = MKPointAnnotation()
//        pin.coordinate.latitude = userLocation.coordinate.latitude
//        pin.coordinate.longitude = userLocation.coordinate.longitude
//        pin.title = "Your movement line"
//        map.addAnnotation(pin)
        
//    }

}

