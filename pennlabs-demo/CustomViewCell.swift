//
//  CustomViewCell.swift
//  pennlabs-demo
//
//  Created by Zhilei Zheng on 2017/9/17.
//  Copyright © 2017年 Zhilei Zheng. All rights reserved.
//

import UIKit
import SnapKit
import Hue

class CustomViewCell: UITableViewCell {

    @IBOutlet weak var venueImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpView(venue:Venue){
        setUpContent(venue: venue)
        venueImg.snp.makeConstraints{(make) -> Void in
            make.height.equalTo(120)
            make.centerY.equalTo(self.contentView)
            make.width.equalTo(200)
            make.left.equalTo(self.contentView)
        }
        nameLabel.snp.makeConstraints{(make) -> Void in
            make.height.equalTo(40)
            make.top.equalTo(self.contentView).offset(35)
            make.width.equalTo(200)
            make.right.equalTo(self.contentView)
        }
        nameLabel.font = UIFont(name: "HelveticaNeue", size: 20)
        statusLabel.snp.makeConstraints{(make) -> Void in
            make.height.equalTo(40)
            make.bottom.equalTo(self.contentView).offset(-5)
            make.width.equalTo(200)
            make.right.equalTo(self.contentView)
        }
        self.backgroundColor = UIColor(hex: "F7F7F7")
    }
    
    private func setUpContent(venue:Venue){
        nameLabel.text = venue.name
        statusLabel.text = StatusInfo.instance.getStatus(venue: venue)
        venueImg.image = UIImage(named: venue.imageName)
    }
    


}
