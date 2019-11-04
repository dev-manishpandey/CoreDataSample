//
//  UserStorageManager.swift
//  CoreDataPractice
//
//  Created by RC-Mac-Manish on 04/11/19.
//  Copyright © 2019 rarecrew. All rights reserved.
//

import Foundation
import CoreData

struct UserStorageManager {
    // MARK: - Properties
    private let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: CD_User.className)
    
}

// MARK: - CRUD
extension UserStorageManager {
    
    func fetchAll () -> [User] {
        
        let usersManagedObject = StorageHelper.shared.fetchAll(CD_User.self)
        var users = [User]()
        
        for userManagedObject in usersManagedObject {
            users.append(User(id: userManagedObject.id, name: userManagedObject.name))
        }
        
        return users
    }
    
    func add(user: User) {
        
        let userManagedObject = CD_User(context: StorageHelper.shared.context)
        userManagedObject.id = user.id
        userManagedObject.name = user.name
        
        StorageHelper.shared.saveContext()
        
    }
    
    func delete (user: User) {
        
        let managedObject = CD_User(context: StorageHelper.shared.context)
        managedObject.id = user.id
        managedObject.name = user.name
        
        StorageHelper.shared.delete(managedObject)
        
    }
    
    func delete(by id: UUID) {
        
        let predicate = NSPredicate(format: "id = %@", id.description)
        fetchRequest.predicate = predicate
        
        do {
            let result = try StorageHelper.shared.context.fetch(fetchRequest) as! [CD_User]
            
            result.forEach {
                StorageHelper.shared.delete($0)
            }
            
        } catch {
            assertionFailure("Could not delete user with id: \(id)")
        }
        
    }
    
}

// MARK: - Filters
extension UserStorageManager {
    
    func getUser (by id: UUID) -> User? {
        
        let predicate = NSPredicate(format: "id = %@", id.description)
        fetchRequest.predicate = predicate
        
        do {
            if let result = try StorageHelper.shared.context.fetch(fetchRequest).first as? CD_User {
                return User(id: result.id, name: result.name)
            } else {
                return nil
            }
        } catch {
            assertionFailure("Could not find user with id: \(id)")
            return nil
        }
        
    }
    
    func getUser (by name: String) -> User? {
        
        let predicate = NSPredicate(format: "name = %@", name)
        fetchRequest.predicate = predicate
        
        do {
            let result = try StorageHelper.shared.context.fetch(fetchRequest).first as! CD_User
            return User(id: result.id, name: result.name)
        } catch {
            assertionFailure("Could not find user with name: \(name)")
            return nil
        }
        
    }
    
}
