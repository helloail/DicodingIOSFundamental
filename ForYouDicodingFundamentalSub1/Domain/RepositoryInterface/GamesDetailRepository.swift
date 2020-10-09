//
//  GamesDetailRepository.swift
//  ForYouDicodingFundamentalSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 17/08/20.
//  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
//

import Foundation

public protocol GamesDetailRepository {
    func fetchdetail(id: String,completion: @escaping ((Swift.Result<DetailGames, LoadPartnerReviewsError>) -> Void))
}
