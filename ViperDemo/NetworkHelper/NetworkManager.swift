//
//  NetworkManager.swift
//  ViperArch
//
//  Created by salmanul faris on 07/05/24.
//  Copyright © 2024. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchData(completion: @escaping (Result<[UniversityObject], Error>) -> Void) {
//    let url  = "No URL"
    let url  = "http://universities.hipolabs.com/search?country=United%20Arab%20Emirates"
        guard let url = URL(string: url) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(NetworkError.requestFailed))
                return
            }
            do {
                let universities = try JSONDecoder().decode([UniversityObject].self, from: data)
                completion(.success(universities))
            } catch {
                completion(.failure(NetworkError.invalidResponse))
            }
        }

        task.resume()
    }
}

enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case invalidResponse
}
