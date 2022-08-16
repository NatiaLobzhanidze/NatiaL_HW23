//
//  SameShowModel.swift
//  NatiaL_HW23
//
//  Created by Natia's Mac on 16.08.22.
//

import Foundation
struct SimilarResponse: Decodable {
    let results: [SimilarTvShows]
    
}
struct SimilarTvShows: Decodable {
    let id: Int
}
