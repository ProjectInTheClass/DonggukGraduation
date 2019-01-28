
import UIKit

class DirectAddViewController: UIViewController {
    
    var inputList = ["이름", "학점"]
    var categoryList = ["교양", "전공기초", "전공전문"]
    var selectedRow = -1
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func addLecture() {
        if selectedRow != -1 {
            let name = (tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! DirectInputTableViewCell).textField.text
            let categorySmall = categoryList[selectedRow]
            
            var credit: Int = 0
            if let c = (tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as! DirectInputTableViewCell).textField.text {
                credit = Int(c)!
            }
            
            
            if categorySmall != "교양" {
                majorList.append(PlanLecture(name: name!, category: "전공", categorySmall: categorySmall, credit: credit, semester: selectedPlan))
            }
            else {
                generalList.append(PlanLecture(name: name!, category: "일반교양", categorySmall: "일반교양", credit: credit, semester: selectedPlan))
            }
            print("추가완료")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "과목 직접 추가"
        
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 { selectedRow = indexPath.row }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DirectInputTableViewCell", for: indexPath) as! DirectInputTableViewCell
            
            cell.textField.placeholder = inputList[indexPath.row]
            cell.textField.textColor = UIColor.black
            
            return cell
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
            
            cell.textLabel?.text = categoryList[indexPath.row]
            if selectedRow == indexPath.row { cell.accessoryType = .checkmark }
            else { cell.accessoryType = .none }
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DirectAddTableViewCell", for: indexPath) as! DirectAddTableViewCell
            
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
