//
//  ViewController.swift
//  bitrise-screenshot-automation
//
//  Created by Alexander Botkin on 4/20/20.
//  Copyright © 2020 ChargePoint, Inc. All rights reserved.
//

import MapKit
import UIKit

class DarkMapViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView?
    @IBOutlet weak var cityLabel: UILabel?
    @IBOutlet weak var zoomButton: UIButton?

    var locationManager: CLLocationManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.requestLocationPermission()
    }

    func requestLocationPermission() {
        if self.locationManager == nil {
            let locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
            locationManager.requestWhenInUseAuthorization()

            self.locationManager = locationManager
        }
    }

    @IBAction func zoomToCityTapped() {
        // Do nothing for now
    }

}

