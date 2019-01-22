//
//  PlanCollectionViewCell.swift
//  DonggukGraduation
//
//  Created by jisu on 20/01/2019.
//  Copyright © 2019 linc. All rights reserved.
//

import UIKit

class PlanCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var planLabel: UILabel!
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                planLabel.textColor = UIColor.white
                planLabel.backgroundColor = UIColor.orange
            }
            else {
                planLabel.textColor = UIColor.orange
//                planLabel.layer.borderWidth = 1
//                planLabel.layer.borderColor = UIColor.groupTableViewBackground.cgColor
                planLabel.backgroundColor = UIColor.white
            }
        }
    }
}
