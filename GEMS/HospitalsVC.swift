//
//  HospitalsVC.swift
//  GEMS
//
//  Created by Sikander Zeb on 4/15/18.
//  Copyright © 2018 Sikander Zeb. All rights reserved.
//

import UIKit

class HospitalsVC: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    var keys:[String] = []
    //var d[String:Dictionary<String, String]>]]!
    
    let dict: Dictionary<String, Array<Dictionary<String, String>>> = [
        "1.Greenwich Hospital, (5 Perryridge Rd Greenwich)":[
            ["Main":"(203) 863-3000"],
            ["ER":"(203) 276-7777"]
        ],
                "2.Stamford Hospital, (1 Hospital Plaza Stamford)":
                                                        [["Main":"(203) 276-1000"],
                                                        ["ER":"(203) 276-7777"]],
                "3.Westchester Medical Center, (100 Woods RD Valhalla NY)":
                    [["Main":"(914) 493-7000"],
                     ["ER":"(914) 493-7311"]],
                "4.White Plains Hospital, (41 East Post Rd White Plains NY)":
                    [["Main":"(914) 681-0600"],
                     ["ER":"(914) 681-2600"]],
                "5.Yale New Haven, (20 York St Greenwich)":
                    [["Main":"(203) 688-4242"]],
                "6.Bridgeport Hospital, (267 Grant St Greenwich)":
                    [["Main":"(203) 384-3000"]],
                "7.ST. Vincents Hospital, (2800 Main St. Bridgeport CT)":
                    [["Main":"(203) 576-6000"]],
                ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keys = dict.keys.sorted(by: {$0 < $1})
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapAddress(_ sender: UIButton) {
        let values = keys[sender.tag].components(separatedBy: ",")
        
        let address = values[0].dropFirst(2) + ""
        
        let baseUrl: String = "http://maps.apple.com/?q="
        let encodedName = address.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let finalUrl = baseUrl + encodedName
        if let url = URL(string: finalUrl)
        {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        
    }

}
extension HospitalsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "header") as! HeaderCell
    
        let values = keys[section].components(separatedBy: ",")
        
        cell.name.text = values[0].dropFirst(2) + ""
        cell.button.setTitle(values[1], for: .normal)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dict[keys[section]]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! GeneralCell
        let array = dict[keys[indexPath.section]]
        let dic = array![indexPath.row]
        cell.value.text = Array(dic.values)[0]
        cell.name.text = Array(dic.keys)[0]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let array = dict[keys[indexPath.section]]
        let dic = array![indexPath.row]
        let phone = Array(dic.values)[0].digits
        if let url = URL(string: "tel://\(phone)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}

