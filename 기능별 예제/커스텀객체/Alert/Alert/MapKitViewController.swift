//
//  MapKitViewController.swift
//  Alert
//
//  Created by Yongwan on 06/06/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit
import MapKit

class MapKitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var mv = MKMapView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        //
        var pos = CLLocationCoordinate2D(latitude: 37.514322, longitude: 126.894623)
        mv.centerCoordinate = pos
        
        let region = MKCoordinateRegion(center: pos, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        mv.region = region
        mv.regionThatFits(region)
        //
        //pin
        
        var point = MKPointAnnotation()
        point.coordinate = pos
        mv.addAnnotation(point)
        
        
        //
        
        self.preferredContentSize.height = 200
        self.view = mv
        

    }
    


}
