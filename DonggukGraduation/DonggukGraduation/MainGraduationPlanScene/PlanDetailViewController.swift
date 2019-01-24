
import UIKit

private let reuseIdentifier = "Cell"

class PlanDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var majorLectures:[PlanLecture] = []
    var generalLectures:[PlanLecture] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "졸업계획"
        
        loadPlanData()
        
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
        
        if indexPath.row == 0, selectedPlan == "이수체계도" {
            cell.isSelected = true
        }
        else {
            cell.planLabel.textColor = UIColor.orange
        }
        
        cell.planLabel.layer.borderWidth = 1
        cell.planLabel.layer.borderColor = UIColor.orange.cgColor

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedPlan = planList[indexPath.row]
        if selectedPlan != "이수체계도" {
            
            majorLectures = [PlanLecture(name:"",category:"전공",credit:0,semester:"")]
            majorLectures += majorList.filter{ $0.semester == selectedPlan }
            
            generalLectures = [PlanLecture(name:"",category:"교양",credit:0,semester:"")]
            generalLectures += generalList.filter{ $0.semester == selectedPlan }
        }
        tableView.reloadData()
    }
    
}

extension PlanDetailViewController: UICollectionViewDelegate {

}

extension PlanDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if selectedPlan == "이수체계도" { return 1 }
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedPlan == "이수체계도" { return 1 }
        else if section == 0 { return majorLectures.count }
        else { return generalLectures.count }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if selectedPlan == "이수체계도" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryLectureTableViewCell", for: indexPath) as! CategoryLectureTableViewCell
            
            cell.categoryName.text = "이수체계도"
            
            cell.colorRound.layer.cornerRadius = 7
            
            return cell
        }
        
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
