//
//  APIManager.swift
//  NatiaL_HW23
//
//  Created by Natia's Mac on 16.08.22.
//

import Foundation
import UIKit

enum NetworkError:  Error {
    case dataNotFound
    case uRLError
}


class APIManager {
    static let apiManager =  APIManager()
    
    typealias completionBlock<T:Decodable> = (Result<T, Error>) -> Void
    let session = URLSession.shared
    
    func getData<T: Decodable>(from strUrl: String, completion: @escaping (completionBlock<T>)) {
       var urlComponent = URLComponents(string: strUrl)
        
        urlComponent?.queryItems = [
            URLQueryItem.init(name: "api_key", value: "a0aba78a00d2acb51bf5318879fcfa07")
        
        ]
        let url = URL(string: strUrl)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        
        session.dataTask(with: (urlComponent?.url)! ) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let response = response as? HTTPURLResponse else {
                return
            }
            guard(200...299).contains(response.statusCode) else {   print("Wrong Status", response.statusCode)
                return
                
            }
            guard let data = data else {
                completion(.failure(NetworkError.dataNotFound))
                return
            }
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
                
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
        
    }
    
}
