//
//  ActorCustomEvents.swift
//  NatiaL_HW23
//
//  Created by Natia's Mac on 16.08.22.
//

import Foundation
import UIKit

actor CustomEvent {
    
    let semaphore = DispatchSemaphore(value: 1)
    
    let api = APIManager()
    
    var tvResult = [TvShows]()
    var similartvResult = [SimilarTvShows]()
    var details = [Details]()
    
    var movieID = 0
    var detailsId = 0
    
    
  
   
}

