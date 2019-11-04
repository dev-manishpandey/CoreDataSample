//
//  NSObject+Name.swift
//  CoreDataPractice
//
//  Created by RC-Mac-Manish on 04/11/19.
//  Copyright © 2019 rarecrew. All rights reserved.
//

import Foundation

extension NSObject {
    
    static var className: String {
        return String(describing: self)
    }
    
    func className() -> String {
        return String(describing: type(of: self))
    }
    
}
