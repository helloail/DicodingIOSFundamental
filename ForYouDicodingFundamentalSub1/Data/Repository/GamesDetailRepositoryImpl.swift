//
//  GamesDetailRepositoryImpl.swift
//  ForYouDicodingFundamentalSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 17/08/20.
//  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
//

import Foundation

class GamesDetailRepositoryImpl: GamesDetailRepository {
   
    
    
    private var gameService: GamesService
    
    init(gameService: GamesService) {
        self.gameService = gameService
    }
    
    func fetchdetail(id: String, completion: @escaping ((Swift.Result<DetailGames, LoadPartnerReviewsError>) -> Void)) {
        gameService.loadDetailGames(id: id){ result in
            switch result {
            case .success(let posts):
                completion(.success(posts))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
