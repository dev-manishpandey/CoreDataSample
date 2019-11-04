//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by RC-Mac-Manish on 04/11/19.
//  Copyright © 2019 rarecrew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let userStorage = UserStorageManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        userStorage.add(user: User(id: UUID(), name: "Some user"))
        print(userStorage.fetchAll())
        //print(userStorage.getUser(by: UUID(uuidString: "283FF41E-604B-4E5D-84BF-DAE05A3C4C75")!))
        //userStorage.delete(by: UUID(uuidString: "283FF41E-604B-4E5D-84BF-DAE05A3C4C75")!)
    }

//    func addUser () {
//
//        let userManagedObject = CD_User(context: StorageHelper.shared.context)
//        userManagedObject.id = UUID()
//        userManagedObject.name = "XYZ"
//
//        StorageHelper.shared.saveContext()
//    }
//
//    func getAllUsers () {
//        let users = StorageHelper.shared.fetchAll(CD_User.self)
//
//        for user in users {
//            print("id:: \(user.id) and name:: \(user.name)")
//        }
//
//    }

}

