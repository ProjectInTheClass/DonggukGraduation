import UIKit

class InformationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var arrowButton: UIButton!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var conditionCheck: UISwitch!
    //@IBOutlet weak var Arrow: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

    }
    
        var majorexpanded = false
    
    
/*    @IBAction func arrowButton(_ sender: Any) {
        
        if majorexpanded {
            majorexpanded = false
        }
        else { majorexpanded = true }
        UITableView.reloadData()
        
        
    }
    
  */
    
   
    @IBAction func conditionCheckAction(_ sender: UISwitch) {
        UserDefaults.standard.set(conditionCheck.isOn, forKey: "switchState")
        
        if conditionCheck.isOn {
            pointLabel.text = "제출완료"
            pointLabel.font = UIFont.italicSystemFont(ofSize: 14)
            pointLabel.textColor = UIColor.orange
            
        }
        else {
            pointLabel.text = "제출필요"
            pointLabel.font = UIFont.italicSystemFont(ofSize: 14)
            pointLabel.textColor = UIColor.orange
            
        }

        
    }
    

    // override func setSelected(_ selected: Bool, animated: Bool) {
    //    super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    // }

}
