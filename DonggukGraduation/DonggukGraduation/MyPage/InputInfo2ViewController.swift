import UIKit

class InputInfo2ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.layer.cornerRadius = 10
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        tableView.showsVerticalScrollIndicator = false
        
        tableView.dataSource = self
        tableView.delegate = self

    }
    

}

extension InputInfo2ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 { return "학점(전공영역)" }
        else if section == 1 { return "학점(교양영역)" }
        else if section == 2 { return "언어영역" }
        else if section == 2 { return "졸업논문" }
        else if section == 2 { return "사회봉사" }
        else { return "기타사항" }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return 2 }
        else if section == 1 { return 4 }
        else if section == 2 { return 2 }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let switchCell = tableView.dequeueReusableCell(withIdentifier: "InfoOnOffTableViewCell", for: indexPath) as! InfoOnOffTableViewCell
        
        let textFieldCell = tableView.dequeueReusableCell(withIdentifier: "InfoTextFieldTableViewCell", for: indexPath) as! InfoTextFieldTableViewCell
        
        if indexPath.section == 0 {
            if indexPath.row == 0 { textFieldCell.textField.placeholder = "전공기초" }
            else { textFieldCell.textField.placeholder = "전공전문" }

            return textFieldCell
        }
        else if indexPath.section == 1 {
            if indexPath.row == 0 { textFieldCell.textField.placeholder = "공통교양" }
            else if indexPath.row == 1 { textFieldCell.textField.placeholder = "일반교양" }
            else if indexPath.row == 2 { textFieldCell.textField.placeholder = "학문기초" }
            else if indexPath.row == 3 { textFieldCell.textField.placeholder = "기본소양" }
            
            return textFieldCell
        }
        else if indexPath.section == 2 {
            if indexPath.row == 0 {
                textFieldCell.textField.placeholder = "수강한 영어강의 개수"
                return textFieldCell
            }
            switchCell.nameLabel.text = "영어성적 제출여부"
            
            return switchCell
        }
        else if indexPath.section == 3 {
            switchCell.nameLabel.text = "졸업논문"
            
            return switchCell
        }
        else if indexPath.section == 4 {
            textFieldCell.textField.placeholder = "수강한 사회봉사 학점"
            return textFieldCell
        }
        else {
            switchCell.nameLabel.text = "기타사항"
            
            return switchCell
        }
        
    }
    
    
}

extension InputInfo2ViewController: UITableViewDelegate {
    
}
