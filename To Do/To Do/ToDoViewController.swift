//
//  ToDoViewController.swift
//  To Do
//
//  Created by Dustin Hsiang on 6/23/17.
//  Copyright © 2017 Dustin Hsiang. All rights reserved.
//

import UIKit

class ToDoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tasks = CoreDataHelper.retrieveToDo()
    }
    
    var tasks = [ToDo]() {
        didSet {
            tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listToDoTableViewCell", for: indexPath) as! ToDoTableViewCell
        let row = indexPath.row
        let toDo = tasks[row]
        
        cell.title.text = toDo.title
        cell.desc.text = toDo.content
        cell.time.text = toDo.time?.convertToString()
        
        return cell
    }
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "displayToDo"{
                print("Table View Cell Tapped")
                let indexPath = tableView.indexPathForSelectedRow!
                let toDo = tasks[indexPath.row]
                let displayToDoViewController = segue.destination as! DisplayToDoViewController
                displayToDoViewController.tasks = toDo
            } else if identifier == "compose" {
                print("compose button tapped")
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //1
            CoreDataHelper.delete(toDo: tasks[indexPath.row])
            //2
            tasks = CoreDataHelper.retrieveToDo()
        }
        
    }
    
    @IBAction func unwindToDoViewController(_sender: UIStoryboardSegue) {
        self.tasks = CoreDataHelper.retrieveToDo()
    }
}

