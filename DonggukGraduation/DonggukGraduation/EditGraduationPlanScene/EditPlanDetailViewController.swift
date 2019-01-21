
import UIKit

class EditPlanDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var majorLectures = [
        Lecture(name: "교양", category: "교양", credit: 56),
        Lecture(name: "자아와 명상", category: "공통교양", credit: 1),
        Lecture(name: "불교와 인간", category: "기본교양", credit: 3),
        Lecture(name: "자아와 명상", category: "공통교양", credit: 1),
        Lecture(name: "불교와 인간", category: "기본교양", credit: 3),
        Lecture(name: "자아와 명상", category: "공통교양", credit: 1),
        Lecture(name: "불교와 인간", category: "기본교양", credit: 3),
        Lecture(name: "자아와 명상", category: "공통교양", credit: 1),
        Lecture(name: "불교와 인간", category: "기본교양", credit: 3),
        Lecture(name: "자아와 명상", category: "공통교양", credit: 1),
        Lecture(name: "불교와 인간", category: "기본교양", credit: 3),
        Lecture(name: "자아와 명상", category: "공통교양", credit: 1),
        Lecture(name: "불교와 인간", category: "기본교양", credit: 3),
        Lecture(name: "자아와 명상", category: "공통교양", credit: 1),
        Lecture(name: "불교와 인간", category: "기본교양", credit: 3),
        Lecture(name: "자아와 명상", category: "공통교양", credit: 1),
        Lecture(name: "불교와 인간", category: "기본교양", credit: 3),
        ]
    
    var generalLectures = [
        Lecture(name: "전공", category: "전공", credit: 84),
        Lecture(name: "자아와 명상", category: "공통교양", credit: 1),
        Lecture(name: "불교와 인간", category: "기본교양", credit: 3),
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
}


extension EditPlanDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 { return "수업목록" }
        return nil
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return majorLectures.count }
        else { return generalLectures.count }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let lecture = majorLectures[indexPath.row]
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "EditCategoryLectureTableViewCell", for: indexPath) as! EditCategoryLectureTableViewCell
                
                cell.categoryName.text = lecture.name
                cell.colorRound.backgroundColor = .red
                
                cell.colorRound.layer.cornerRadius = 7
                
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "EditDetailLectureTableViewCell", for: indexPath) as! EditDetailLectureTableViewCell
                
                cell.nameLabel.text = lecture.name
                cell.creditLabel.text = "\(lecture.credit) 학점"
                cell.colorBar.backgroundColor = .red
                
                return cell
            }
        }
        else {
            let lecture = generalLectures[indexPath.row]
            
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "EditCategoryLectureTableViewCell", for: indexPath) as! EditCategoryLectureTableViewCell
                
                cell.categoryName.text = lecture.name
                cell.colorRound.backgroundColor = .blue
                
                cell.colorRound.layer.cornerRadius = 7
                
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "EditDetailLectureTableViewCell", for: indexPath) as! EditDetailLectureTableViewCell
                
                cell.nameLabel.text = lecture.name
                cell.creditLabel.text = "\(lecture.credit) 학점"
                cell.colorBar.backgroundColor = .blue
                
                return cell
            }
        }
    }
    
    
}

extension EditPlanDetailViewController: UITableViewDelegate {
    
}
