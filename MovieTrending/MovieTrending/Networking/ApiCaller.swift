//
//  ApiCaller.swift
//  MovieTrending
//
//  Created by Boris Ofon on 1/15/23.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

class ApiCaller {
    
    static func getTrending( completion: @escaping (Result<Movies, NetworkError>)-> () ) {
        
        let urlString = NetworkConstants.shared.serverAdress + "trending/all/day?api_key=" + NetworkConstants.shared.apiKey
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error != nil{
                completion(.failure(.urlError))
            }
            
            guard let receivedData = data else {
                completion(.failure(.urlError))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(Movies.self, from: receivedData)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.canNotParseData))
            }
            
        }.resume()
    }
}
