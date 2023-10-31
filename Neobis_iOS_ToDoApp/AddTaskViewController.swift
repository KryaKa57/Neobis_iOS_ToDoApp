
import Foundation
import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNameLabel: UILabel!
    
    @IBOutlet weak var taskDescriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getTaskName() -> String {
        return taskNameTextField.text ?? "Без названия"
    }
    
    @IBAction func checkAndDisplayHint(_ sender: UITextField) {
        if (sender.text!.isEmpty) { taskNameLabel.isHidden = true }
        else { taskNameLabel.isHidden = false }
    }
    
    @IBAction func saveTask(_ sender: UIBarButtonItem) {
        if let vc = presentingViewController as? ToDoViewController {
            dismiss(animated: true, completion: {
                vc.setInitialTextLabel(self.getTaskName())
            })
        }
    }
    
    @IBAction func cancelTask(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
