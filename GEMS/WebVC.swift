//
//  WebVC.swift
//  GEMS
//
//  Created by Sikander Zeb on 4/16/18.
//  Copyright © 2018 Sikander Zeb. All rights reserved.
//

import UIKit

class WebVC: UIViewController {

    var url: URL!
    @IBOutlet weak var webview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if webview != nil {
            webview.loadRequest(URLRequest(url: url))
            
            
        }
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tworesponse" {
            let vc = segue.destination as? UnitResponse
            vc?.isUnit2 = true
        }
    }
}
