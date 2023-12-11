//
//  Persistance.swift
//  FinalProject
//
//  Created by Alex Lark on 12/10/23.
//

import CoreData
struct PersistentController{
    static let shared = PersistentController()
    let container: NSPersistentContainer
    init(){
        container = NSPersistentContainer(name: "TaskData")
        container.loadPersistentStores(completionHandler:
                                        {(storeDescription, error) in
            if let error = error as NSError? {
                fatalError("unresolved error:\(error)")
            }
        })
    }
}
