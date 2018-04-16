//
//  EMSVC.swift
//  GEMS
//
//  Created by Sikander Zeb on 4/15/18.
//  Copyright © 2018 Sikander Zeb. All rights reserved.
//

import UIKit

class EMSVC: UIViewController {

    @IBOutlet weak var table: UITableView!
    let keys = ["Station 1  Report writing/stock room", "Station 1  Crew room","Stations 2,3,and 4","Greenwich ER","Stamford ER","Westchester ER","White Plains ER",
                "Station 1 Phone Line Out","Station 2 Phone Line Out"]
    let values = ["1,3,5","4,3,2","ID Badge","911#","6789*","803","817","1661279","8"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
extension EMSVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55.0
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
