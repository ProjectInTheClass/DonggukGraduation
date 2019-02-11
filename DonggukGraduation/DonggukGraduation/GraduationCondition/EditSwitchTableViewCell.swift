
import UIKit

class EditSwitchTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var isLabel: UILabel!
    @IBOutlet weak var isSwitch: UISwitch!
    
    @objc func stateChanged() {
        if isSwitch.isOn {
            isLabel.text = "충족완료"
        } else {
            isLabel.text = "충족필요"
        }
        self.reloadInputViews()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        isSwitch.addTarget(self, action: #selector(stateChanged), for: UIControl.Event.valueChanged)
        
    }


}
