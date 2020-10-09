//
//  OGameListRepository.swift
//  ForYouDicodingFundamentalSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 15/08/20.
//  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
//

import Foundation

 protocol GameListRepository {
    func fetchList(key: String,completion: @escaping ((Swift.Result<Games, Error>) -> Void))
}
