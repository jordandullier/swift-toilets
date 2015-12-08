//
//  ViewController.swift
//  ToiletsApp
//
//  Created by Jordan DULLIER on 08/12/2015.
//  Copyright © 2015 Jordan DULLIER. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MapKit

class ViewController: UIViewController,DataProtocol {

    var listToilets:[Toilets]? = []
    let data = DataToilets()
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data.askForDataWith(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didRetrieveData(toilets: [Toilets]) {
        self.mapView.addAnnotations(toilets)
    }

}

