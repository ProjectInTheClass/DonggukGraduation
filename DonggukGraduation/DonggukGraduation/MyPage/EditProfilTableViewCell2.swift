//
//  EditProfilTableViewCell2.swift
//  DonggukGraduation
//
//  Created by linc on 26/01/2019.
//  Copyright © 2019 linc. All rights reserved.
//

import UIKit

class EditProfilTableViewCell2: UITableViewCell {

    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var ClassLabel: UILabel!
    @IBOutlet weak var LevelLabel: UILabel!

    @IBOutlet weak var TextUIView: UIView!
    @IBOutlet weak var LevelTextField: UITextField!
    @IBOutlet weak var ClassTextField: UITextField!
    @IBOutlet weak var NameTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
     

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

     
    }
    
}
