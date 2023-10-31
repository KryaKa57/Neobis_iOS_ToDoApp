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
    @IBOutlet weak var taskTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.taskTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.taskTableView.dataSource = self
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ToDo") as? AddTaskViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    func setInitialTextLabel(_ text: String) {
        initalTextLabel.text = text
    }
}

extension ToDoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
}
