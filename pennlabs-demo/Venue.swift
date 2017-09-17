//
//  Venue.swift
//  pennlabs-demo
//
//  Created by Zhilei Zheng on 2017/9/17.
//  Copyright © 2017年 Zhilei Zheng. All rights reserved.
//

import Foundation

struct Venue{
    let name:String
    let type:String
    let id:Int
    let facilityURL:String
    let imageName: String
    var status:[String]
    
    init(name:String, type:String, id:Int, imageName:String, facilityURL:String) {
        self.name = name
        self.type = type
        self.id = id
        self.facilityURL = facilityURL
        self.imageName = imageName
        self.status = ["CLOSED"]
    }
    
    func getStatus() -> String{
        var output:String = status[0]
        if status.count < 2 {
            return output
        } else {
            for index in 1 ... status.count{
                output = output + " | \(status[index])"
            }
            return output
        }
    }
    
    
}
