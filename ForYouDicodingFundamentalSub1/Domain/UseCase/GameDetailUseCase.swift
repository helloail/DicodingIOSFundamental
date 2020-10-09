//
//  GameDetailUseCase.swift
//  ForYouDicodingFundamentalSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 17/08/20.
//  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
//

import Foundation
public protocol GameDetailUseCase {
    func loaddetail(id : String,completion: @escaping ((Swift.Result<DetailGames, LoadPartnerReviewsError>) -> Void))
}

public final class GameDetailUseCaseImpl: GameDetailUseCase {
    private let repository: GamesDetailRepository
    
    public init(repository: GamesDetailRepository) {
        self.repository = repository
    }
           
    public func loaddetail(id : String,completion: @escaping ((Swift.Result<DetailGames, LoadPartnerReviewsError>) -> Void)) {
        repository.fetchdetail(id : id) { result in
            switch result {
            case .success(let posts):
                completion(.success(posts))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
