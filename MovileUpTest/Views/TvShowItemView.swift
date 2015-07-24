//
//  TvShowItemView.swift
//  MovileUpTest
//
//  Created by Caique Moreira on 17/07/15.
//  Copyright (c) 2015 Movile. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class TvShowItemView : UICollectionViewCell{
    
    @IBOutlet weak var imageShow: UIImageView!
    @IBOutlet weak var nameShow: UILabel!
    
    private var task: RetrieveImageTask?
    
    func loadShow(show: Show) {
        
        let placeholder = UIImage(named: "poster")
        if let url = show.images?.poster?.full ?? show.images?.poster?.medium ?? show.images?.poster?.thumb {
            println(url)
            task = imageShow.kf_setImageWithURL(url, placeholderImage : placeholder)
        } else {
            imageShow.image = placeholder
        }
        
        nameShow.text = show.title
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        task?.cancel()
        task = nil
        imageShow.image = nil
    }
}