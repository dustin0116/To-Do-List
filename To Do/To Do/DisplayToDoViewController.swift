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
            if segue.identifier == "save" {
                let task = self.tasks ?? CoreDataHelper.newToDo()
                    task.title = toDoTextField.text ?? ""
                    task.content = toDoTextView.text ?? ""
                    task.time = Date() as NSDate
                    CoreDataHelper.saveToDo()

                }
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let tasks = tasks {
            toDoTextField.text = tasks.title
            toDoTextView.text = tasks.content
            
        } else{
            toDoTextField.text = ""
            toDoTextView.text = ""
        }
        toDoTextView.text = ""
        toDoTextField.text = ""
    }
    
    
    
    
    
    
    
}
