//
//  ListEpisodesViewController.swift
//  MovileUpTest
//
//  Created by Caique Moreira on 16/07/15.
//  Copyright (c) 2015 Movile. All rights reserved.
//

import Foundation
import UIKit

class ListEpisodesViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var EpisodesTableView: UITableView!

    let episodios : [(episodeId : String, episodeName : String)] = [
        ("S01E01 ", "Winter is Coming"),
        ("S01E02 ", "The Kingsroad"),
        ("S01E03 ", "Lord Snow"),
        ("S01E04 ", "Cripples, Bastards and Broken Things"),
        ("S01E05 ", "The Wolf and the Lion"),
        ("S01E06 ", "A Golden Crown"),
        ("S01E07 ", "You Win or You Die"),
        ("S01E08 ", "The Pointy End"),
        ("S01E09 ", "Baelor"),
        ("S01E10 ", "Fire and Blood"),
        
    ]
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! EpisodeItemView
        cell.EpisodeIdLabel.text =  " \(episodios[indexPath.row].episodeId)"
        cell.EpisodeNameLabel.text = " \(episodios[indexPath.row].episodeName)"
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}