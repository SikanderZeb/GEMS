//
//  NamesVC.swift
//  GEMS
//
//  Created by Sikander Zeb on 4/15/18.
//  Copyright © 2018 Sikander Zeb. All rights reserved.
//

import UIKit
import MessageUI
class NamesVC: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    let keys = ["Tracy Schietinger, Executive Director", "Jim Syrotiak, Deputy Director","Chris Tremblay, Director of Professional Standards","Patrick O'Connor, Director of Operations",
                "John Strong, CFO","Jodi Dunn, Accounts/Benefit coordinator","Antonetta Paniccia, Billing","Lisa Miller, Administrative Assistant","Eirinn Rickard","Dennis Fogler","Andy Bates","Colin Bassett","John McRae","Janet Adams"]
    let values = ["tschietinger@greenwichems.org","jsyrotiak@greenwichems.org","ctremblay@greenwichems.org","poconnor@greenwichems.org","jstrong@greenwichems.org","jdunn@greenwichems.org","apaniccia@greenwichems.org","lmiller@greenwichems.org","erickard@greenwichems.org","dfogler@greenwichems.org","abates@greenwichems.org","cbassett@greenwichems.org ","jmcrae@greenwichems.org","jadams@greenwichems.org"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}
extension NamesVC: UITableViewDelegate, UITableViewDataSource {
    
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
        let mail = values[indexPath.row]
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            return
        }
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        
        // Configure the fields of the interface.
        composeVC.setToRecipients([mail])
        composeVC.setSubject("GEMS Mail")
        //composeVC.setMessageBody("Hey Josh! Here's my feedback.", isHTML: false)
        
        // Present the view controller modally.
        self.present(composeVC, animated: true, completion: nil)
    }
}

extension NamesVC: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}

