//
//  OGamesListViewModels.swift
//  ForYouDicodingFundamentalSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 09/08/20.
//  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
//

import Foundation

enum GamesListViewModelsRoute{
    case initial
    case profile
    case search(_ key : String)
    case detailgames(_ id : Int)
}

protocol GamesListViewModelsinput {
    func didload(_ key : String)
}

protocol GamesListViewModelsoutput{
    var list: Observable<[Result]?> { get }
    var loading: Observable<Bool> { set get }
    var errorMessage: Observable<String?> { set get }
    var route: Observable<GamesListViewModelsRoute> { set get }
}


protocol GamesListViewModels: GamesListViewModelsinput, GamesListViewModelsoutput { }


class GamesListViewModelsimpl : GamesListViewModels {
    
    private var useCase: GameListUseCase

     init(useCase: GameListUseCase) {
         self.useCase = useCase
     }
    
    func didload(_ key : String) {
        load(key: key)
        
    }
    
    private func load(key : String){
        loading.value = true
        
        useCase.load(key: key, completion: { result in
            switch result {
            case .success(let posts):
                self.list.value = posts.results
            case .failure(let error):
                self.errorMessage.value = error.localizedDescription
            }
            
            self.loading.value = false
        })
        
    }
    
    var list: Observable<[Result]?> = Observable([Result()])
    
    var loading: Observable<Bool>  = Observable(false)
    
    var errorMessage: Observable<String?> = Observable(nil)
    
    var route: Observable<GamesListViewModelsRoute> = Observable(.initial)
    
    
}
