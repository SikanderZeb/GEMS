//
//  Street.swift
//  GEMS
//
//  Created by Sikander Zeb on 4/15/18.
//  Copyright © 2018 Sikander Zeb. All rights reserved.
//

import UIKit

class Street {
    var streetName: String = ""
    var privat: String = ""
    var sect: String = ""
    var unit1: String = ""
    var unit2: String = ""
    var crossStreet1: String = ""
    var crossStreet2: String = ""
    var comments: String = ""
    var medicUnit: String = ""
    var name: String = ""
    var direction: String = ""
    var grid: String = ""
    var type: String = ""
    
    init(dict : Dictionary<String, Any>) {
        if let street = dict["Street Name"] as? String {
            streetName = street
        }
        if let p = dict["Private"] as? String {
            self.privat = p
        }
        if let sect = dict["Sect"] as? String {
            self.sect = sect
        }
        if let unit1 = dict["Unit 1"] as? String {
            self.unit1 = unit1
        }
        if let street = dict["Unit 2"] as? String {
            self.unit2 = street
        }
        if let street = dict["Cross Street 1"] as? String {
            self.crossStreet1 = street
        }
        if let street = dict["Cross Street 2"] as? String {
            self.crossStreet2 = street
        }
        if let street = dict["Comments"] as? String {
            self.comments = street
        }
        if let street = dict["Medic Unit"] as? String {
            self.medicUnit = street
        }
        if let street = dict["Name"] as? String {
            self.name = street
        }
        if let street = dict["Direction"] as? String {
            self.direction = street
        }
        if let street = dict["Grid"] as? String {
            self.grid = street
        }
        if let street = dict["type"] as? String {
            self.type = street
        }
        
    }
    
}
