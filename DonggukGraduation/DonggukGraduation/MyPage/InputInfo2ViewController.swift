import UIKit

class InputInfo2ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var bigCategorys = ["학점(전공영역)", "학점(교양영역)", "언어영역", "졸업논문"]
    var generals:[[String:Int]] = []
    
    var generalName = ["generalMajorBasic": "대학전공기초", "generalCommon": "공통교양", "generalLiteracy": "기본소양", "generalBasic": "학문기초", "generalMain": "핵심교양", "generalCulture":"일반교양"]
    
    @IBAction func storeCurriData() {
        var majorBasic: Int = 0
        if let mb = (tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! InfoTextFieldTableViewCell).textField.text {
            majorBasic = Int(mb)!
        }
        
        var majorSpecialty: Int = 0
        if let ms = (tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as! InfoTextFieldTableViewCell).textField.text {
            majorSpecialty = Int(ms)!
        }
        
        
        var generalCommon: Int = 0 // 공통교양
        var generalCulture: Int = 0// 일반교양
        var generalLiteracy: Int = 0// 기본소양
        var generalBasic: Int = 0// 학문기초
        var generalMajorBasic: Int = 0// 학문기초
        var generalMain: Int = 0// 학문기초
        
        for i in 0..<generals.count {
            var creditValue: Int = 0
            
            if let value = (tableView.cellForRow(at: IndexPath(row: i, section: 1)) as! InfoTextFieldTableViewCell).textField.text {
                creditValue = Int(value)!
            }
            
            let value = generals[i].values.first!
            let key = generals[i].keys.first
            
            if key == "generalCommon" { generalCommon = value }
            else if key == "generalCulture" { generalCulture = value }
            else if key == "generalLiteracy" { generalLiteracy = value }
            else if key == "generalBasic" { generalCommon = value }
            else if key == "generalMajorBasic" { generalMajorBasic = value }
            else if key == "generalMain" { generalMain = value }
        }
        
        var englishLecture: Int = 0
        if let lecture = (tableView.cellForRow(at: IndexPath(row: 0, section: 2)) as! InfoTextFieldTableViewCell).textField.text {
            englishLecture = Int(lecture)!
        }
        
        let englishScore = (tableView.cellForRow(at: IndexPath(row: 1, section: 2)) as! InfoOnOffTableViewCell).oneSwitch.isOn
        
        let graduationPaper = (tableView.cellForRow(at: IndexPath(row: 0, section: 3)) as! InfoOnOffTableViewCell).oneSwitch.isOn
        
        var serviceTime: Int = 0// 봉사시간
        var etc: Bool = false
        if bigCategorys.count > 4 {
            if let time = (tableView.cellForRow(at: IndexPath(row: 0, section: 4)) as! InfoTextFieldTableViewCell).textField.text {
                serviceTime = Int(time)!
            }
        }
        if bigCategorys.count > 5 {
            etc = (tableView.cellForRow(at: IndexPath(row: 0, section: 5)) as! InfoOnOffTableViewCell).oneSwitch.isOn
        }
        
        let allCredit: Int = majorBasic + majorSpecialty + generalMain + generalBasic + generalCommon + generalCulture + generalLiteracy + generalMajorBasic
       
        myCurri = MyCurriculum(englishScore: englishScore, englishLecture: englishLecture, serviceTime: serviceTime, allCredit: allCredit, majorCredit: (majorBasic+majorSpecialty), majorSpecialty: majorSpecialty, generalCommon: generalCommon, generalCulture: generalCulture, generalLiteracy: generalLiteracy, generalBasic: generalBasic, generalMajorBasic: generalMajorBasic, generalMain: generalMain, graduationPaper: graduationPaper, etc: etc)
        
        if !saveMyCurriData() { return }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !loadDepartmentCurriData(department: departmentList.filter{$0.name == (myInfo?.department)}[0].englishName) { return }
        
        if departmentCurri?.serviceTime != 0 {
            bigCategorys.append("사회봉사")
        }
        if departmentCurri?.etc != "x" {
            bigCategorys.append((departmentCurri?.etc)!)
        }
        
        generals = (departmentCurri?.toDict().filter { $0.0.hasPrefix("general") }.filter { !$0.0.hasSuffix("Detail") }.filter { ($0.1 as! String) != "0"}.map{ [$0.key: 0]})!
        generals.append(["generalCulture":0])
        
        tableView.layer.cornerRadius = 10
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        tableView.showsVerticalScrollIndicator = false
        
        tableView.dataSource = self
        tableView.delegate = self
        
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
            switchCell.nameLabel.text = departmentCurri?.etcDetail
            
            return switchCell
        }
        
    }
    
    
}

extension InputInfo2ViewController: UITableViewDelegate {
    
}
