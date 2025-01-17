//
//  StorageHelper.swift
//  CoreDataPractice
//
//  Created by RC-Mac-Manish on 04/11/19.
//  Copyright © 2019 rarecrew. All rights reserved.
//

import Foundation
import CoreData

class StorageHelper {
    
    private init() {  }
    private(set) static var shared = StorageHelper()
    
    private(set) lazy var context = self.persistentContainer.viewContext
    
    // MARK: - Core Data stack
    
    private(set) lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "CoreDataPractice")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

extension StorageHelper {
    
    func fetchAll<MANAGED_OBJECT: NSManagedObject> (_ managedObject: MANAGED_OBJECT.Type) -> [MANAGED_OBJECT] {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: managedObject.className)
        
        do {
            let result = try self.context.fetch(fetchRequest) as? [MANAGED_OBJECT]
            return result ?? [MANAGED_OBJECT]()
        } catch {
            assertionFailure("Could not fetch results for \(MANAGED_OBJECT.className)")
            return [MANAGED_OBJECT]()
        }
        
    }
    
    
    func delete<MANAGED_OBJECT: NSManagedObject> (_ managedObject: MANAGED_OBJECT) {
        
        self.context.delete(managedObject)
        self.saveContext()
        
    }
    
}
