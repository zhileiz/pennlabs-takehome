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
    
    // update a venue status from a venue json
    func updateStatusForVenue(venue:JSON){
        let id = venue["id"].int
        if let times = venue["dateHours"].array{
            for time in times{
                if time["date"].stringValue == self.today{
                    if let meals = time["meal"].array{
                        var slots:[String] = []
                        for meal in meals{
                            let slot = self.parseTime2(
                                time1: meal["open"].stringValue,
                                time2: meal["close"].stringValue
                            )
                            slots.append(slot)
                        }
                        self.statusToday[id!] = slots
                    }
                }
            }
        }
    }
    
    // parse time to designated format
    private func parseTime(time1:String, time2:String) -> String{
        var a = time1
        if time1.characters.first == "0"{
            let index = time1.index(time1.startIndex, offsetBy:1)
            a = time1.substring(from: index)
        }
        var b = time2
        if time2.characters.first == "0"{
            let index = time2.index(time1.startIndex, offsetBy:1)
            b = time2.substring(from: index)
        }
        let arr1 = a.components(separatedBy: ":")
        let arr2 = b.components(separatedBy: ":")
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
    
    private func parseTime2(time1:String, time2:String) -> String{
        let left = parseSingleTime(time: time1)
        let right = parseSingleTime(time: time2)
        return "\(left) - \(right)"
    }
    
    private func parseSingleTime(time:String) -> String{
        let times = time.components(separatedBy: ":")
        let hour = Int(times[0])!
        let minute = Int(times[1])!
        let isAM = (hour % 12 == hour)
        let isFull = (minute == 0)
        if isAM && isFull{
            return "\(hour)A"
        } else if !isAM && !isFull {
            return "\(hour % 12):\(times[1])P"
        } else if isFull{
            return "\(hour % 12)P"
        } else {
            return "\(hour):\(times[1])A"
        }
    }
    
    // get today's date to compare info
    func getTodayDate(){
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let result = formatter.string(from: date)
        today = result
    }
    
    // Get Status String for Venue, called when draw cell
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
