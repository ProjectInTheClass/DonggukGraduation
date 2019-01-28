
import UIKit

class EditLectureChoiceViewController: UIViewController {

    @IBOutlet weak var lectureTable: UITableView!
    @IBOutlet weak var myPlanTable: UITableView!
    @IBAction func addLecture() {
        if selectNumber != 0 {
            selectNumber -= 1
            let lecture = filteredList[selectNumber]
            if lecture.category == "전공" {
                majorList.append(PlanLecture(name: lecture.name, category: lecture.category, categorySmall: lecture.categorySmall, credit: lecture.credit, semester: selectedPlan))
            }
            else {
                generalList.append(PlanLecture(name: lecture.name, category: lecture.category, categorySmall: lecture.categorySmall, credit: lecture.credit, semester: selectedPlan))
            }
            print("추가완료")
        }
    }
    
    var selectNumber:Int = 0
    
    var filteredList = [
        Lecture(name: "자아와 명상", category: "공통교양", categorySmall: "공통교양", credit: 1),
        Lecture(name: "불교와 인간", category: "기본교양", categorySmall: "공통교양",credit: 3),
        Lecture(name: "자아와 명상", category: "공통교양", categorySmall: "공통교양",credit: 1),
        Lecture(name: "불교와 인간", category: "기본교양", categorySmall: "공통교양",credit: 3),
        Lecture(name: "자아와 명상", category: "공통교양", categorySmall: "공통교양",credit: 1),
        Lecture(name: "불교와 인간", category: "기본교양", categorySmall: "공통교양",credit: 3),
        ]
    
    var categoryList = ["전공", "교양"]
    var categoryColors = [ UIColor.red, UIColor.blue]
    var majorLectures:[PlanLecture] = []
    var generalLectures:[PlanLecture] = []
    
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
            cell.detailLabel.text = filteredList[indexPath.row].category
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
