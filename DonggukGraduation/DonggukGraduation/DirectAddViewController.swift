
import UIKit

class DirectAddViewController: UIViewController {
    
    var inputList = ["이름", "학점"]
    var categoryList = ["교양", "전공"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

    }

}

extension DirectAddViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return inputList.count }
        else if section == 1 { return categoryList.count }
        else { return 1 }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DirectInputTableViewCell", for: indexPath) as! DirectInputTableViewCell
            
            cell.textField.text = inputList[indexPath.row]
            
            return cell
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
            
            cell.textLabel?.text =  categoryList[indexPath.row]
            cell.accessoryType = .checkmark
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DirectAddTableViewCell", for: indexPath) as! DirectAddTableViewCell
            
            cell.addLabel.text = "이번학기 계힉에 추가하기"
            cell.addLabel.textColor = .orange
            cell.addLabel.font = UIFont.boldSystemFont(ofSize: 18)
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 2 { return 60 }
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 { return "수업정보" }
        else if section == 1 { return "이수구분" }
        return nil
    }
    
    
}

extension DirectAddViewController: UITableViewDelegate {
    
}
