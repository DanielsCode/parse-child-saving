//
//  CClass.swift
//  ParseTest
//
//  Created by Daniel Siegel on 10.02.16.
//  Copyright © 2016 Daniel Siegel. All rights reserved.
//

import Parse


class CClass : PFObject, PFSubclassing {
    
    @NSManaged var topic: String
    
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    static func parseClassName() -> String {
        return "CClass"
    }
}
