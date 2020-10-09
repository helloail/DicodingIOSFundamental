//
//  DIContainer.swift
//  ForYouDicodingFundamentalSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 16/08/20.
//  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
//

import Foundation

class DIContainer {
    static func makeViewOGameUseCase() -> GameListUseCase{
        let service : GamesService = GamesServiceImpl()
        let repository : GameListRepository = GamesListRepositoryImpl(gameService: service)
        let usecase : GameListUseCase = GameListUseCaseImpl(repository:repository)
        
        return usecase
    }
    
    static func makeDetailGameUseCase() -> GameDetailUseCase{
        let service : GamesService = GamesServiceImpl()
        let repository : GamesDetailRepository = GamesDetailRepositoryImpl(gameService: service)
        let usecase : GameDetailUseCase = GameDetailUseCaseImpl(repository:repository)
        
        return usecase
        
    }
}
