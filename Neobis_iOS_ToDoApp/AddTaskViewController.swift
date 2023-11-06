
import Foundation
import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNameLabel: UILabel!
    
    @IBOutlet weak var taskDescriptionTextField: UITextField!
    
    @IBOutlet weak var cancelUIBarButton: UIBarButtonItem!
    @IBOutlet weak var saveUIBarButton: UIBarButtonItem!
    
    var taskName = ""
    var taskDescription = ""
    var isDone = false
    var isEdit = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskNameTextField.text = taskName
        taskDescriptionTextField.text = taskDescription
        checkAndDisplayHint(taskNameTextField)
    }
    
    func getTaskName() -> String {
        return taskNameTextField.text ?? ""
    }
    func getTaskDescription() -> String {
        return taskDescriptionTextField.text ?? ""
    }
    
    @IBAction func checkAndDisplayHint(_ sender: UITextField) {
        if ((sender.text?.isEmpty) == true) {
            taskNameLabel.isHidden = true
            saveUIBarButton.isEnabled = false
        }
        else {
            taskNameLabel.isHidden = false
            saveUIBarButton.isEnabled = true
        }
    }
    
    @IBAction func saveTask(_ sender: UIBarButtonItem) {
        if let vc = presentingViewController as? ToDoViewController {
            if (isEdit == false) {
                dismiss(animated: true, completion: {
                    vc.addNewTask(taskName: self.getTaskName(), taskDescription: self.getTaskDescription())
                })
            } else {
                dismiss(animated: true, completion: {
                    vc.editTask(taskName: self.getTaskName(), taskDescription: self.getTaskDescription(), isTaskDone: self.isDone)
                })
            }
        }
    }
    
    @IBAction func cancelTask(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
