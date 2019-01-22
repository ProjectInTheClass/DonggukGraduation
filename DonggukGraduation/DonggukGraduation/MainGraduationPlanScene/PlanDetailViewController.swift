
import UIKit

private let reuseIdentifier = "Cell"

class PlanDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var plans: [Plan] = []
    
    var planList = [ "1학년 1학기", "1학년 2학기", "2학년 1학기",
                     "2학년 2학기", "3학년 1학기", "3학년 2학기", "4학년 1학기", "4학년 2학기"]
    
    
//    var majorLectures = [
//        Lecture(name: "교양", category: "교양", credit: 56),
//        Lecture(name: "자아와 명상", category: "공통교양", credit: 1),
//        Lecture(name: "불교와 인간", category: "기본교양", credit: 3),
//        Lecture(name: "자아와 명상", category: "공통교양", credit: 1),
//        Lecture(name: "불교와 인간", category: "기본교양", credit: 3),
//    ]
//
//    var generalLectures = [
//        Lecture(name: "전공", category: "전공", credit: 84),
//        Lecture(name: "자아와 명상", category: "공통교양", credit: 1),
//        Lecture(name: "불교와 인간", category: "기본교양", credit: 3),
//    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "졸업계획"
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        print(documentsPath)
        
        let filePath = documentsPath + "/myPlan.plist"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.layer.cornerRadius = 10
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
}

extension PlanDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return planList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanCollectionViewCell", for: indexPath) as! PlanCollectionViewCell
        
        cell.planLabel.text = planList[indexPath.row]
        
        cell.planLabel.textColor = UIColor.orange
        
        cell.planLabel.layer.borderWidth = 1
        cell.planLabel.layer.borderColor = UIColor.orange.cgColor

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
}

extension PlanDetailViewController: UICollectionViewDelegate {

}

extension PlanDetailViewController: UITableViewDataSource {
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
                let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryLectureTableViewCell", for: indexPath) as! CategoryLectureTableViewCell
                
                cell.categoryName.text = lecture.name
                
                cell.colorRound.layer.cornerRadius = 7
                
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DetailLectureTableViewCell", for: indexPath) as! DetailLectureTableViewCell
                
                cell.nameLabel.text = lecture.name
                cell.creditLabel.text = "\(lecture.credit) 학점"
                cell.colorBar.backgroundColor = .red
                
                return cell
            }
        }
        else {
            let lecture = generalLectures[indexPath.row]
            
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryLectureTableViewCell", for: indexPath) as! CategoryLectureTableViewCell
                
                cell.categoryName.text = lecture.name
                cell.colorRound.backgroundColor = .blue
                
                cell.colorRound.layer.cornerRadius = 7
                
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DetailLectureTableViewCell", for: indexPath) as! DetailLectureTableViewCell
                
                cell.nameLabel.text = lecture.name
                cell.creditLabel.text = "\(lecture.credit) 학점"
                cell.colorBar.backgroundColor = .blue
                
                return cell
            }
        }
    }
    
    
}

extension PlanDetailViewController: UITableViewDelegate {
    
}
