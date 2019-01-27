
import UIKit

private let reuseIdentifier = "Cell"

class PlanDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var selectView: UIView!
    
    var majorLectures:[PlanLecture] = []
    var generalLectures:[PlanLecture] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "졸업계획"
        
        loadPlanData()
        loadUserData()
        
        majorLectures = [PlanLecture(name:"",category:"전공",credit:0,semester:"")]
        generalLectures = [PlanLecture(name:"",category:"교양",credit:0,semester:"")]
        majorLectures += majorList
        generalLectures += generalList
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.layer.cornerRadius = 10
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        // 아이템 선택되게 하는 함수
        collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .top)
        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    }
    
}

extension PlanDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return planList.count + 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanCollectionViewCell", for: indexPath) as! PlanCollectionViewCell
        
        if indexPath.row == 0 {
            cell.planLabel.text = "ALL"
        }
        else if indexPath.row == ( planList.count + 1 ) {
            cell.planLabel.text = "학기 추가"
        }
        else {
            cell.planLabel.text = planList[indexPath.row-1]
        }
        
        
        cell.planLabel.layer.borderWidth = 1
        cell.planLabel.layer.borderColor = UIColor.orange.cgColor

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            selectedPlan = "ALL"
        }
        else if indexPath.row == ( planList.count + 1 ){
            let addQuestionAlert = UIAlertController(title: "학기 추가", message: "학기를 추가하겠습니까?", preferredStyle: UIAlertController.Style.alert)
            
            let yesAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default) { ACTION in
                let lastSemester = planList[planList.count - 1]
            }
            
            let noAction = UIAlertAction(title: "아니요", style: UIAlertAction.Style.default, handler: nil)
            
            addQuestionAlert.addAction(yesAction)
            addQuestionAlert.addAction(noAction)
            
            present(addQuestionAlert, animated: true, completion: nil)
        }
        else {
            selectedPlan = planList[indexPath.row - 1]
        }
        
        majorLectures = [PlanLecture(name:"",category:"전공",credit:0,semester:"")]
        generalLectures = [PlanLecture(name:"",category:"교양",credit:0,semester:"")]
        
        if selectedPlan != "ALL" {
            majorLectures += majorList.filter{ $0.semester == selectedPlan }
            generalLectures += generalList.filter{ $0.semester == selectedPlan }
        }
        else {
            majorLectures += majorList
            generalLectures += generalList
        }
        tableView.reloadData()
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let lecture = majorLectures[indexPath.row]
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryLectureTableViewCell", for: indexPath) as! CategoryLectureTableViewCell
                
                cell.categoryName.text = lecture.category
                
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
                
                cell.categoryName.text = lecture.category
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
