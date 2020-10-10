//
//  ApiError.swift
//  ForYouDicodingFundamentalSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 23/09/20.
//  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
//

import Foundation

public struct ApiErrorCode {
    public static let unkownErrorId = -1
}

public struct ApiError: Codable, Error {
    public let id: Int
    public let message: String
    public let field: String?
    
  

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case message = "message"
        case field = "field"
    }
    public init(id: Int, message: String) {
        self.id = id
        self.message = message
        self.field = nil
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
