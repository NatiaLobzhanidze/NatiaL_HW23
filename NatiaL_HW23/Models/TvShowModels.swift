//
//  Models.swift
//  NatiaL_HW23
//
//  Created by Natia's Mac on 16.08.22.
//

import Foundation

struct TvShowResponse: Decodable {
    
    let results: [TvShows]
    
}

struct TvShows: Decodable {
    
    let name: String
    let id: Int
    let vote_average: Double
    
}


