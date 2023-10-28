
import Foundation
import UIKit

class AddTaskViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNameLabel: UILabel!
    
    @IBOutlet weak var taskDescriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func checkAndDisplayHint(_ sender: UITextField) {
        if (sender.text!.isEmpty) { taskNameLabel.isHidden = true }
        else { taskNameLabel.isHidden = false }
    }
}


extension AddTaskViewController: UITextViewDelegate {
    
}
