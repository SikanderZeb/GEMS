//
//  UnitResponse.swift
//  GEMS
//
//  Created by Sikander Zeb on 4/15/18.
//  Copyright © 2018 Sikander Zeb. All rights reserved.
//

import UIKit

class UnitResponse: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    var keys = ["Medic One", "Units Shifting","Medic 2","Medic 3","Medic 4","Medic Two","Units Shifting","Medic 1","Medic 3","Medic 4","Medic Three","Units Shifting","Medic 1","Medic 2","Medic 4","Medic Four","Units Shifting","Medic 1","Medic 2","Medic 3"]
    var values = ["","","Home","Home","when available","Glenville","","","Station 2","Home","Glenville","","","North & Clapboard","Home","Glenville","","","Glenville","Home","Home"]
    
    var isUnit2 = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isUnit2 == true {
            keys = ["Medic One and Two","Units Shifting","Medic 3","Medic 4","Medic One and Three ","Units Shifting","Medic 2","Medic 4","Medic One and Four","Units Shifting","Medic 2","Medic 3","Medic Two and Three","Units Shifting","Medic 1","Medic 4","Medic Two and Four","Units Shifting","* If two out 1st","Medic 1","Medic 3","* If four out 1st","Medic 1","Medic 3","Medic Three and Four","Units Shifting","Medic 1","Medic 2","Three units","Four units"]
            
            values = ["","","Hub","Glenville","","","Hub","Glenville","","","Hub","Exit 28 Merritt","","","Hub","Glenville","","","","Hub","Exit 28 Merritt","","Glenville","Hub","","","Glenville","Hub","Last unit shifts to Hillside.","Contact C-med for coverage."]
            
            table.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    
}

extension UnitResponse: UITableViewDelegate, UITableViewDataSource {
    
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
}

