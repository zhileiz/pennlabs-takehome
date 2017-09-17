//
//  DetailsController.swift
//  pennlabs-demo
//
//  Created by Zhilei Zheng on 2017/9/17.
//  Copyright © 2017年 Zhilei Zheng. All rights reserved.
//

import UIKit

class DetailsController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var url = URL(string: "https://github.com/SwiftyJSON/SwiftyJSON")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
    }

}
