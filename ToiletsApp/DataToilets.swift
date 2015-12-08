//
//  DataToilets.swift
//  ToiletsApp
//
//  Created by Jordan DULLIER on 08/12/2015.
//  Copyright © 2015 Jordan DULLIER. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import MapKit

class DataToilets{
    
    var listData:[Toilets]! = []
    var delegate : DataProtocol?
    
    func askForDataWith(delegate : DataProtocol){
        
        self.delegate = delegate
        
        Alamofire.request(.GET,"http://scenies.com/insset_api/resources/toilets.json").responseJSON { response in
            
            //print(json);
            
            if let value = response.result.value {
                let json = JSON(value)
                
                for toilet in json{
                    //print(toilet)
                    let idJSON = toilet.1["id"].intValue
                    let nameJSON = toilet.1["name"].stringValue
                    let longitudeJSON = toilet.1["coordinates"]["longitude"].doubleValue
                    let latitudeJSON = toilet.1["coordinates"]["latitude"].doubleValue
                    let coordinate = CLLocationCoordinate2D(latitude : latitudeJSON, longitude : longitudeJSON)
                
                    let t  = Toilets(id: idJSON, title: nameJSON, coordinate: coordinate)
                
                    self.listData.append(t)
                    
                }
                
                if let d = self.delegate{
                    d.didRetrieveData(self.listData)
                }
            }else{
            
            }
            
            
            
        }
    }
    
}

protocol DataProtocol{
    func didRetrieveData(toilets: [Toilets])
}