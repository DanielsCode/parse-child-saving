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
        
        
        // Execute Code
        createSchema { (success) -> Void in
            if success {
                self.changeObjChildAndSave({ (success) -> Void in
                    if success {
                        print("all code done")
                    }
                })
            }
        }
    }

    
    private func createSchema(completion: ((success:Bool)->Void)?) {

        let parent = AClass()
        parent.title = "First post of AClass"
        
        let child = BClass()
        child.message = "Child BClass message"
        
        
        parent.childs = [child]
        parent.saveInBackgroundWithBlock { (success, error) -> Void in
            if success {
                print("Class A and B are created")
                completion!(success: true)
            } else {
                print("Error: \(error)")
                completion!(success: false)
            }
        }
    }
    
    private func changeObjChildAndSave(completion: ((success:Bool)->Void)?) {
        
        // Fetch AClass with Childs
        let query = AClass.query()
        query?.includeKey("childs")
        query?.getFirstObjectInBackgroundWithBlock({ (parent, error) -> Void in
            if error == nil {
                
                // Changing propertie of a child element
                let parentObj = parent as? AClass
                print("current Message 1: \(parentObj?.childs?.last?.message)")
                let newMessage = "New Child BClass message"
                parentObj?.childs?.last?.message = newMessage
                
                // Save parent object (AClass)
                parentObj?.saveInBackgroundWithBlock({ (success, error) -> Void in
                    if success {
                        
                        // Fetch AClass again to see if the child was changed
                        let query = AClass.query()
                        query?.includeKey("childs")
                        query?.getFirstObjectInBackgroundWithBlock({ (parent, error) -> Void in
                            if error == nil {
                                
                                // Show message
                                let parentObj = parent as? AClass
                                print("current Message 2: \(parentObj!.childs?.last?.message)")
                                
                                if (parentObj!.childs?.last?.message == newMessage) {
                                    print("Everything works as expected")
                                } else {
                                    print("Wrong behaviour - Bug?")
                                }
                                
                                completion!(success: true)
                            } else {
                                print("Error: \(error)")
                                 completion!(success: false)
                            }
                        })
                    } else {
                        print("Error: \(error)")
                         completion!(success: false)
                    }
                })
            } else {
                print("Error: \(error)")
                 completion!(success: false)
            }
        })
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

