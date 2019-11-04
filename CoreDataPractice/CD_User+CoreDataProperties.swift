//
//  CD_User+CoreDataProperties.swift
//  CoreDataPractice
//
//  Created by RC-Mac-Manish on 04/11/19.
//  Copyright © 2019 rarecrew. All rights reserved.
//
//

import Foundation
import CoreData


extension CD_User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CD_User> {
        return NSFetchRequest<CD_User>(entityName: "CD_User")
    }

    @NSManaged public var id: UUID
    @NSManaged public var name: String

}
