//
//  OGamesSarvices.swift
//  ForYouDicodingFundamentalSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 15/08/20.
//  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
//

import Foundation

public enum LoadPartnerReviewsError: Error {
    //        case badRequest(apiErrors: [ApiError])
    case unauthorized
    //        case forbidden(apiError: ApiError)
    case notFound
    case internalServerError
    case requestTimeout
    case noInternetConnection
    //        case unknown(apiError: ApiError)
}
protocol GamesService {
    func loadGames(key : String,completion: @escaping ((Swift.Result<Games, Error>) -> Void))
    func loadDetailGames(id : String,completion: @escaping ((Swift.Result<DetailGames, LoadPartnerReviewsError>) -> Void))
}


class GamesServiceImpl: GamesService {
    
    
    func loadDetailGames(id: String, completion: @escaping ((Swift.Result<DetailGames, LoadPartnerReviewsError>) -> Void)) {
        
        let newKey: String = id.replacingOccurrences(of: " ", with: "+")
        let urlString = ("https://api.rawg.io/api/games/"+newKey)
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, urlResponse, error) in
            if let error = error {
                completion(.failure(.unauthorized))
                return
            }
            guard let data = data else { return }
            
            guard let httpresponse = urlResponse as? HTTPURLResponse else {
                let error = ApiError(id: -1, message: "error")
                completion(.failure(.unauthorized))
                return
            }
            
            if httpresponse.statusCode == 200 {
                
                do {
                    let posts = try JSON().newJSONDecoder().decode(DetailGames.self, from: data)
                    
                    completion(.success(posts))
                } catch(let error) {
                    completion(.failure(.unauthorized))
                }
            }
            
          
        }.resume()
    }
    
    
    
    func loadGames(key : String, completion: @escaping ((Swift.Result<Games, Error>) -> Void)) {
        
        let newKey:String = key.replacingOccurrences(of: " ", with: "+")
        
        let urlString = ("https://api.rawg.io/api/games?search="+newKey)
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, urlResponse, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            
            do {
                let posts = try JSON().newJSONDecoder().decode(Games.self, from: data)
                completion(.success(posts))
            } catch(let error) {
                completion(.failure(error))
            }
        }.resume()
    }
    
}
