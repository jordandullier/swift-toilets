//
//  Toilets.swift
//  ToiletsApp
//
//  Created by Jordan DULLIER on 08/12/2015.
//  Copyright © 2015 Jordan DULLIER. All rights reserved.
//

import Foundation
import MapKit
class Toilets: NSObject, MKAnnotation{
    
    var id:Int!
    var title:String!
    var coordinate: CLLocationCoordinate2D
    
    //var latitude:Double!
    //var longitude:Double!
    
    init(id: Int,title: String, coordinate: CLLocationCoordinate2D){
        self.id = id;
        self.title = title;
        self.coordinate = coordinate;
        
    }
    
    
    
}