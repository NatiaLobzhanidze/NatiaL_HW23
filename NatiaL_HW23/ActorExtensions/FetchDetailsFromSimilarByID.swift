//
//  FetchDetailsFromSimilarByID.swift
//  NatiaL_HW23
//
//  Created by Natia's Mac on 17.08.22.
//

import Foundation
extension CustomEvent {
    
    func getDetailsURl(from arr: [SimilarTvShows]) async -> String  {
        
        if let elem = arr.randomElement() {
            return "https://api.themoviedb.org/3/tv/\(elem.id)?"
        } else {
            return "https://api.themoviedb.org/3/tv/\(0)?"
        }
    }
    
    func fetchDetails(with strUrl: String) async throws -> DetailsResponse? {
        
        var urlComponent = URLComponents(string: strUrl)
        urlComponent?.queryItems = [
            URLQueryItem.init(name: "api_key", value: "a0aba78a00d2acb51bf5318879fcfa07")]
        let url = URL(string: strUrl)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let( data, response) =  try await URLSession.shared.data(from: (urlComponent?.url)!)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print("NetworkError.dataNotFound")
            throw NetworkError.dataNotFound
        }
        return try JSONDecoder().decode(DetailsResponse.self, from: data)
        
    }
}
