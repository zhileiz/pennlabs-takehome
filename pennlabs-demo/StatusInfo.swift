//
//  StatusInfo.swift
//  pennlabs-demo
//
//  Created by Zhilei Zheng on 2017/9/17.
//  Copyright © 2017年 Zhilei Zheng. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class StatusInfo{
    static let instance = StatusInfo()
    
    private var today:String = "2017-12-21"
    
    private var statusToday:[Int:[String]] = [
        593:["CLOSED"],
        636:["CLOSED"],
        637:["CLOSED"],
        638:["CLOSED"],
        639:["CLOSED"],
        640:["CLOSED"],
        641:["CLOSED"],
        642:["CLOSED"],
        1442:["CLOSED"],
        747:["CLOSED"],
        1441:["CLOSED"],
        1057:["CLOSED"],
        1058:["CLOSED"],
        1163:["CLOSED"],
        1732:["CLOSED"],
        1733:["CLOSED"]
    ]
    
    func resetStatus(){
        for (id,_) in statusToday{
            statusToday[id] = ["CLOSED"]
        }
    }
    
    
    func updateStatusForVenue(venue:JSON){
        print("########:")
        let id = venue["id"].int ?? 0
        if id != 0 {
            if let times = venue["dateHours"].array{
                for time in times{
                    if time["date"].stringValue == self.today{
                        if let meals = time["meal"].array{
                            var slots:[String] = []
                            for meal in meals{
                                let slot = self.parseTime(time1: meal["open"].stringValue, time2: meal["close"].stringValue)
                                print(slot)
                                slots.append(slot)
                            }
                            self.statusToday[id] = slots
                        }
                    }
                }
            }
        }
    }
    
    
    func parseTime(time1:String, time2:String) -> String{
        let arr1 = time1.components(separatedBy: ":")
        let arr2 = time2.components(separatedBy: ":")
        var output = ""
        if arr1[1] == "00" && arr2[1] == "00"{
            output = "\(arr1[0]) - \(arr2[0])"
        } else if arr1[1] != "00" && arr2[1] != "00" {
            output = "\(arr1[0]):\(arr1[1]) - \(arr2[0]):\(arr2[1])"
        } else if arr1[1] != "00" {
            output = "\(arr1[0]):\(arr1[1]) - \(arr2[0])"
        } else {
            output = "\(arr1[0]) - \(arr2[0]):\(arr2[1])"
        }
        return output
    }
    
    func getTodayDate(){
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let result = formatter.string(from: date)
        print(result)
        today = result
    }
    
    func getStatus(venue:Venue) -> String{
        let id = venue.id
        let status = statusToday[id]!
        var output = status[0]
        if status.count < 2 {
            return output
        } else {
            for index in 1 ..< status.count{
                output = output + " | \(status[index])"
            }
            return output
        }

    }
    
    
    
}
