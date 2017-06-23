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
    
    static func saveToDo() {
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error)")
        }
    }
    
    static func newToDo() -> ToDo{
        let task = NSEntityDescription.insertNewObject(forEntityName: "ToDo", into: managedContext) as! ToDo
        return task
    }
}



