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
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func checkedMarkOfButton(_ sender: UIButton) {
        if sender.imageView?.image == UIImage(systemName: "circle") {
            sender.imageView?.image = UIImage(systemName: "pencil")
        } else {
            sender.imageView?.image = UIImage(systemName: "circle")
        }
    }
}
