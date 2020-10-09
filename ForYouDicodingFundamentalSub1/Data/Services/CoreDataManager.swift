//
//  CoreDataManager.swift
//  ForYouDicodingFundamentalSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 10/09/20.
//  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
//


import Foundation
import CoreData

class CoreDataManager{
    lazy var persistentconteiner : NSPersistentContainer = {
        let persistentconteiner  = NSPersistentContainer(name: "GameData")
        persistentconteiner.loadPersistentStores { _, error in

        }
        return persistentconteiner
    }()



    var moc: NSManagedObjectContext {
        persistentconteiner.viewContext
    }



    func saveData(id: Int?,name: String?, image : String?, release : String?, rating :Double?){

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Game")
        let predicate = NSPredicate(format: "title == %@", name!)

        request.predicate = predicate

        do {
            let results = try moc.fetch(request)
            if results.count > 0{
                Utils.showMessagedCancel(title: "Warning !", msg: "Your data has been already", button: "Cancel")
            }else{
                let game = Game(context: moc)

                game.setValue(id, forKeyPath: "id")

                game.setValue(name, forKeyPath: "title")

                game.setValue(image, forKeyPath: "image")

                game.setValue(release, forKeyPath: "released")

                game.setValue(rating, forKeyPath: "rating")


                do {
                    try moc.save()
                    //            FavouritesViewController.game.append(person)
                } catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")

                }

            }

        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }

    }


    func fetchGame() -> [Game] {
        do{
            let request = NSFetchRequest<Game>(entityName: "Game")
            let results = try moc.fetch(request)
            return results
        }catch{
            print(error)
            return []
        }
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
//    func deleteOrder(name : String) {
//        do {
//            if let game = fetchOrder(name: name){
//
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
//    func saveOrder(id : Int, image : String, rating : Double, release : String, title : String ){
//        let game = Game(context: self.moc)
//        game.id = Int64(id)
//        game.image = image
//        game.rating = rating
//        game.released = release
//        game.title = title
//
//        do{
//            try self.moc.save()
//        }catch let error as NSError{
//            print(error )
//        }
//    }
//}
