
import UIKit

class DirectAddViewController: UIViewController {
    
    var inputList = ["이름", "학점"]
    var categoryList:[String] = []
    var selectedRow = -1
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func addLecture() {
        if selectedRow != -1 {
            let name = (tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! DirectInputTableViewCell).textField.text
            if name == "" {
                nameAlert()
                return
            }
            
            let categorySmall = categoryList[selectedRow]
            
            var credit: Int = 0
            if let c = (tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as! DirectInputTableViewCell).textField.text {
                if let value = Int(c) {
                    credit = value
                }
                else {
                    numAlert()
                    return
                }
            }
            
            
            if categorySmall.hasPrefix("전공") {
                var temp = "전문"
                if categorySmall == "전공기초" { temp = "기초" }
                
                majorList.append(PlanLecture(name: name!, category: "전공", categorySmall: temp, credit: credit, semester: selectedPlan))
                if temp == "전문" { myCurri?.majorSpecialty += credit }
                myCurri?.majorCredit += credit
                myCurri?.allCredit += credit
            }
            else {
                generalList.append(PlanLecture(name: name!, category: categorySmall, categorySmall: categorySmall, credit: credit, semester: selectedPlan))
                if categorySmall == "공통교양" { myCurri?.generalCommon += credit }
                else if categorySmall == "일반교양" { myCurri?.generalCulture += credit }
                else if categorySmall == "핵심교양" { myCurri?.generalMain += credit }
                else if categorySmall == "기본소양" { myCurri?.generalLiteracy += credit }
                else if categorySmall == "대학전공기초" { myCurri?.generalMajorBasic += credit }
                else if categorySmall == "학문기초" { myCurri?.generalBasic += credit }
                myCurri?.allCredit += credit
            }
            print("추가완료")
            if !savePlanData() { return }
            if !saveMyCurriData() { return }
            
            let noticeAlert = UIAlertController(title: "추가완료", message: "수업이 추가되었습니다", preferredStyle: UIAlertController.Style.alert)
            
            let okAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
            
            noticeAlert.addAction(okAction)
            present(noticeAlert, animated: true, completion: nil)
        }
        else {
            choiceAlert()
        }
    }
    
    func numAlert() {
        let noticeAlert = UIAlertController(title: "잘못된 입력", message: "학점 입력란에는 숫자만 써주세요", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
        
        noticeAlert.addAction(okAction)
        present(noticeAlert, animated: true, completion: nil)
    }
    
    func nameAlert() {
        let noticeAlert = UIAlertController(title: "잘못된 입력", message: "수업 이름을 써주세요", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
        
        noticeAlert.addAction(okAction)
        present(noticeAlert, animated: true, completion: nil)
    }
    
    func choiceAlert() {
        let noticeAlert = UIAlertController(title: "잘못된 입력", message: "이수구분을 선택해주세요", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
        
        noticeAlert.addAction(okAction)
        present(noticeAlert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "과목 직접 추가"
        
        categoryList = ["전공기초", "전공전문"] + bigGeneralList.map { $0.name }
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification:NSNotification){
        //give room at the bottom of the scroll view, so it doesn't cover up anything the user needs to tap
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.tableView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        tableView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification:NSNotification){
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        tableView.contentInset = contentInset
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
            if indexPath.row == 1 { cell.textField.keyboardType = .numberPad }
            
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
