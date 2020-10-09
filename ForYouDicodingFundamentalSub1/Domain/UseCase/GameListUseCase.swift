//
//  OGameListUseCase.swift
//  ForYouDicodingFundamentalSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 15/08/20.
//  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
//

import Foundation

 protocol GameListUseCase {
    func load(key : String,completion: @escaping ((Swift.Result<Games, Error>) -> Void))
}

 final class GameListUseCaseImpl: GameListUseCase {
    private let repository: GameListRepository
    
    public init(repository: GameListRepository) {
        self.repository = repository
    }
           
    public func load(key : String,completion: @escaping ((Swift.Result<Games, Error>) -> Void)) {
        repository.fetchList(key : key) { result in
            switch result {
            case .success(let posts):
                completion(.success(posts))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
