//
//  ToDoCell.swift
//  ToDoList
//
//  Created by Stomach Diego on 11/11/20.
//  Copyright © 2020 Mansur Nasybullin. All rights reserved.
//

import Foundation
import UIKit

protocol ToDoCellDelegete: class {
    func checkmarkTapped(sender: ToDoCell)
}

class ToDoCell: UITableViewCell {
    var delegate: ToDoCellDelegete?
    
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func completeButtonTapped(_ sender: UIButton) {
        delegate?.checkmarkTapped(sender: self)
    }
    
}
