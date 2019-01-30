
import UIKit

private let reuseIdentifier = "Cell"

class PlanDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var selectView: UIView!
    
    @IBOutlet weak var leftBarButton: UIBarButtonItem!
    @IBOutlet weak var rightBarButton: UIBarButtonItem!
    
    @IBAction func rightButtonAction() {
        if tableView.isEditing {
            let deleteQuestionAlert = UIAlertController(title: "학기 삭제", message: "마지막 학기를 삭제하겠습니까?", preferredStyle: UIAlertController.Style.alert)
            
            let yesAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default) { ACTION in
                planList.removeLast()
                
                if !savePlanData() { return }
                
                self.collectionView.reloadData()
                self.collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .top)
                
                selectedPlan = "ALL"
                self.reloadTable()
            }
            
            let noAction = UIAlertAction(title: "아니요", style: UIAlertAction.Style.default) { ACTION in
                
                selectedPlan = "ALL"
                
                self.collectionView.reloadData()
                
                self.reloadTable()
            }
            
            deleteQuestionAlert.addAction(yesAction)
            deleteQuestionAlert.addAction(noAction)
            
            present(deleteQuestionAlert, animated: true, completion: nil)

        }
        else {
            if selectedPlan == "ALL" {
                let noticeAlert = UIAlertController(title: "학기선택", message: "학기를 선택해주세요", preferredStyle: UIAlertController.Style.alert)
                
                let okAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
                
                noticeAlert.addAction(okAction)
                present(noticeAlert, animated: true, completion: nil)
                
            }
            else {
                
                let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EFCVStoryboard")
                
                self.present(viewController, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func editMyCurri() {
        if generalLectures.count == 1, majorLectures.count == 1 {
            let noticeAlert = UIAlertController(title: "편집", message: "수업이 존재하지 않습니다", preferredStyle: UIAlertController.Style.alert)
            
            let okAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
            
            noticeAlert.addAction(okAction)
            present(noticeAlert, animated: true, completion: nil)
        }
        else if tableView.isEditing {
            leftBarButton.title = "편집"
            rightBarButton.title = "수업추가"
            tableView.isEditing = false
        }
        else {
            leftBarButton.title = "완료"
            rightBarButton.title = "학기삭제"
            tableView.isEditing = true
        }
    }
    
    var majorLectures:[PlanLecture] = []
    var generalLectures:[PlanLecture] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "졸업계획"
        
        majorLectures = [PlanLecture(name:"",category:"전공",categorySmall:"", credit:0,semester:"")]
        generalLectures = [PlanLecture(name:"",category:"교양",categorySmall:"",credit:0,semester:"")]
        majorLectures += majorList
        generalLectures += generalList
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.showsVerticalScrollIndicator = false
        tableView.layer.cornerRadius = 10
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        // 아이템 선택되게 하는 함수
        collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .top)
        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
//        addButton.target = self
//        addButton.action = #selector(goAdd)
        
    }
    
    @objc func goAdd() {
        if selectedPlan == "ALL" {
            print("알람")
            let noticeAlert = UIAlertController(title: "학기선택", message: "학기를 선택해주세요", preferredStyle: UIAlertController.Style.alert)
            
            let okAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
            
            noticeAlert.addAction(okAction)
            present(noticeAlert, animated: true, completion: nil)
            
        }
        else {
            
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EFCVStoryboard")
            
            self.present(viewController, animated: true, completion: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        print(majorLectures)
        print(generalLectures)
        
        selectedPlan = "ALL"
        collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .top)
        
        reloadTable()
        tableView.reloadData()
        
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
        
        tableView.reloadData()
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
                
                let grade = String(lastSemester[lastSemester.startIndex])
                let semester = String(lastSemester[lastSemester.index(lastSemester.startIndex, offsetBy: 4)])
                
                if semester == "2" { planList.append("\(Int(grade)!+1)학년 1학기") }
                else { planList.append("\(grade)학년 2학기") }
                
                if !savePlanData() { return }
                
                collectionView.reloadData()
                collectionView.selectItem(at: IndexPath(item: planList.count, section: 0), animated: false, scrollPosition: .top)
                
                selectedPlan = planList[indexPath.row - 1]
                self.reloadTable()
            }
            
            let noAction = UIAlertAction(title: "아니요", style: UIAlertAction.Style.default) { ACTION in
                
                selectedPlan = "ALL"
                
                collectionView.reloadData()
                collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .top)
                
                self.reloadTable()
            }
            addQuestionAlert.addAction(yesAction)
            addQuestionAlert.addAction(noAction)

            present(addQuestionAlert, animated: true, completion: nil)
            
        }
        else {
            selectedPlan = "\(planList[indexPath.row - 1])"
        }
        
        reloadTable()
    }
}

extension PlanDetailViewController: UICollectionViewDelegate {

}

extension PlanDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        
        if indexPath.row != 0 { return UITableViewCell.EditingStyle.delete }
        return UITableViewCell.EditingStyle.none
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let addQuestionAlert = UIAlertController(title: "수업 삭제", message: "계획에서 수업을 삭제하겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        let yesAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default) { ACTION in
            
            let lectureName = (tableView.cellForRow(at: indexPath) as! DetailLectureTableViewCell).nameLabel.text!
            if indexPath.section == 0 {
                majorList = majorList.filter { $0.name != lectureName}
                self.majorLectures = self.majorLectures.filter { $0.name != lectureName}
            }
            else {
                generalList = generalList.filter { $0.name != lectureName}
                self.generalLectures = self.generalLectures.filter { $0.name != lectureName}
            }
            
            if !savePlanData() { return }
            
            tableView.reloadData()
        }
        
        let noAction = UIAlertAction(title: "아니요", style: UIAlertAction.Style.default, handler: nil)
        
        addQuestionAlert.addAction(yesAction)
        addQuestionAlert.addAction(noAction)
        
        present(addQuestionAlert, animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if generalLectures.count == 1, majorLectures.count == 1 {
            tableView.separatorStyle = .none
            return 1
        }
        tableView.separatorStyle = .singleLine
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return majorLectures.count }
        else { return generalLectures.count }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if generalLectures.count == 1, majorLectures.count == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyTableViewCell", for: indexPath) as! EmptyTableViewCell
            
            cell.logoImage.image = UIImage(named: "logo_head.png")
            
            return cell
        }
        else if indexPath.section == 0 {
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
                cell.colorBar.backgroundColor = planColors["\(lecture.categorySmall)"]
                
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
                cell.colorBar.backgroundColor = planColors["\(lecture.category)"]
                
                return cell
            }
        }
    }
    
    
}

extension PlanDetailViewController: UITableViewDelegate {
    
}
