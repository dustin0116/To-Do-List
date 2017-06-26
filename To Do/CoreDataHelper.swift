//
//  CoreDataHelper.swift
//  To Do
//
//  Created by Dustin Hsiang on 6/23/17.
//  Copyright © 2017 Dustin Hsiang. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataHelper {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    
    
    
    static func newToDo() -> ToDo {
        let task = NSEntityDescription.insertNewObject(forEntityName: "ToDo", into: managedContext) as! ToDo
        return task
    }
    
    
    static func saveToDo() {
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error)")
        }
    }
    
    // delete a note
    static func delete(toDo: ToDo) {
        managedContext.delete(toDo)
        saveToDo()
    }

    static func retrieveToDo() -> [ToDo] {
        let fetchRequest = NSFetchRequest<ToDo>(entityName: "ToDo")
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let error as NSError {
            print("Could not fetch \(error)")
        }
        return []
    }

}



