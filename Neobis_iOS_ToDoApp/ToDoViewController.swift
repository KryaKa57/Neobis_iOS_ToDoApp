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
    
    var tasks: [Tasks] = [Tasks(name: "fdsf", descrtiption: "fdsfs", isDone: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        self.tasks.append(Tasks(name: name, descrtiption: description, isDone: false))
        self.taskTableView.insertRows(at: [newIndexPath], with: .fade)
    }
}

extension ToDoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let taskCell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell else {
            return UITableViewCell()
        }
        let task = tasks[indexPath.row]
        taskCell.taskNameLabel.text = task.name
        taskCell.taskDescriptionLabel.text = task.descrtiption
        
        return taskCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    @objc func imgTap(tapGesture: UITapGestureRecognizer) {
        let imageView = tapGesture.view as! UIImageView
        imageView.image = UIImage(named:"pencil.circle")
    }
}
