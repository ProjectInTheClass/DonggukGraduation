import UIKit

class InputInfo2ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var bigCategorys = ["학점(전공영역)", "학점(교양영역)", "언어영역", "졸업논문"]
    var generals:[[String:Int]] = []
    
    var generalName = ["generalMajorBasic": "대학전공기초", "generalCommon": "공통교양", "generalLiteracy": "기본소양", "generalBasic": "학문기초", "generalMain": "핵심교양", "generalCulture": "일반교양"]
    
    @IBAction func storeCurriData() {
        var majorBasic: Int = 0
        if let vc = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) {
            if let mb = (vc as! InfoTextFieldTableViewCell).textField.text {
                if let value = Int(mb) {
                    majorBasic = value
                }
            }
        }
        
        
        var majorSpecialty: Int = 0
        if let vc = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) {
            if let ms = (vc as! InfoTextFieldTableViewCell).textField.text {
                if let value = Int(ms) {
                    majorSpecialty = value
                }
            }
        }
        
        var generalCommon: Int = 0 // 공통교양
        var generalCulture: Int = 0// 일반교양
        var generalLiteracy: Int = 0// 기본소양
        var generalBasic: Int = 0// 학문기초
        var generalMajorBasic: Int = 0// 학문기초
        var generalMain: Int = 0// 학문기초
        
        for i in 0..<generals.count {
            var creditValue: Int = 0

            if let value = tableView.cellForRow(at: IndexPath(row: i, section: 1)) {
                if let t = (value as! InfoTextFieldTableViewCell).textField.text {
                    if let v = Int(t) {
                        creditValue = v
                    }
                }
            }
            
            
//            let value = generals[i].values.first!
            let key = generals[i].keys.first
            
            if key == "generalCommon" { generalCommon = creditValue }
            else if key == "generalCulture" { generalCulture = creditValue }
            else if key == "generalLiteracy" { generalLiteracy = creditValue }
            else if key == "generalBasic" { generalBasic = creditValue }
            else if key == "generalMajorBasic" { generalMajorBasic = creditValue }
            else if key == "generalMain" { generalMain = creditValue }
        }
        
        var englishLecture: Int = 0
        if let vc = tableView.cellForRow(at: IndexPath(row: 0, section: 2)) {
            if let tf = (vc as! InfoTextFieldTableViewCell).textField.text {
                if let value = Int(tf) {
                    englishLecture = value
                }
            }
        }
        
        var englishScore:Bool = false
        if let value = tableView.cellForRow(at: IndexPath(row: 1, section: 2)) as? InfoOnOffTableViewCell {
            englishScore = value.oneSwitch.isOn
        }
        
        
        var graduationPaper: Bool = false
        if let value = tableView.cellForRow(at: IndexPath(row: 0, section: 3)) as? InfoOnOffTableViewCell {
            graduationPaper = value.oneSwitch.isOn
        }
        
        var serviceTime: Int = 0// 봉사시간
        
        var etc: Bool = false
        
        if bigCategorys.count > 4 {
            if let vc = tableView.cellForRow(at: IndexPath(row: 0, section: 4)) {
                if let tf = (vc as! InfoTextFieldTableViewCell).textField.text {
                    if let value = Int(tf) {
                        serviceTime = value
                    }
                }
            }
        }
        if bigCategorys.count > 5 {
            if let value = tableView.cellForRow(at: IndexPath(row: 0, section: 5)) as? InfoOnOffTableViewCell {
                etc = value.oneSwitch.isOn
            }
        }
        
        let allCredit: Int = majorBasic + majorSpecialty + generalMain + generalBasic + generalCommon + generalCulture + generalLiteracy + generalMajorBasic
       
        myCurri = MyCurriculum(englishScore: englishScore, englishLecture: englishLecture, serviceTime: serviceTime, allCredit: allCredit, majorCredit: (majorBasic+majorSpecialty), majorSpecialty: majorSpecialty, generalCommon: generalCommon, generalCulture: generalCulture, generalLiteracy: generalLiteracy, generalBasic: generalBasic, generalMajorBasic: generalMajorBasic, generalMain: generalMain, graduationPaper: graduationPaper, etc: etc)
        
        if !saveMyCurriData() { return }
        if !loadPlanListData() { return }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if !loadDepartmentCurriData() { return }
        
        if departmentCurri?.serviceTime != 0 {
            bigCategorys.append("사회봉사")
        }
        if departmentCurri?.etc != "0" {
            bigCategorys.append((departmentCurri?.etc)!)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        
        generals = (departmentCurri?.toDict().filter { $0.0.hasPrefix("general") }.filter { !$0.0.hasSuffix("Detail") }.filter { ($0.1 as! String) != "0"}.map{ [$0.key: 0]})!
        generals.append(["generalCulture":0])
        
        tableView.layer.cornerRadius = 10
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        tableView.showsVerticalScrollIndicator = false
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    @objc func keyboardWillShow(notification:NSNotification){
        //give room at the bottom of the scroll view, so it doesn't cover up anything the user needs to tap
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = tableView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        tableView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification:NSNotification){
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        tableView.contentInset = contentInset
    }

}

extension InputInfo2ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return bigCategorys.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return bigCategorys[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return 2 }
        else if section == 1 { return generals.count }
        else if section == 2 { return 2 }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let switchCell = tableView.dequeueReusableCell(withIdentifier: "InfoOnOffTableViewCell", for: indexPath) as! InfoOnOffTableViewCell
        
        let textFieldCell = tableView.dequeueReusableCell(withIdentifier: "InfoTextFieldTableViewCell", for: indexPath) as! InfoTextFieldTableViewCell
        
        if indexPath.section == 0 {
            if indexPath.row == 0 { textFieldCell.textField.placeholder = "전공기초" }
            else { textFieldCell.textField.placeholder = "전공전문" }

            return textFieldCell
        }
        else if indexPath.section == 1 {
            textFieldCell.textField.placeholder = generalName[generals[indexPath.row].keys.first!]
            
            return textFieldCell
        }
        else if indexPath.section == 2 {
            if indexPath.row == 0 {
                textFieldCell.textField.placeholder = "수강한 영어강의 개수"
                return textFieldCell
            }
            switchCell.nameLabel.text = "영어성적 제출여부"
            
            return switchCell
        }
        else if indexPath.section == 3 {
            switchCell.nameLabel.text = "졸업논문"
            
            return switchCell
        }
        else if indexPath.section == 4 {
            textFieldCell.textField.placeholder = "수강한 사회봉사 학점"
            return textFieldCell
        }
        else {
            switchCell.nameLabel.text = departmentCurri?.etc
            
            return switchCell
        }
        
    }
    
    
}

extension InputInfo2ViewController: UITableViewDelegate {
    
}
