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

