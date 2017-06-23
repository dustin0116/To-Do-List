//
//  DisplayToDoViewController.swift
//  To Do
//
//  Created by Dustin Hsiang on 6/23/17.
//  Copyright © 2017 Dustin Hsiang. All rights reserved.
//

import UIKit

class DisplayToDoViewController: UIViewController {
    
    var tasks: ToDo?
    
    @IBOutlet weak var toDoTextField: UITextField!
    @IBOutlet weak var toDoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let toDoViewController = segue.destination as! ToDoViewController
        if let identifier = segue.identifier {
            if identifier == "save" {
                if let tasks = tasks {
                    tasks.title = toDoTextField.text!
                    tasks.description = toDoTextField.text!
                    toDoViewController.tableView.reloadData()
                } else {
                    
                    let newToDo = ToDo()
                    
                    newToDo.title = toDoTextField.text ?? ""
                    newToDo.description = toDoTextView.text ?? ""
                    
                    let ToDoViewController = segue.destination as! ToDoViewController
                    
                    ToDoViewController.tasks.append(newToDo)

                }}
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let tasks = tasks {
            toDoTextField.text = tasks.title
            toDoTextView.text = tasks.description
        } else{
            toDoTextField.text = ""
            toDoTextView.text = ""
        }
        toDoTextView.text = ""
        toDoTextField.text = ""
    }
    
    
    
    
    
    
    
}
