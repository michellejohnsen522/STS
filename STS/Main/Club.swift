//
//  Club.swift
//  STS
//
//  Created by admin on 6/3/24.
//


import Foundation

// MARK: - Activity
struct Club: Codable {
    let country: String?
    let name, address, longtitude, latitude: String?
    let image: String?
    let hours: String?
    let phone: String?
}

extension Club {
    static var example: Club {
        let club = Club(country: "Portugal", name: "Loja de Jogos", address: "R. de Santa Catarina 801, 4000-454 Porto", longtitude: "41.154542883810734", latitude: "-8.604916858353022", image: "https://i.ibb.co/Xkn6v3Y/14.png", hours: "14:00-20:00", phone: "+351224952012")
        return club
    }
}
