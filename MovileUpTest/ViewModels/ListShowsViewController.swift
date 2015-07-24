//
//  ListShowsViewController.swift
//  MovileUpTest
//
//  Created by Caique Moreira on 17/07/15.
//  Copyright (c) 2015 Movile. All rights reserved.
//

import Foundation
import UIKit

class ListShowsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let client = TraktHTTPClient()

    var shows : [Show] = []
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        client.getPopularShows({
            result in
            
            println(result)
            
            if let showsTemp = result.value {
                self.shows = showsTemp
                println("loaded shows")
                self.collectionView.reloadData()
            } else {
                println("Error handling shows")
            }
            
        })
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shows.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(Reusable.CellShow, forIndexPath: indexPath) as! TvShowItemView
        cell.loadShow(shows[indexPath.row])
        
        return cell
    }
 

}