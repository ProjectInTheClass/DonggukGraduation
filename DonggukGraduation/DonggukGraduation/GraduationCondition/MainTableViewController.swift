
import UIKit

class MainTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.isEditing = true
    }
    
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        
        return UITableViewCell.EditingStyle.insert
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DETAIL_LECTURE_SEGUE" {
            if let allLectureVC = segue.destination as? AllLectureListTableViewController, let cell = sender as? UITableViewCell {
                let indexPath = self.tableView.indexPath(for: cell)!
                var category: String = ""
                if indexPath.row == 1 { category = "전공영역" }
                else { category = "교양영역" }
                
                allLectureVC.category = category
            }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 3
        }
        else if section == 1 {
            return 2
        }
        else if section == 2 {
            return 1
        }
        else if section == 3 {
            return 1
        }
        else if section == 4 {
            return 1
        }
        else {
            return 1
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell
        
        if indexPath.section == 0 {
            if indexPath.row == 0
            {
                
                cell = tableView.dequeueReusableCell(withIdentifier: "CELL1", for: indexPath)
                cell.textLabel?.text = "남은학점"
                cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
                cell.detailTextLabel?.text = "\((myCurri?.allCredit)!) / \((departmentCurri?.allCredit)!)학점"
                cell.detailTextLabel?.font = UIFont.boldSystemFont(ofSize: 30)
                return cell
            }
            else if indexPath.row == 1
            {
                cell = tableView.dequeueReusableCell(withIdentifier: "CELL4", for: indexPath)
                cell.accessoryType = .disclosureIndicator
                cell.textLabel?.text = "전공영역"
                cell.textLabel?.font.withSize(15)
                cell.textLabel?.textColor = UIColor.lightGray
                cell.detailTextLabel?.text = "\((myCurri?.majorCredit)!) / \((departmentCurri?.majorCredit)!)학점"
                cell.detailTextLabel?.font.withSize(15)
                cell.detailTextLabel?.textColor = UIColor.lightGray

                return cell
            }
            else
            {
                let generalCredit:Int = (myCurri?.generalMain)! + (myCurri?.generalBasic)! + (myCurri?.generalCommon)! + (myCurri?.generalLiteracy)! + (myCurri?.generalCulture)! + (myCurri?.generalMajorBasic)!
                
                let departmentGeneralCredit:Int = Int((departmentCurri?.generalMain)!)! + Int((departmentCurri?.generalBasic)!)! + Int((departmentCurri?.generalCommon)!)! + Int((departmentCurri?.generalLiteracy)!)! +  Int((departmentCurri?.generalMajorBasic)!)!
                
                
                cell = tableView.dequeueReusableCell(withIdentifier: "CELL4", for: indexPath)
                cell.accessoryType = .disclosureIndicator
                cell.textLabel?.text = "교양영역"
                cell.textLabel?.font.withSize(15)
                cell.textLabel?.textColor = UIColor.lightGray
                cell.detailTextLabel?.text = "\(generalCredit) / \(departmentGeneralCredit)학점"
                cell.detailTextLabel?.font.withSize(15)
                cell.detailTextLabel?.textColor = UIColor.lightGray
                return cell
            }
        }
        
        else if indexPath.section == 1 {
            if indexPath.row == 0
            {
                cell = tableView.dequeueReusableCell(withIdentifier: "CELL1", for: indexPath)
                cell.textLabel?.text = "영어강의"
                cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
                cell.detailTextLabel?.text = "\((myCurri?.englishLecture)!) / \((departmentCurri?.englishLecture)!)과목"
                cell.detailTextLabel?.font = UIFont.boldSystemFont(ofSize: 30)
                
                return cell
            }
            
            else if indexPath.row == 1
            {
                cell = tableView.dequeueReusableCell(withIdentifier: "CELL1", for: indexPath)
                cell.textLabel?.text = "영어성적"
                cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
                if (myCurri?.englishScore)! { cell.detailTextLabel?.text = "제출완료" }
                else { cell.detailTextLabel?.text = "제출필요" }
                
                cell.detailTextLabel?.font = UIFont.boldSystemFont(ofSize: 30)
                return cell
            }
        }
        
        else if indexPath.section == 2 {
            if indexPath.row == 0
            {
                cell = tableView.dequeueReusableCell(withIdentifier: "CELL1", for: indexPath)
                cell.textLabel?.text = "졸업논문"
                cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
                if (myCurri?.graduationPaper)! { cell.detailTextLabel?.text = "제출완료" }
                else { cell.detailTextLabel?.text = "제출필요" }
                cell.detailTextLabel?.font = UIFont.boldSystemFont(ofSize: 30)
                return cell
            }
        }
        else if indexPath.section == 3 {
            if indexPath.row == 0
            {
                cell = tableView.dequeueReusableCell(withIdentifier: "CELL1", for: indexPath)
                cell.textLabel?.text = "사회봉사"
                cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
                cell.detailTextLabel?.text = "\((myCurri?.serviceTime)!) / 1건"
                cell.detailTextLabel?.font = UIFont.boldSystemFont(ofSize: 30)
                
            return cell
            }
        }
        else if indexPath.section == 4 {
            if indexPath.row == 0
            {
                cell = tableView.dequeueReusableCell(withIdentifier: "CELL1", for: indexPath)
                cell.textLabel?.text = "산학협력프로젝트"
                cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
                if (myCurri?.etc)! { cell.detailTextLabel?.text = "충족완료" }
                else { cell.detailTextLabel?.text = "충족필요" }
                cell.detailTextLabel?.font = UIFont.boldSystemFont(ofSize: 30)
                
                return cell
            }
        }
        
        
       return UITableViewCell()
        
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "학점"
        }
        else if section == 1 {
            return "언어영역"
        }
        else if section == 2 {
            return "졸업논문"
        }
        else if section == 3 {
            return "사회봉사"
        }
        else if section == 4 {
            return "기타사항"
        }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }

}

