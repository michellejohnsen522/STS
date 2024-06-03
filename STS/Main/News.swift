//
//  News.swift
//  STS
//
//  Created by admin on 6/3/24.
//



import Foundation

// MARK: - Category
struct News: Codable, Hashable {
    let header: String
    let body: String
    let image: String
    let url: String?
}

extension News {
    static let MOCK = News(
            header: "Stellar Blade Developer Shift Up Considering a Sequel", body: "Stellar Blade developer Shift Up is contemplating a sequel to the PlayStation 5 exclusive. In an interview with Famitsu, translated by Genki on X/Twitter, studio founder and Stellar Blade director Kim Hyung Tae, along with technical director Lee Dong Gi, discussed their current plans for the game and the possibility of a sequel. The developers mentioned plans to introduce a photo mode and additional outfits to Stellar Blade, and they have a long-term strategy that includes various fun updates. Regarding the sequel, Kim and Lee are considering fan feedback from the first game as they deliberate on the next installment.", image: "https://i.ibb.co/LQrqhVT/2.png", url: "https://www.youtube.com/watch?v=3wQ4VKaRHTo"
          
        )
    }
