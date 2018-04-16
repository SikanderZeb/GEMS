//
//  PhoneVC.swift
//  GEMS
//
//  Created by Sikander Zeb on 4/15/18.
//  Copyright © 2018 Sikander Zeb. All rights reserved.
//

import UIKit

class PhoneVC: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    var keys:[String] = []
    
    let dict: Dictionary<String, Array<Dictionary<String, String>>> = [
        "1.Greenwich EMS":[
            ["GEMS Administration":"(203) 637-7505"],
            ["GEMS Operations":"(203) 698-2199"],
            ["GEMS 1505 cell":"(203) 898-3881"],
            ["Station 1 (5 Perryridge Rd)":"(203) 863-3634"],
            ["Station 2 (1111 East Putnam Ave.)":"(203) 637-9026"],
            ["Station 3 (143 Lower Cross Rd)":"(203) 340-3982"],
            ["Station 4 (1327 King St)":"(203) 531-3271"]
        ],
        "2.Greenwich Police Department":
            [["Dispatch":" (203) 622-8003"],
             ["Desk Sergeant":"(203) 622-8007"],
             ["Marine Division":"(203) 622-8044"]
        ],
        "3.CMED (Southwest Regional)":
            [["(Stamford Line)":"(203) 324-3420"],
             ["(Main Line)":"(203) 338-0762"]],
        "4.60 Control (Patches for Westchester)":
            [["Main":" (914) 231-1695"]
        ],
        "5.Poison Control":
            [["Main":"1(800) 222-1222"]],
        "6.CT Abuse Hotline":
            [["Main":"1(800) 842-2288"]],
        "7.New England Uniform":
            [["Bridgeport":"(203) 333-0890"],
             ["Danbury":"(203) 792-5256"]],
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
        if let url = URL(string: finalUrl) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        
    }
    
}
extension PhoneVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "header") as! HeaderCell
        
        let values = keys[section].components(separatedBy: ",")
        
        cell.name.text = values[0].dropFirst(2) + ""
        //cell.button.setTitle(values[1], for: .normal)
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

