//
//  ActorExtensions.swift
//  NatiaL_HW23
//
//  Created by Natia's Mac on 17.08.22.
//

import Foundation
import UIKit
extension CustomEvent {
    func fetchTvShows() {
        semaphore.wait()
        api.getData(from:"https://api.themoviedb.org/3/tv/top_rated?" ) { (result:Result<TvShowResponse, Error>) in
            
            switch result {
            case .success(let success):
                self.tvResult = success.results
                print("fetchTvResult",self.tvResult)
                self.semaphore.signal()
            case .failure(let failure):
                print(failure.localizedDescription)
                self.semaphore.signal()
            }
            
        }
        semaphore.wait()
        semaphore.signal()
        
    }
    
}
 
