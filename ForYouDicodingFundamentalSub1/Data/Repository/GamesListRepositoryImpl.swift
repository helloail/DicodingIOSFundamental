//
//  OGamesListRepositoryImpl.swift
//  ForYouDicodingFundamentalSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 15/08/20.
//  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
//

import Foundation
    
class GamesListRepositoryImpl: GameListRepository {

    private var gameService: GamesService
    
    init(gameService: GamesService) {
        self.gameService = gameService
    }
    
    func fetchList(key: String,completion: @escaping ((Swift.Result<Games, Error>) -> Void)) {
        gameService.loadGames(key: key){ result in
            switch result {
            case .success(let posts):
                completion(.success(posts))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
