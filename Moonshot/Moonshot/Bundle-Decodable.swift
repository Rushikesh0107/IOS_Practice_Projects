//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Rushikesh Dadas on 30/06/24.
//

import Foundation

extension Bundle {
    func decode<T : Codable>(_ file : String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in the bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from the bundle")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-DD"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context){
            fatalError("Failed to decode \(file) from bundle due to missing key - '\(key.stringValue) - \(context.debugDescription)'")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) due to type mismatch - '\(context.debugDescription)'")
        } catch DecodingError.dataCorrupted(let context) {
            fatalError("Failed to decode the \(file) due to corrupted data. - \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) due to missing \(type) value - \(context.debugDescription)")
        } catch {
            fatalError("Failed to decode \(file) from the bundle = \(error.localizedDescription)")
        }
    }
}
