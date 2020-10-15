//
//  UserProfileViewController.swift
//  ForYouDicodingFundamentalSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 06/07/20.
//  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
//

import Foundation
import UIKit

class UserProfileViewController: UIViewController {
    
    @IBOutlet weak var imgProfile: UIImageView!
    static let idUserProfileViewController = "profilestoryboard"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCircle(imgProfile)
        // Do any additional setup after loading the view.
    }
    
    func setupCircle(_ image : UIImageView){
        image.layer.borderWidth = 1.0
        image.layer.masksToBounds = false
        image.clipsToBounds = true
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.cornerRadius = imgProfile.frame.size.height/2
    }
    
    
}
