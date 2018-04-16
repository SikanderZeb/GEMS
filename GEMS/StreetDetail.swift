//
//  StreetDetail.swift
//  GEMS
//
//  Created by Sikander Zeb on 4/15/18.
//  Copyright © 2018 Sikander Zeb. All rights reserved.
//

import UIKit
import MapKit

class StreetDetail: UIViewController {

    @IBOutlet weak var section: UILabel!
    @IBOutlet weak var cross1: UILabel!
    @IBOutlet weak var cross2: UILabel!
    @IBOutlet weak var comment: UITextView!
    @IBOutlet weak var unit1: UILabel!
    @IBOutlet weak var unit2: UILabel!
    @IBOutlet weak var medic: UILabel!
    @IBOutlet weak var direction: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var `private`: UILabel!
    
    var street: Street!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        section.text = street.sect
        cross1.text = street.crossStreet1
        cross2.text = street.crossStreet2
        comment.text = street.comments
        unit1.text = street.unit1
        unit2.text = street.unit2
        medic.text = street.medicUnit
        direction.text = street.direction
        type.text = street.type
        `private`.text = street.privat
    }

    @IBAction func showRoute(_ sender: UIButton) {
        let alert = UIAlertController(title: "Street number", message: "", preferredStyle: .alert)
        alert.addTextField { (text) in
            text.keyboardType = .numberPad
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            let textfield = alert.textFields![0]
            
            if (textfield.text?.count)! > 0{
                let st = "\(textfield.text ?? "") \(self.street.crossStreet1) Greenwich"
                let baseUrl: String = "http://maps.apple.com/?q="
                let encodedName = st.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
                let finalUrl = baseUrl + encodedName
                if let url = URL(string: finalUrl)
                {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
                
            }
        }))
        present(alert, animated: true, completion: nil)
    }

}
