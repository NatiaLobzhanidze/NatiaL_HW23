//
//  ViewController.swift
//  NatiaL_HW23
//
//  Created by Natia's Mac on 16.08.22.
//

import UIKit
class ViewController: UIViewController {
    
    
    let actorEvent = CustomEvent()
    
    var tvResult = [TvShows]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global().async {
            Task {
                await self.fetchedMoviesAndGetRandom()
               
            }
        }
    }
    
    func fetchedMoviesAndGetRandom() async {
        print(1)
        
        let tvShowResult =  try? await actorEvent.fetchTvShows(from: "https://api.themoviedb.org/3/tv/top_rated?")
        let similarsUrl =  await actorEvent.getSimilarsUrl(from: tvShowResult!.results)
        let similarsArray = try? await actorEvent.fetchSimilarTvShows(with: similarsUrl)
        let detailsUrl = await actorEvent.getDetailsURl(from: similarsArray!.results)
        let details = try? await actorEvent.fetchDetails(with: detailsUrl)
        
        print(1.1, details)
    }
    
  
    
  
    
}


