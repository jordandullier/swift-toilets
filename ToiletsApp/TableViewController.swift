//
//  TableViewController.swift
//  ToiletsApp
//
//  Created by Jordan DULLIER on 08/12/2015.
//  Copyright © 2015 Jordan DULLIER. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MapKit

class TableViewController : UITableViewController, DataProtocol{
    
    let data = DataToilets()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data.askForDataWith(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didRetrieveData(toilets: [Toilets]) {
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.listData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCellWithIdentifier("cellule")! as UITableViewCell
        let label = cell.viewWithTag(1) as! UILabel
        label.text = data.listData[indexPath.row].title
        
        return cell
    }

}