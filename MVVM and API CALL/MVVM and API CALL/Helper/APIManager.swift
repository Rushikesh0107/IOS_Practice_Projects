//
//  APIManager.swift
//  MVVM and API CALL
//
//  Created by Rushikesh Dadas on 13/07/24.
//

import Foundation

enum NetworkError  : Error {
    case invalidUrl
    case invalidResponse
}

final class APIManager {
    
    static let shared = APIManager()
    private init() { }
    
    func getRequest<T : Decodable>(url : String ) async throws -> T {
        guard let safeUrl = URL(string: url) else {
            throw NetworkError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: safeUrl)
        
        guard let response = response as? HTTPURLResponse, 200 ... 299 ~= response.statusCode else {
            throw NetworkError.invalidResponse
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
