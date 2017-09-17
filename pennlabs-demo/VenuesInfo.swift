//
//  VenuesInfo.swift
//  pennlabs-demo
//
//  Created by Zhilei Zheng on 2017/9/17.
//  Copyright © 2017年 Zhilei Zheng. All rights reserved.
//

import Foundation

class VenuesInfo{
    
    static let instance = VenuesInfo()
    
    private let residentialVenues = [
        Venue.init(
            name:"1920 Commons",
            type:"residential",
            id:593,
            imageName:"1920-commons.png",
            facilityURL:"http://university-of-pennsylvania.cafebonappetit.com/cafe/1920-commons/"),
        Venue.init(
            name:"Hill House",
            type:"residential",
            id:636,
            imageName:"hill-house.jpg",
            facilityURL:"http://university-of-pennsylvania.cafebonappetit.com/cafe/hill-house/"),
        Venue.init(
            name:"English House",
            type:"residential",
            id:637,
            imageName:"english-house.jpg",
            facilityURL:"http://university-of-pennsylvania.cafebonappetit.com/cafe/kings-court-english-house/"),
        Venue.init(
            name:"Falk Kosher Dining",
            type:"residential",
            id:638,
            imageName:"falk-dining.jpg",
            facilityURL:"http://university-of-pennsylvania.cafebonappetit.com/cafe/falk-dining-commons/"),
        Venue.init(
            name:"New College House",
            type:"residential",
            id:1442,
            imageName:"new-college-house.jpg",
            facilityURL:"http://university-of-pennsylvania.cafebonappetit.com/cafe/new-college-house/"),
        Venue.init(
            name:"McClelland Express",
            type:"residential",
            id:747,
            imageName:"mcclelland.jpg",
            facilityURL:"http://university-of-pennsylvania.cafebonappetit.com/cafe/mcclelland/")
    ]
    
    private let retailVenues = [
        Venue.init(
            name:"Houston Market",
            type:"retail",
            id:639,
            imageName:"houston-market.jpg",
            facilityURL:"http://university-of-pennsylvania.cafebonappetit.com/cafe/houston-market/"),
        Venue.init(
            name:"Mark's Cafe",
            type:"retail", id:640,
            imageName:"marks-cafe.png",
            facilityURL:"http://university-of-pennsylvania.cafebonappetit.com/cafe/marks-cafe/"),
        Venue.init(
            name:"Accenture Cafe",
            type:"retail",
            id:641,
            imageName:"starbucks.jpg",
            facilityURL:"http://university-of-pennsylvania.cafebonappetit.com/cafe/accenture-cafe/"),
        Venue.init(
            name:"Joe's Cafe",
            type:"retail",
            id:642,
            imageName:"joes-cafe.jpg",
            facilityURL:"http://university-of-pennsylvania.cafebonappetit.com/cafe/joes-cafe/"),
        Venue.init(
            name:"Beefsteak",
            type:"retail",
            id:1441,
            imageName:"beefsteak.jpeg",
            facilityURL:"http://university-of-pennsylvania.cafebonappetit.com/cafe/beefsteak/"),
        Venue.init(
            name:"1920 Gourmet Grocer",
            type:"retail",
            id:1057,
            imageName:"1920-gourmet-grocer.jpg",
            facilityURL:"http://university-of-pennsylvania.cafebonappetit.com/cafe/1920-gourmet-grocer/"),
        Venue.init(
            name:"Tortas Frontera at the ARCH",
            type:"retail",
            id:1058,
            imageName:"tortas.jpg",
            facilityURL:"http://university-of-pennsylvania.cafebonappetit.com/cafe/tortas-frontera-at-the-arch/"),
        Venue.init(
            name:"1920 Starbucks",
            type:"retail",
            id:1163,
            imageName:"starbucks.jpg",
            facilityURL:"http://university-of-pennsylvania.cafebonappetit.com/cafe/1920-starbucks/"),
        Venue.init(
            name:"NCH Retail",
            type:"retail",
            id:1731,
            imageName:"starbucks.jpg",
            facilityURL:"http://university-of-pennsylvania.cafebonappetit.com/cafe/nch-retail/"),
        Venue.init(
            name:"Pret a Manager MBA",
            type:"retail",
            id:1732,
            imageName:"starbucks.jpg",
            facilityURL:"http://university-of-pennsylvania.cafebonappetit.com/cafe/pret-a-manager-upper/"),
        Venue.init(
            name:"Pret a Manager Locust Walk",
            type:"retail",
            id:1733,
            imageName:"starbucks.jpg",
            facilityURL:"http://university-of-pennsylvania.cafebonappetit.com/cafe/pret-a-manager-lower/"
        )
    ]
    
    func getResidentialVenues() -> [Venue]{
        return residentialVenues
    }
    
    func getRetailVenues() -> [Venue]{
        return retailVenues
    }
    
}
