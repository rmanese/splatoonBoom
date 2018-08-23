//
//  CoreDataManager.swift
//  splatoonBoom
//
//  Created by Roberto Manese III on 8/22/18.
//  Copyright © 2018 jawnyawn. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager: NSObject {

    var context: NSManagedObjectContext!
    static let shared: CoreDataManager = CoreDataManager()

    class func setUpCoreDataStack() {
        let container = NSPersistentContainer(name: "splatoonBoom")
        container.loadPersistentStores { (store, error) in
            guard error == nil else { NSLog("Failed to load core data stack!"); return }
            shared.context = container.viewContext
            NSLog("Loaded store!")
        }
    }
}
