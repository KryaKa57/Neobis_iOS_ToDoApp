//
//  ViewController.swift
//  Neobis_iOS_ToDoApp
//
//  Created by Alisher on 26.10.2023.
//

import UIKit

class ToDoViewController: UIViewController {
    
    @IBOutlet weak var initalTextLabel: UILabel!
    @IBOutlet weak var addTaskButton: UIButton!
    @IBOutlet weak var editTaskButton: UIButton!
    @IBOutlet weak var taskTableView: UITableView!
    
    var tasks: [Tasks] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.taskTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.taskTableView.dataSource = self
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ToDo") as? AddTaskViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
        self.view.bringSubviewToFront(addTaskButton)
        self.view.bringSubviewToFront(editTaskButton)
    }
    
    
    
    func setInitialTextLabel(_ text: String) {
        initalTextLabel.text = text
    }
    
    
    func addNewTask(taskName name: String, taskDescription description: String) {
        let newIndexPath = IndexPath(row: self.tasks.count, section: 0)
        self.tasks.append(Tasks(name: name, descrtiption: description))
        self.taskTableView.insertRows(at: [newIndexPath], with: .fade)
    }
}

extension ToDoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.name
        cell.detailTextLabel?.text = task.descrtiption
        
        cell.accessoryType = .detailDisclosureButton
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
}
