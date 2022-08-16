//
//  ViewController.swift
//  NatiaL_HW23
//
//  Created by Natia's Mac on 16.08.22.
//

import UIKit
class ViewController: UIViewController {
    
    var apiManager = APIManager()
    
    let actorEvent = CustomEvent()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global().async {
            Task {
                await self.fetchedMoviesAndGetRandom()
                await self.getSimilars()
                await self.getDetails()
            }
        }
    }
    
    func fetchedMoviesAndGetRandom() async {
        print(1)
        await actorEvent.fetchTvShows()
        let res = await actorEvent.tvResult
        await actorEvent.getRendomElement(from: res)
        
    }
    
    func getSimilars() async {
        print(2, await actorEvent.movieID)
        
        await actorEvent.fetchSimilarTvShows()
        await actorEvent.getRendomElement(from: actorEvent.similartvResult)
        print(await actorEvent.detailsId)
    }
    
    func getDetails() async {
        print(3)
        await actorEvent.fetchDetails()
        
    }
    
}


