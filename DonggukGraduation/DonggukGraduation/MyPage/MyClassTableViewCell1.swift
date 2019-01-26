//
//  MyClassTableViewCell1.swift
//  DonggukGraduation
//
//  Created by linc on 22/01/2019.
//  Copyright © 2019 linc. All rights reserved.
//

import UIKit

class MyClassTableViewCell1: UITableViewCell {

    @IBOutlet weak var Cell1Button: UIButton!
    @IBOutlet weak var Cell1Text: UITextField!
    
    @IBOutlet weak var Cell1Label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
