//
//  Games.swift
//  ForYouDicodingFundamentalSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 03/07/20.
//  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
//

import Foundation

// MARK: - Order
struct Games: Codable {
    
   

    var  results: [Result]?

    
    enum CodingKeys: String, CodingKey {
        case results
        
    }
}

// MARK: - Result
struct Result: Codable {
    
  
    
    var id: Int?
    var slug, name, released: String?
    var backgroundImage: String?
    var rating: Double?

    enum CodingKeys: String, CodingKey {
        case id, slug, name, released
        case backgroundImage = "background_image"
        case rating
 
    }
    
}


