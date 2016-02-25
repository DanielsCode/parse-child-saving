# parse-child-saving
Parse test repo for child saving behaviour

## Instructions
1. git clone
2. create a new parse app (parse.com) 
3. Use ParseTest.xcworkspace (because of using cocoapods)
4. Add the application id / client key to the AppDelegate.swift
5. Make sure that the app permission allows client class creation (parse.com)
6. run 

## Expected behavior
If the parent class will be saved, all modified childs classes will be saved as well. In this case the message property of bclass should be changed to "New Child BClass message", but it doesn't. It will be still the initial message "Child BClass message".

## Futher details
* used cocoapods
* parse 1.12.0
* bug occurs only if the pointer of the child is in a array field of the parent (one-to-many). If it's a single relation (one-to-one) it is working as expected.

Thanks for helping!

