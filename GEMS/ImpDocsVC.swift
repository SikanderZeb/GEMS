//
//  ImpDocsVC.swift
//  GEMS
//
//  Created by Sikander Zeb on 4/16/18.
//  Copyright © 2018 Sikander Zeb. All rights reserved.
//

import UIKit

class ImpDocsVC: UIViewController {

    @IBOutlet weak var table: UITableView!
    let values = ["Protocols"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? WebVC {
            
            vc.url = Bundle.main.url(forResource: "protocols", withExtension: "pdf")
        }
    }
}
extension ImpDocsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return values.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! GeneralCell
        
        cell.name.text = values[indexPath.row]
        //cell.value.text = values[indexPath.row]
        
        return cell
    }
    
    
    
    
}

