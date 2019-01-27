
import UIKit

class EditLectureChoiceViewController: UIViewController {

    @IBOutlet weak var lectureTable: UITableView!
    @IBOutlet weak var myPlanTable: UITableView!
    
    var lectureList = [["자아와명상","교양",3], ["불인","교양",2], ["불인","교양",2], ["불인","교양",2], ["불인","교양",2], ["불인","교양",2], ["불인","교양",2], ["불인","교양",2], ["불인","교양",2], ["불인","교양",2], ["불인","교양",2], ["불인","교양",2]]
    var categoryColors:[UIColor] = [UIColor.red, UIColor.blue]
    var categoryList = ["전공", "교양"]
    var majorList = [[],["운영체제",3], ["불인",3]]
    var generelList = [[],["자아와명상",3], ["불인",2],["자아와명상",3], ["불인",2]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "컴퓨터공학과"
        
        lectureTable.dataSource = self
        lectureTable.delegate = self
        
        myPlanTable.dataSource = self
        myPlanTable.delegate = self
        myPlanTable.layer.cornerRadius = 20
        myPlanTable.layer.borderWidth = 1
        myPlanTable.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        myPlanTable.showsVerticalScrollIndicator = false
    }
    

}

extension EditLectureChoiceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == lectureTable {
            if section == 1 { return "수업목록" }
            return nil
        }
        return nil
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == lectureTable { return 2 }
        else { return 2 }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == lectureTable {
            if section == 0 { return 1 }
            return lectureList.count
        } else {
            if section == 0 { return majorList.count }
            else { return generelList.count}
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == lectureTable, indexPath.section != 0 {
            return 80
        }
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == lectureTable {
            if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath)
                cell.textLabel?.text = "필터"
                cell.accessoryType = .disclosureIndicator
                cell.detailTextLabel?.text = ""
                
                return cell
            }
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditLectureItemTableViewCell", for: indexPath) as! EditLectureItemTableViewCell
            
            cell.nameLabel.text = lectureList[indexPath.row][0] as! String
            cell.detailLabel.text = lectureList[indexPath.row][1] as! String
            cell.creditLabel.text = "\(lectureList[indexPath.row][2])학점"
            
            return cell
        } else {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "EditPlanCategoryTableViewCell", for: indexPath) as! EditPlanCategoryTableViewCell
                cell.categoryLabel.text = categoryList[indexPath.section]
                
                cell.roundView.backgroundColor = categoryColors[indexPath.section]
                cell.roundView.layer.cornerRadius = 7
                
                return cell
            }
            else if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "EditPlanLectureTableViewCell", for: indexPath) as! EditPlanLectureTableViewCell
                cell.nameLabel.text = majorList[indexPath.row][0] as! String
                cell.creditLabel.text = "\(majorList[indexPath.row][1])학점"
                
                cell.barView.backgroundColor = categoryColors[indexPath.section]
                
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "EditPlanLectureTableViewCell", for: indexPath) as! EditPlanLectureTableViewCell
                cell.nameLabel.text = generelList[indexPath.row][0] as! String
                cell.creditLabel.text = "\(generelList[indexPath.row][1])학점"
                
                cell.barView.backgroundColor = categoryColors[indexPath.section]
                
                return cell
            }
            
        }
    }
    
    
}

extension EditLectureChoiceViewController: UITableViewDelegate {
    
}
