//
//  GamesListViewTableViewCell.swift
//  ForYouDicodingFundamentalSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 04/07/20.
//  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
//

import UIKit

class GamesListViewTableViewCell: UITableViewCell {
    
    static let idGamesListViewTableViewCell = "idGamesListViewTableViewCell"
    @IBOutlet weak var GameImage: UIImageView!
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var GameLabel: UILabel!
    @IBOutlet weak var RatingView: UIView!
    @IBOutlet weak var RatingLabel: UILabel!
    @IBOutlet weak var GameReleaseLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func initCellDest(_ images : String?, _ title : String?,_ release : String?, _ rating : Double?)  {
        
        
        if let image = images {
            
            self.GameImage.imageFromServerURL(urlString: image)
            
            
        }
        
        if let name = title{
            
            GameLabel.text = name
        }
        
        if let release = release {
            
            GameReleaseLabel.text = release
        }
        
        if let rating = rating{
            
            RatingLabel.text = ("\(rating)")
        }
        
        setRadius()
    }
    
    func setRadius()  {
        RatingView.layer.cornerRadius = 4
        viewCell.layer.cornerRadius = 10
        GameImage.layer.cornerRadius = 10
        GameImage.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
    }
}

