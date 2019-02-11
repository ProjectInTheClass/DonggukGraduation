
import UIKit

class EditTextFieldTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var creditLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
