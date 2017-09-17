//
//  DetailsController.swift
//  pennlabs-demo
//
//  Created by Zhilei Zheng on 2017/9/17.
//  Copyright © 2017年 Zhilei Zheng. All rights reserved.
//

import UIKit
import SystemConfiguration
import NVActivityIndicatorView
import SnapKit

class DetailsController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var url = URL(string: "https://github.com/SwiftyJSON/SwiftyJSON")
    
        let indicator = NVActivityIndicatorView(frame: CGRect(x:20, y:20, width:100, height:100), type: .pacman, color: .black, padding: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
        addIndicator()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        popIfNotConnected()
    }
    
    // add inidcator to center of the view
    func addIndicator(){
        self.view.addSubview(indicator)
        indicator.snp.makeConstraints{(make) -> Void in
            make.width.height.equalTo(100)
            make.centerX.equalTo(self.view).offset(20)
            make.centerY.equalTo(self.view)
        }
    }
}

extension DetailsController:UIWebViewDelegate{
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        indicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        indicator.stopAnimating()
    }
    
}

extension DetailsController{
    
    func isInternetAvailable() -> Bool
    {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return (isReachable && !needsConnection)
    }
    
    // Pop up alert when disconnected, and go back when dismissed
    func popIfNotConnected(){
        if !isInternetAvailable(){
            let alertController = UIAlertController(title: "No Internet Connection", message:
                "Please Connect to Internet", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: {(alert:UIAlertAction) in self.goBack()}))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func goBack(){
        navigationController?.popViewController(animated: true)
    }
    
}
