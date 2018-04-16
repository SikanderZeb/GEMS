//
//  MaintenanceVC.swift
//  GEMS
//
//  Created by Sikander Zeb on 4/15/18.
//  Copyright © 2018 Sikander Zeb. All rights reserved.
//

import UIKit

class MaintenanceVC: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    let keys = ["Fleet Department", "North St Pumps (at ACD/Fire Training)","North St Pumps (at ACD/Fire Training)", "Holly Hill (at the dump)","Preferred Automotive (Frank)"]
    
    let values = ["100 Indian Field Rd","393 North St","393 North St","99 Holly Hill Ln","16 Bridge St (203) 622-0027"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}
extension MaintenanceVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! GeneralCell
        
        cell.name.text = keys[indexPath.row]
        cell.value.text = values[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let address = values[indexPath.row]
        let baseUrl: String = "http://maps.apple.com/?q="
        let encodedName = address.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let finalUrl = baseUrl + encodedName
        if let url = URL(string: finalUrl)
        {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

