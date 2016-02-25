//
//  ViewController.swift
//  ParseTest
//
//  Created by Daniel Siegel on 10.02.16.
//  Copyright © 2016 Daniel Siegel. All rights reserved.
//

import UIKit
import Parse
class ViewController: UIViewController {
    
    var parentObj:AClass?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        /*
        let parent = AClass()
        parent.title = "First post"
        
        let child = BClass()
        child.message = "Start"
        
        parent.childs = [child]
        parent.saveInBackground()
        */
        print("Test")
        
        
        
        
        let query = AClass.query()
        query?.includeKey("childs")
        query?.getFirstObjectInBackgroundWithBlock({ (parent, error) -> Void in
            if error == nil {
                let parentObj = parent as? AClass
                print("current Message 1: \(parentObj?.childs?.last?.message)")
                parentObj?.childs?.last?.message = "Changed"
                parentObj?.saveInBackgroundWithBlock({ (success, error) -> Void in
                    if success {
                        let query = AClass.query()
                        query?.includeKey("childs")
                        query?.getFirstObjectInBackgroundWithBlock({ (parent, error) -> Void in
                             if error == nil {
                                let parentObj = parent as? AClass
                                print("current Message 2: \(parentObj!.childs?.last?.message)")
                             } else {
                                print("Error: \(error)")
                            }
                        })
                    } else {
                        print("Error: \(error)")
                    }
                })
            } else {
                print("Error: \(error)")
            }
        })

        /*
        
        // Single Child Test
        
        let query = AClass.query()
        query?.includeKey("singleChild")
        query?.getFirstObjectInBackgroundWithBlock({ (parent, error) -> Void in
            if error == nil {
                let parentObj = parent as? AClass
                print("current Message 1: \(parentObj?.singleChild?.message)")
                parentObj?.singleChild?.message = "ChangedID"
                parentObj?.saveInBackgroundWithBlock({ (success, error) -> Void in
                    if success {
                        let query = AClass.query()
                        query?.includeKey("singleChild")
                        query?.getFirstObjectInBackgroundWithBlock({ (parent, error) -> Void in
                            if error == nil {
                                let parentObj = parent as? AClass
                                print("current Message 2: \(parentObj!.singleChild?.message)")
                            } else {
                                print("Error: \(error)")
                            }
                        })
                    } else {
                        print("Error: \(error)")
                    }
                })
            } else {
                print("Error: \(error)")
            }
        })
        */
        
    }

    func changeObjChild() {

        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

