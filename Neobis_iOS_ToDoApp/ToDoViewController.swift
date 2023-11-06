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
    
    var tasks: [Task] = []
    var tappedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.taskTableView.dataSource = self
        self.taskTableView.delegate = self
        
        self.view.bringSubviewToFront(addTaskButton)
        self.view.bringSubviewToFront(editTaskButton)
    }
    
    @IBAction func changeEditingMode(_ sender: UIButton) {
        if taskTableView.isEditing {
            taskTableView.isEditing = false
            sender.setImage(UIImage(systemName: "pencil"), for: .normal)
            addTaskButton.isHidden = false
        } else {
            taskTableView.isEditing = true
            sender.setImage(UIImage(systemName: "xmark"), for: .normal)
            addTaskButton.isHidden = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "editTaskSegue"), let slider = sender as? ListTableViewCell, let nav = segue.destination as? UINavigationController {
            let taskName = slider.taskNameLabel.text
            let taskDescription = slider.taskDescriptionLabel.text
            let vc = nav.topViewController as? AddTaskViewController
                
            vc?.taskName = taskName ?? "name"
            vc?.taskDescription = taskDescription ?? "description"
            vc?.isDone = slider.isDone
            vc?.isEdit = true
        }
    }
    
    func addNewTask(taskName name: String, taskDescription description: String) {
        let newIndexPath = IndexPath(row: self.tasks.count, section: 0)
        self.tasks.append(Task(name: name, descrtiption: description, isDone: false))
        self.taskTableView.insertRows(at: [newIndexPath], with: .fade)
    }
    
    func editTask(taskName name: String, taskDescription description: String, isTaskDone isDone: Bool) {
        self.tasks[self.tappedIndex] = Task(name: name, descrtiption: description, isDone: isDone)
        self.taskTableView.reloadData()
    }
}

extension ToDoViewController: UITableViewDataSource, UITableViewDelegate {
    // DATA SOURCES
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let taskCell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell else {
            return UITableViewCell()
        }
        let task = tasks[indexPath.row]
        let systemNameImage = (task.isDone) ? "checkmark.circle" : "circle"
        
        taskCell.taskNameLabel.text = task.name
        taskCell.taskDescriptionLabel.text = task.descrtiption
        taskCell.checkMarkButton.setImage(UIImage(systemName: systemNameImage), for: .normal)
        
        return taskCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        tasks.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
    // DELEGATES
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tappedIndex = indexPath[1]
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tasks.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}
