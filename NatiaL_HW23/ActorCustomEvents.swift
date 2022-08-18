//
//  ActorCustomEvents.swift
//  NatiaL_HW23
//
//  Created by Natia's Mac on 16.08.22.
//

import Foundation
import UIKit

actor CustomEvent {
    
    enum NetworkError: Error {
        case dataNotFound
    }
    
    func getSimilarsUrl (from arr: [TvShows]) async -> String {
        
        if let elem = arr.randomElement() {
            return  "https://api.themoviedb.org/3/tv/\(elem.id)/similar?"
        } else {
            return "https://api.themoviedb.org/3/tv/\(0)/similar?"
        }
    }
    
    func getDetailsURl(from arr: [SimilarTvShows]) async -> String  {
        
        if let elem = arr.randomElement() {
            return "https://api.themoviedb.org/3/tv/\(elem.id)?"
        } else {
            return "https://api.themoviedb.org/3/tv/\(0)?"
        }
    }
    
    func getData(from strUrl: String, isTvShow: Bool, isSimilarShow: Bool , isDetails: Bool) async throws -> (tvShows: TvShowResponse?, similars: SimilarResponse?, details: DetailsResponse?) {
        
        var urlComponent = URLComponents(string: strUrl)
         urlComponent?.queryItems = [
             URLQueryItem.init(name: "api_key", value: "a0aba78a00d2acb51bf5318879fcfa07")
         
         ]
         let url = URL(string: strUrl)
         var request = URLRequest(url: url!)
         request.httpMethod = "GET"
     
        let( data, response) =  try await URLSession.shared.data(from: (urlComponent?.url)!)
       
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print("NetworkError.dataNotFound")
             throw NetworkError.dataNotFound
           }
        if isTvShow {
            let obj = try JSONDecoder().decode(TvShowResponse.self, from: data)
            return (tvShows: obj, similars: nil, details: nil)
        } else if isSimilarShow {
            let obj = try JSONDecoder().decode(SimilarResponse.self, from: data)
            return (tvShows: nil, similars: obj, details: nil)
            
        } else  {
            
            let obj = try JSONDecoder().decode(DetailsResponse.self, from: data)
            return (tvShows: nil, similars: nil, details: obj)
        
        }
       
        
    }
 
    
}

