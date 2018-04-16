//
//  ViewController.swift
//  GEMS
//
//  Created by Sikander Zeb on 4/15/18.
//  Copyright © 2018 Sikander Zeb. All rights reserved.
//

import UIKit
import STCollapseTableView

class HomeVC: UIViewController {

    var streets: [Street] = []
    var tempStreets: [Street] = []
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "streets", ofType: "plist") {
            
            //If your plist contain root as Array
            if let array = NSArray(contentsOfFile: path) as? [[String: Any]] {
                for obj in array {
                    streets.append(Street(dict: obj))
                }
            }
            tempStreets = streets
            table.reloadData()
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? StreetDetail {
            vc.street = tempStreets[(table.indexPathForSelectedRow?.row)!]
        }
    }

}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempStreets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! GeneralCell
        let street = tempStreets[indexPath.row]
        cell.name.text = street.crossStreet1
        
        return cell
    }
}

extension HomeVC: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        table.isHidden = false
        table.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        tempStreets = streets.filter({$0.crossStreet1.contains(searchBar.text!)})
        table.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        self.table.isHidden = true
        self.view.endEditing(true)
        tempStreets = streets
        table.reloadData()
    }
    
    
}

extension UIViewController: UITextFieldDelegate {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension String {
    
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
    }
}
