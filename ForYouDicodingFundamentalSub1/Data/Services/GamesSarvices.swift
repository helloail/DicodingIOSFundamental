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

//class CoreDataManager {
//
//    var moc : NSManagedObjectContext
//
//    static let shared  = CoreDataManager(moc: NSManagedObjectContext.current)
//
//    private init(moc : NSManagedObjectContext) {
//        self.moc = moc
//    }
//
//    private func fetchOrder(name : String) -> Game? {
//        var game = [Game]()
//
//        let request : NSFetchRequest<Game> = Game.fetchRequest()
//        request.predicate = NSPredicate(format: "name == %@", name )
//
//        do{
//            game = try self.moc.fetch(request)
//        }catch let error as NSError{
//            print(error)
//
//        }
//
//        return game.first
//    }
//
//
//    func deleteOrder(name : String) {
//        do {
//            if let game = fetchOrder(name: name){
//                self.moc.delete(game)
//                try self.moc.save()
//            }
//        }catch let error as NSError{
//            print(error)
//
//        }
//    }
//
//    func getAllOder() -> [Game] {
//        var game = [Game]()
//        let gamerequest : NSFetchRequest<Game> = Game.fetchRequest()
//
//        do{
//            game = try self.moc.fetch(gamerequest)
//        }catch let error as NSError {
//            print(error)
//
//        }
//        return game
//    }
//
//
//    func saveOrder(id: Int, image : String, rating : Double, released : String, title : String ){
//        let order = Game(context: self.moc)
//        order.id = Int64(id)
//        order.image = image
//        order.rating = rating
//        order.released = released
//        order.title = title
//
//        do{
//            try self.moc.save()
//        }catch let error as NSError{
//            print(error )
//        }
//    }
//}
//
//
//
