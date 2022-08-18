//
//  FetchSimilarsFromID.swift
//  NatiaL_HW23
//
//  Created by Natia's Mac on 17.08.22.
//

import Foundation
extension CustomEvent {
    
    func getRendomElement (from arr: [TvShows]) {
       
        if let elem = arr.randomElement() {
            self.movieID = elem.id
            print(self.movieID)
           
        }
        
     
    }
    
    // randomly choose tvShow and fetch similar tvShows
    
    func fetchSimilarTvShows() {
        
      
        api.getData(from: "https://api.themoviedb.org/3/tv/\(movieID)/similar?") { (result:Result<SimilarResponse, Error>) in
            
            switch result {
            case  .success( let success ):
                
                self.similartvResult = success.results
                print("Similar TvShows", success.results)
                
            case let .failure(failure):
                
                print("errors error",failure.localizedDescription)
            }
            
        }
        
    }
    
}
