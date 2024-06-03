//
//  Game.swift
//  STS
//
//  Created by admin on 6/3/24.
//


import Foundation

// MARK: - Category
struct CategoryGame: Codable, Hashable {
    let categoryTitle, categoryImage: String
    let categoryGames: [Game]
}

// MARK: - CategoryGame
struct Game: Codable, Hashable {
    let gameTitle, gameImage, gamePlayers: String
}


extension CategoryGame {
    static let MOCK = CategoryGame(
            categoryTitle: "Fighting",
            categoryImage: "https://i.ibb.co/zGP5b1R/image-fx-depict-two-fighters-one-in-blue-tones-the-o.jpg",
            categoryGames: [Game(gameTitle: "Mortal Kombat 11", gameImage: "https://upload.wikimedia.org/wikipedia/ru/4/4e/Mortal_Kombat_11.jpg", gamePlayers: "1")]
          
        )
    }
