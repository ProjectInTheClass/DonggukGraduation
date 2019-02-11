//
//  InfoTextFieldTableViewCell.swift
//  DonggukGraduation
//
//  Created by linc on 28/01/2019.
//  Copyright © 2019 linc. All rights reserved.
//

import UIKit

class InfoTextFieldTableViewCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addKeyboardButton()
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: false)

    }
    
    func addKeyboardButton() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(title: "닫기", style: .done, target: self, action: #selector(self.doneClicked))
        
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        doneButton.tintColor = UIColor.orange
        
        textField.inputAccessoryView = toolbar
    }
    
    @objc func doneClicked() {
        endEditing(true)
    }
}
