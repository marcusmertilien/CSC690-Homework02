//
//  TaskCell.swift
//  TODO
//
//  Created by Marcus Mertilien on 3/20/18.
//  Copyright © 2018 Marcus Mertilien. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    

    @IBOutlet weak var taskLabel: UILabel!
    
    @IBOutlet weak var statusSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

