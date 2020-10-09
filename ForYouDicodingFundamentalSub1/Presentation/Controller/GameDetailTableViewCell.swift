//
//  GameDetailTableViewCell.swift
//  ForYouDicodingFundamentalSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 28/07/20.
//  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
//

import UIKit

class GameDetailTableViewCell: UITableViewCell {
    
    //
    @IBOutlet weak var imageGamesDetail: UIImageView!
    @IBOutlet weak var tittleGamesDetail: UILabel!
    @IBOutlet weak var playtimeGamesDetail: UILabel!
    @IBOutlet weak var ratingGamesDetail: UILabel!
    @IBOutlet weak var releaseGamesDetail: UILabel!
    @IBOutlet weak var descGamesDetail: UILabel!
    
    static let idgamesdetailtableviewcell = "idgamesdetailtableviewcell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func initCellDetail(_ images : String?, _ title : String?,_ release : String?, _ rating : Double?, _ playtime : Int?, _ desc : String?)  {
        
        
        if let title = title{
            tittleGamesDetail.text = title
        }
        
        if let released = release {
            releaseGamesDetail.text =  released
        }
        
        if let rating = rating {
            ratingGamesDetail.text = ("\(rating)")
        }
        
        if let description = desc {
            descGamesDetail.text = description
        }
        
        if let playtimes = playtime {
            playtimeGamesDetail.text = ("\(playtimes)")
        }
        
        if let image = images{
        
            imageGamesDetail.imageFromServerURL(urlString: image)
            
            
        }
        
    }
    
}
