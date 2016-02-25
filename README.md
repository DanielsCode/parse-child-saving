# parse-child-saving
Parse test repo for child saving behaviour / weird behaviour in one-to-many relations

## Instructions
1. git clone
2. pod update (to be sure that you are using parse ios sdk 1.12.0)
3. create a new parse app (parse.com) 
4. Use ParseTest.xcworkspace (because of using cocoapods)
5. Add the application id / client key to the AppDelegate.swift
6. Make sure that the app permission allows client class creation (parse.com)
7. run 
8. check console log

## Expected behavior
If the parent class will be saved, all modified childs classes will be saved as well. In this case the message property of bclass should be changed to "New Child BClass message", but it doesn't. It will be still the initial message "Child BClass message". 

## Futher details
* used cocoapods
* parse 1.12.0
* bug occurs only if the pointer of the child is in a array field of the parent (one-to-many). If it's a single relation (one-to-one) it is working as expected.
* subclasses are registered in AppDelegate.swift
* all fetch/update code is in the ViewController.swift file

Thanks for helping!

