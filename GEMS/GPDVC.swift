//
//  GPDVC.swift
//  GEMS
//
//  Created by Sikander Zeb on 4/15/18.
//  Copyright © 2018 Sikander Zeb. All rights reserved.
//

import UIKit

class GPDVC: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    let keys = ["Code 10", "Code 20","Code 30", "Code 5000","Code Alpha",
                "8046","32","33","34","35","36","290","305","013/014","210"]
    let values = ["with traffic","emergency response","when available","emergency button activation","Incident Related Traffic Only","Greenwich Hospital","call (telephone)","respond to","out of service (call out on scene/hospital)","in service","repeat last transmission","MVA","Medical","suicide","ETOH"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}

extension GPDVC: UITableViewDelegate, UITableViewDataSource {
    
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
