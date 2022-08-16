//
//  DetailsModel.swift
//  NatiaL_HW23
//
//  Created by Natia's Mac on 16.08.22.
//

import Foundation
struct DetailsResponse: Decodable {
    let created_by: [Details]
    let seasons: [Seasons]
    
}

struct Details: Decodable {
    let name: String
    
}
struct Seasons: Decodable {
    let air_date: String
    let overview: String
    let episode_count: Int
}
