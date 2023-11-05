//
//  ListTableViewCell.swift
//  Neobis_iOS_ToDoApp
//
//  Created by Alisher on 02.11.2023.
//

import Foundation
import UIKit


class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var taskDescriptionLabel: UILabel!
    @IBOutlet weak var checkMarkButton: UIButton!
    
    var isDone: Bool = false
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func checkedMarkOfButton(_ sender: UIButton) {
        if isDone {
            sender.setImage(UIImage(systemName: "circle"), for: .normal)
            isDone = false
        } else {
            sender.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            isDone = true
        }
    }
}
