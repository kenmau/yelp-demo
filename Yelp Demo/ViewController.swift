//
//  ViewController.swift
//  Yelp Demo
//
//  Created by Ken Mau on 2019-08-12.
//  Copyright © 2019 Ken. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!

    private var data: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let baseURL = "https://api.yelp.com/v3"
        let resourceURL = "/businesses"
        let opURL = "/search"
        let queryURL = "?location=toronto"
        let completeURL = baseURL + resourceURL + opURL + queryURL
        
        let headers = [
            "Authorization": "Bearer CQ0MQ94R66yvYKm0IVXQJ8pHHzoy0569el6UX6woLG5WRK8RgGFwzK_QXtNVrbIxqtjOt7tidEZiH2hGkpAtYIlNRuanA7RDmXxsj4qE3N9xABvd_4WEcB6sb3BNXXYx"
        ]
        
        Alamofire.request(completeURL, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).responseObject { ( response: DataResponse<YELPBusinessesSearchResponse>) in
            
            let businessesSearchResponse = response.result.value
            
            if let businesses = businessesSearchResponse?.businesses {
                for business in businesses {
                    print(business.name!)
                    self.data.append(business.name!)
                    self.tableView.reloadData()
                }
            }
        }
        
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")!
        
        let text = data[indexPath.row]
        
        cell.textLabel?.text = text
        
        return cell
    }

}

