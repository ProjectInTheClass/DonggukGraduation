
import UIKit

class EditLectureChoiceViewController: UIViewController {

    @IBOutlet weak var lectureTable: UITableView!
    @IBOutlet weak var myPlanTable: UITableView!
    @IBAction func addLecture() {
        if selectNumber != 0 {
            selectNumber -= 1
            let lecture = filteredList[selectNumber]
            
            if (departmentList.filter { $0.name == lecture.bigCategory }.count) != 0 {
                majorList.append(PlanLecture(name: lecture.name, category: "전공", categorySmall: lecture.smallCategory, credit: lecture.credit, semester: selectedPlan))
                if lecture.smallCategory == "전문" { myCurri?.majorSpecialty += lecture.credit }
                myCurri?.majorCredit += lecture.credit
                myCurri?.allCredit += lecture.credit
            }
            else {
                generalList.append(PlanLecture(name: lecture.name, category: lecture.bigCategory, categorySmall: lecture.smallCategory, credit: lecture.credit, semester: selectedPlan))
                if lecture.bigCategory == "공통교양" { myCurri?.generalCommon += lecture.credit }
                myCurri?.allCredit += lecture.credit
            }
            print("추가완료")
            
            if !savePlanData() { return }
            if !saveMyCurriData() { return }
            reloadTable()
            
            let noticeAlert = UIAlertController(title: "추가완료", message: "수업이 추가되었습니다", preferredStyle: UIAlertController.Style.alert)
            
            let okAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
            
            noticeAlert.addAction(okAction)
            present(noticeAlert, animated: true, completion: nil)
        }
    }
    
    var selectNumber:Int = 0
    
    var filteredList:[Lecture] = []
    
    var category: String?
    
    var categoryList = ["전공", "교양"]
    var categoryColors = [ UIColor.red, UIColor.blue ]
    var majorLectures:[PlanLecture] = []
    var generalLectures:[PlanLecture] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let category = category {
            title = category
        }
        
        if (departmentList.filter { $0.name == category }.count) != 0 {
            filteredList = majorLectureList
        }
        else {
            filteredList = generalLectureList
        }

        
        lectureTable.dataSource = self
        lectureTable.delegate = self
        
        myPlanTable.dataSource = self
        myPlanTable.delegate = self
        myPlanTable.layer.cornerRadius = 20
        myPlanTable.layer.borderWidth = 1
        myPlanTable.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        myPlanTable.showsVerticalScrollIndicator = false
        
        reloadTable()
    }
    
    func reloadTable() {
        majorLectures = [PlanLecture(name:"",category:"전공",categorySmall:"",credit:0,semester:"")]
        generalLectures = [PlanLecture(name:"",category:"교양",categorySmall:"",credit:0,semester:"")]
        
        if selectedPlan != "ALL" {
            majorLectures += majorList.filter{ $0.semester == selectedPlan }
            generalLectures += generalList.filter{ $0.semester == selectedPlan }
        }
        else {
            majorLectures += majorList
            generalLectures += generalList
        }
        
        myPlanTable.reloadData()
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
            return filteredList.count
        } else {
            if section == 0 { return majorLectures.count }
            else { return generalLectures.count}
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == lectureTable, indexPath.section != 0 {
            return 80
        }
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == lectureTable { selectNumber = indexPath.row + 1 }
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
            
            cell.nameLabel.text = filteredList[indexPath.row].name
            cell.detailLabel.text = filteredList[indexPath.row].bigCategory
            cell.creditLabel.text = "\(filteredList[indexPath.row].credit)학점"
            
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
                cell.nameLabel.text = majorLectures[indexPath.row].name
                cell.creditLabel.text = "\(majorLectures[indexPath.row].credit)학점"
                
                cell.barView.backgroundColor = categoryColors[indexPath.section]
                
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "EditPlanLectureTableViewCell", for: indexPath) as! EditPlanLectureTableViewCell
                cell.nameLabel.text = generalLectures[indexPath.row].name
                cell.creditLabel.text = "\(generalLectures[indexPath.row].credit)학점"
                
                cell.barView.backgroundColor = categoryColors[indexPath.section]
                
                return cell
            }
            
        }
    }
    
    
}

extension EditLectureChoiceViewController: UITableViewDelegate {
    
}
