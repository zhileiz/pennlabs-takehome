//
//  ViewController.swift
//  pennlabs-demo
//
//  Created by Zhilei Zheng on 2017/9/17.
//  Copyright © 2017年 Zhilei Zheng. All rights reserved.
//

import UIKit
import Alamofire
import SnapKit
import SwiftyJSON
import Hue

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var residentialVenues = [Venue]()
    var retailVenues = [Venue]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        residentialVenues = VenuesInfo.instance.getResidentialVenues()
        retailVenues = VenuesInfo.instance.getRetailVenues()
        updateStatus()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.clear
    }

}

extension ViewController:UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return residentialVenues.count
        } else {
            return retailVenues.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.white
        let label = UILabel(frame: CGRect(x: 10, y: 10, width: 200, height: 40))
        if section == 0 {
            label.text = "Dining Hall"
        } else {
            label.text = "Retail Dining"
        }
        label.font = UIFont(name: "HelveticaNeue-Light", size: 25)
        label.textColor = UIColor(hex: "868686")
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toWebView", sender: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as? CustomViewCell{
            if indexPath.section == 0{
                cell.setUpView(venue: residentialVenues[indexPath.row])
            } else {
                cell.setUpView(venue: retailVenues[indexPath.row])
            }
            return cell
        } else {
            print("Cannot Draw Custom Cell")
            return UITableViewCell()
        }
    }
}

extension ViewController{
    func updateStatus(){
        StatusInfo.instance.resetStatus()
        StatusInfo.instance.getTodayDate()
        Alamofire.request("http://api.pennlabs.org/dining/venues").responseJSON { response in
            if let data = response.result.value {
                let json = JSON(data)
                if let venues = json["document"]["venue"].array{
                    for venue in venues{
                        StatusInfo.instance.updateStatusForVenue(venue: venue)
                    }
                    self.tableView.reloadData()
                }
            }
        }
    }
}

