//
//  NetworkManager.swift
//  STS
//
//  Created by admin on 6/3/24.
//


import SwiftUI

enum CustomError: Error {
    case invalidUrl
    case invalidData
    case invalidResponse
}

class NetworkManager {
    
    enum URLS: String {
        case categories = "https://api.jsonserve.com/jD_noB"
        case clubs = "https://api.jsonserve.com/c5p-Ng"
        case news = "https://api.jsonserve.com/mAArS2"
    }
    
    static var shared = NetworkManager()
    
    private init(){}
    
    func fetchNews(completion: @escaping (Result<[News], Error>) -> Void) {
                        
        guard let url = URL(string: URLS.news.rawValue) else {
            completion(.failure(CustomError.invalidUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(CustomError.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(CustomError.invalidData))
                return
            }
            
            do {
                let activities = try JSONDecoder().decode([News].self, from: data)
                completion(.success(activities))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    func fetchClubs(completion: @escaping (Result<[Club], Error>) -> Void) {
                        
        guard let url = URL(string: URLS.clubs.rawValue) else {
            completion(.failure(CustomError.invalidUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(CustomError.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(CustomError.invalidData))
                return
            }
            
            do {
                let activities = try JSONDecoder().decode([Club].self, from: data)
                completion(.success(activities))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    func fetchCategories() async throws -> [CategoryGame] {
        guard let url = URL(string: URLS.categories.rawValue) else { throw CustomError.invalidUrl }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let categories = try decoder.decode([CategoryGame].self, from: data)
        return categories
    }
}
