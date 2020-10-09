//
//  NSManageObjectContect+Extentions.swift
//  ForYouDicodingFundamentalSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 19/09/20.
//  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension NSManagedObjectContext{
    
    static var current : NSManagedObjectContext{
        let delagete = UIApplication.shared.delegate as! AppDelegate
        return delagete.persistentContainer.viewContext
    }
}
