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
        print("Start")
        
        let tvShowResult = try? await actorEvent.getData(from: "https://api.themoviedb.org/3/tv/top_rated?", isTvShow: true, isSimilarShow: false, isDetails: false)
        let similarsUrl =  await actorEvent.getSimilarsUrl(from: (tvShowResult?.tvShows!.results)!)
        
        let similarsArray = try? await actorEvent.getData(from: similarsUrl, isTvShow: false, isSimilarShow: true, isDetails: false)
        
        let detailsUrl = await actorEvent.getDetailsURl(from: similarsArray!.similars!.results)
        let details = try? await actorEvent.getData(from: detailsUrl, isTvShow: false, isSimilarShow: false, isDetails: true).details
          printDetails(from: details)
 
        print("End")
    }
    
    @MainActor
    func printDetails(from obj: DetailsResponse?) {
        guard let detObj = obj else {
            print("no details")
            return }

        print("Random Tv-Show details: \n name - \(detObj)" )


    }
 //   , let creatby = obj?.creator.first?.name, let episods = obj?.episodes
    // \n created by: \(creatby) \n rating - \(episods)"
}


