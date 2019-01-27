//
//  MyPageTableViewCell1.swift
//  DonggukGraduation
//
//  Created by linc on 25/01/2019.
//  Copyright © 2019 linc. All rights reserved.
//

import UIKit

class MyPageTableViewCell1: UITableViewCell {

    @IBOutlet weak var MyPageProgressLabel: UILabel!
    @IBOutlet weak var MyPageProgressView: UIProgressView!
    @IBOutlet weak var MyPageClassLabel: UILabel!
    @IBOutlet weak var MyPageNameLabel: UILabel!
    @IBOutlet weak var MyPageProfilView: CirclarMaskImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
