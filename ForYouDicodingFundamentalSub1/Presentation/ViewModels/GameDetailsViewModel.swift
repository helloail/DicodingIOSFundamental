//
//  OGameDeetailsViewModel.swift
//  ForYouDicodingFundamentalSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 18/08/20.
//  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
//

import Foundation


enum gamedetailbackgroundviewcolor {
    case black
    case white
}

protocol GameDetailsViewModelInput {
    func didload(_ id : String)
}

protocol GameDetailsViewModelOutpot{
    var detail: Observable<DetailGames> { get }
    var loading: Observable<Bool> { set get }
    var errorMessage: Observable<String?> { set get }
    var backgroundcolor : Observable<gamedetailbackgroundviewcolor> {set get}
}

protocol GamesDetailViewModels: GameDetailsViewModelInput, GameDetailsViewModelOutpot { }

class GamesDetailViewModelsimpl : GamesDetailViewModels {
    
    
    private var useCase: GameDetailUseCase

     init(useCase: GameDetailUseCase) {
         self.useCase = useCase
     }
    
    func didload(_ id : String) {
        load(id: id)
        
    }
    
    private func load(id : String){
        loading.value = true
        
        useCase.loaddetail(id: id, completion: { result in
            switch result {
            case .success(let posts):
                self.detail.value = posts
            case .failure(let error):
                self.errorMessage.value = error.localizedDescription
                switch error {
                case .unauthorized:
                    self.backgroundcolor.value = .black
                    
                default:
                    
                    self.backgroundcolor.value = .black
                }
            }
            
            self.loading.value = false
        })
        
    }
    
    
    var backgroundcolor: Observable<gamedetailbackgroundviewcolor> = Observable(.black)

    var detail: Observable<DetailGames> = Observable(DetailGames())
    
    var loading: Observable<Bool>  = Observable(false)
    
    var errorMessage: Observable<String?> = Observable(nil)

    
    
}
