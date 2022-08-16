//
//  FetchDetailsFromSimilarByID.swift
//  NatiaL_HW23
//
//  Created by Natia's Mac on 17.08.22.
//

import Foundation
extension CustomEvent {
    
    func getRendomElement (from arr: [SimilarTvShows])  {
        semaphore.wait()
        
        if let elem = arr.randomElement() {
            self.detailsId = elem.id
            semaphore.signal()
        }
        semaphore.wait()
        semaphore.signal()
    }
    
    func fetchDetails() {
        semaphore.wait()
        api.getData(from: "https://api.themoviedb.org/3/tv/\(detailsId)?") { (result:Result<DetailsResponse, Error>)  in
            
            switch result {
            case  .success( let success):
                
                self.details = (success.created_by)
                print( "details:", self.details)
                self.semaphore.signal()
            case .failure(let failure):
                print(failure.localizedDescription)
                self.semaphore.signal()
            }
        }
       
       
    }
}
