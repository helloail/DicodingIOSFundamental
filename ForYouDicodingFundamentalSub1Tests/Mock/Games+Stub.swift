//
//  Games+Stub.swift
//  ForYouDicodingFundamentalSub1Tests
//
//  Created by Moh Zinnur Atthufail Addausi on 17/09/20.
//  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
//

@testable import ForYouDicodingFundamentalSub1
import Foundation


extension Result{
    static func stub( id : Int = 1,
                      slug : String = "najsnja",
                      name : String = "ajdjb",
                      released : String = "danjbdab",
                      backgroundImage : String = "dvfsdb",
                      rating : Double = 2.0) -> Self{
        
        Result(id: id, slug: slug, name: name, released: released, backgroundImage: backgroundImage, rating: rating)
        
        
    }
    
    
}
