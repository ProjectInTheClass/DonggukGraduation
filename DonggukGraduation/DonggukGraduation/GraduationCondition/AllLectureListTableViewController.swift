import UIKit

class AllLectureListTableViewController: UITableViewController {
    var category : String?
    var lectures : [PlanLecture] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let category = category {
            title = category
            
            if category == "전공영역" { lectures = majorList }
            else if category == "교양영역" { lectures = generalList }
        }

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        if category == "전공영역" { return 2 }
        return 6
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if category == "전공영역" {
            var sCategory = "기초"
            if section == 1 { sCategory = "전문" }
            
            return lectures.filter { $0.categorySmall == sCategory }.count
        }
        
        var sCategory = "일반교양"
        if section == 1 { sCategory = "공통교양" }
        else if section == 2 { sCategory = "학문기초" }
        else if section == 3 { sCategory = "기본소양" }
        else if section == 4 { sCategory = "핵심교양" }
        else if section == 5 { sCategory = "대학전공기초" }
        
        
        return lectures.filter { $0.category == sCategory }.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if category == "전공영역" {
            if indexPath.section == 0 {
                let lecture = lectures.filter{$0.categorySmall == "기초"}[indexPath.row]
                
                let cell1  = tableView.dequeueReusableCell(withIdentifier: "CELL1", for: indexPath) as! LectureTableViewCell
                cell1.lectureLabel.text = lecture.name
                cell1.pointLabel.text = "\(lecture.credit)"
                cell1.pointLabel.textColor = UIColor.lightGray
                cell1.symbolview.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                return cell1
                
            }
                
            else if indexPath.section == 1 {
                let lecture = lectures.filter{$0.categorySmall == "전문"}[indexPath.row]
                
                let cell1  = tableView.dequeueReusableCell(withIdentifier: "CELL1", for: indexPath) as! LectureTableViewCell
                cell1.lectureLabel.text = lecture.name
                cell1.pointLabel.text = "\(lecture.credit)"
                cell1.pointLabel.textColor = UIColor.lightGray
                cell1.symbolview.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
                return cell1
            }
        }
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "CELL1", for: indexPath) as! LectureTableViewCell
        
        var sCategory = "일반교양"
        
        if indexPath.section == 1 { sCategory = "공통교양" }
        else if indexPath.section == 2 { sCategory = "학문기초" }
        else if indexPath.section == 3 { sCategory = "기본소양" }
        else if indexPath.section == 4 { sCategory = "핵심교양" }
        else if indexPath.section == 5 { sCategory = "대학전공기초" }
        
        if indexPath.section == 0 {
            cell.symbolview.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        }
        else if indexPath.section == 1 {
            sCategory = "공통교양"
            cell.symbolview.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        }
        else if indexPath.section == 2 {
            sCategory = "학문기초"
            cell.symbolview.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        }
        else if indexPath.section == 3 {
            sCategory = "기본소양"
            cell.symbolview.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        }
        else if indexPath.section == 4 {
            sCategory = "핵심교양"
            cell.symbolview.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        }
        else if indexPath.section == 5 {
            sCategory = "대학전공기초"
            cell.symbolview.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        }
        
        let lecture = lectures.filter{$0.category == sCategory}[indexPath.row]
        
        cell.lectureLabel.text = lecture.name
        cell.pointLabel.text = "\(lecture.credit)학점"
        cell.pointLabel.textColor = UIColor.lightGray
        
        return cell
    }
    


    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if category == "전공" {
            var sCategory = "기초"
            if section == 1 { sCategory = "전문" }
            
//            let lecture = lectures.filter{$0.categorySmall == sCategory}.reduce(0,{ base,adder in base+adder})
           
            if section == 0 {
                return "전공기초 (/30)"
            }
            else if section == 1 {
                return "전공전문 (/30)"
            }
        }
        
        if indexPath.section == 1 { sCategory = "공통교양" }
        else if indexPath.section == 2 { sCategory = "학문기초" }
        else if indexPath.section == 3 { sCategory = "기본소양" }
        else if indexPath.section == 4 { sCategory = "핵심교양" }
        else if indexPath.section == 5 { sCategory = "대학전공기초" }
        
        let lecture = lectures.filter{$0.categorySmall == "기초"}[indexPath.row]
        
        if section == 0 {
            return "공통교양 (0/9)"
        }
        else if section == 1 {
            return "일반교양 (0/9)"
        }
        else if section == 2 {
            return "학문기초 (0/30)"
        }
        else if section == 3 {
            return "기본소양 (0/6)"
        }
        
        return nil
    }
    

}
