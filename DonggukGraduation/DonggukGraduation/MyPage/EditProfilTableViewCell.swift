//
//  EditProfilTableViewCell.swift
//  DonggukGraduation
//
//  Created by linc on 26/01/2019.
//  Copyright © 2019 linc. All rights reserved.
//

import UIKit

class EditProfilTableViewCell: UITableViewCell {

    @IBOutlet weak var ProfilImage: CirclarMaskImageView!
    @IBOutlet weak var ImageEditButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
