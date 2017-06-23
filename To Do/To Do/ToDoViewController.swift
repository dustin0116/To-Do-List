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
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // #warning Incomplete implementation, return the number of rows
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listToDoTableViewCell", for: indexPath) as! ToDoTableViewCell
        cell.title.text = "Title"
        cell.desc.text = "Description"
        
        return cell
    }
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "displayToDo"{
                print("Transitioning to the Display To Do View Controller")
            }
        }
    }
    
    
}
