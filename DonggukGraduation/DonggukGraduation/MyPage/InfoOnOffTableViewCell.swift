//
//  InfoOnOffTableViewCell.swift
//  DonggukGraduation
//
//  Created by linc on 28/01/2019.
//  Copyright © 2019 linc. All rights reserved.
//

import UIKit

class InfoOnOffTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var oneSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
