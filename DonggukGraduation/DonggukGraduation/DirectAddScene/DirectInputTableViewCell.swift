//
//  DirectInputTableViewCell.swift
//  DonggukGraduation
//
//  Created by jisu on 21/01/2019.
//  Copyright © 2019 linc. All rights reserved.
//

import UIKit

class DirectInputTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        addKeyboardButton()
    }
    
    func addKeyboardButton() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(title: "닫기", style: .done, target: self, action: #selector(self.doneClicked))
        doneButton.tintColor = UIColor.orange
        
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        
        textField.inputAccessoryView = toolbar
    }
    
    @objc func doneClicked() {
        endEditing(true)
    }
}
