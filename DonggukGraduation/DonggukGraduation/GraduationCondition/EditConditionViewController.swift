

import UIKit

class EditConditionViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func saveData() {
        if category == "전공영역" {
            if let value1 = (tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! EditTextFieldTableViewCell).textField.text, let value2 = (tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as! EditTextFieldTableViewCell).textField.text{
                if let basic = Int(value1), let specialty = Int(value2) {
                    myCurri?.majorSpecialty = specialty
                    myCurri?.majorCredit = basic + specialty
                }
                else {
                    errorAlert()
                    return
                }
            }
        }
        else if category == "교양영역" {
            if let value = (tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! EditTextFieldTableViewCell).textField.text {
                if let general = Int(value){
                    myCurri?.generalCulture = general
                }
                else {
                    errorAlert()
                    return
                }
            }
            
            for i in 0..<nameGeneral.count {
                if let value = (tableView.cellForRow(at: IndexPath(row: 2 * i + 1, section: 0)) as! EditTextFieldTableViewCell).textField.text {
                    if let general = Int(value){
                        if nameGeneral[i] == "공통교양" {
                            myCurri?.generalCommon = general
                        }
                        else if nameGeneral[i] == "학문기초" {
                            myCurri?.generalBasic = general
                        }
                        else if nameGeneral[i] == "기본소양" {
                            myCurri?.generalLiteracy = general
                        }
                        else if nameGeneral[i] == "핵심교양" {
                            myCurri?.generalMain = general
                        }
                        else if nameGeneral[i] == "대학전공기초" {
                            myCurri?.generalMajorBasic = general
                        }
                    }
                    else {
                        errorAlert()
                        return
                    }
                }
            }
        }
        else if category == "영어성적" || category == "졸업논문" || category == "기타사항" {
            if let value = (tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! EditSwitchTableViewCell).isSwitch {
                if category == "영어성적" { myCurri?.englishScore = value.isOn }
                else if category == "졸업논문" { myCurri?.graduationPaper = value.isOn }
                else if category == "기타사항" { myCurri?.etc = value.isOn }
            }
        }
        else {
            if let value = (tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! EditTextFieldTableViewCell).textField.text {
                if let v = Int(value) {
                    if category == "영어강의" { myCurri?.englishLecture = v }
                    else if category == "사회봉사" { myCurri?.serviceTime = v }
                }
                else {
                    errorAlert()
                    return
                }
            }
        }
        
        if !saveMyCurriData() { return }
        self.dismiss(animated: true, completion: { })
    }
    
    func errorAlert() {
        let noticeAlert = UIAlertController(title: "경고", message: "다시 입력해주세요", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
        
        noticeAlert.addAction(okAction)
        present(noticeAlert, animated: true, completion: nil)
    }
    
    var editCategorys = ["전공영역", "교양영역", "영어강의", "영어성적", "졸업논문", "사회봉사", "기타사항"]
    var category: String?
    
    var nameGeneral:[String] = []
    var myGeneral:[Int] = []
    var departGeneral:[String] = []
    var detailGeneral:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let category = category {
            title = category
        }
        
        if category == "교양영역" {
            if departmentCurri?.generalCommon != "0" {
                nameGeneral.append("공통교양")
                myGeneral.append((myCurri?.generalCommon)!)
                departGeneral.append((departmentCurri?.generalCommon)!)
                detailGeneral.append((departmentCurri?.generalCommonDetail)!)
            }
            if departmentCurri?.generalBasic != "0" {
                nameGeneral.append("학문기초")
                myGeneral.append((myCurri?.generalBasic)!)
                departGeneral.append((departmentCurri?.generalBasic)!)
                detailGeneral.append((departmentCurri?.generalBasicDetail)!)
            }
            if departmentCurri?.generalLiteracy != "0" {
                nameGeneral.append("기본소양")
                myGeneral.append((myCurri?.generalLiteracy)!)
                departGeneral.append((departmentCurri?.generalLiteracy)!)
                detailGeneral.append((departmentCurri?.generalLiteracyDetail)!)
            }
            if departmentCurri?.generalMain != "0" {
                nameGeneral.append("핵심교양")
                myGeneral.append((myCurri?.generalMain)!)
                departGeneral.append((departmentCurri?.generalMain)!)
                detailGeneral.append((departmentCurri?.generalMainDetail)!)
            }
            if departmentCurri?.generalMajorBasic != "0" {
                nameGeneral.append("대학전공기초")
                myGeneral.append((myCurri?.generalMajorBasic)!)
                departGeneral.append((departmentCurri?.generalMajorBasic)!)
                detailGeneral.append((departmentCurri?.generalMajorBasicDetail)!)
            }
        }
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}

extension EditConditionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if category == "교양영역" {
            return ( myGeneral.count * 2 + 1 )
        }
        else if category == "전공영역" { return 3 }
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let textCell = tableView.dequeueReusableCell(withIdentifier: "EditTextFieldTableViewCell", for: indexPath) as! EditTextFieldTableViewCell
        
        textCell.textField.textColor = UIColor.orange
        textCell.textField.font = UIFont.boldSystemFont(ofSize: 20)
        textCell.textField.layer.borderWidth = 1
        textCell.textField.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        
        let switchCell = tableView.dequeueReusableCell(withIdentifier: "EditSwitchTableViewCell", for: indexPath) as! EditSwitchTableViewCell
        
        let detailCell = tableView.dequeueReusableCell(withIdentifier: "EditDetailTableViewCell", for: indexPath) as! EditDetailTableViewCell
        
        detailCell.detailLabel.textColor = UIColor.black
        detailCell.lineView.layer.cornerRadius = 10
        detailCell.lineView.layer.borderColor = UIColor.orange.cgColor
        detailCell.lineView.layer.borderWidth = 1

        if category == "전공영역" {
            let nameValue:[String] = ["전공기초","전공전문"]
            let myValue:[Int] = [(myCurri?.majorCredit)! - (myCurri?.majorSpecialty)!, (myCurri?.majorSpecialty)!]
            let departValue:[Int] = [(departmentCurri?.majorCredit)! - (departmentCurri?.majorSpecialty)!, (departmentCurri?.majorSpecialty)!]
            
            if indexPath.row == 2 {
                detailCell.detailLabel.text = departmentCurri?.majorCreditDetail
                
                return detailCell
            }
            else {
                textCell.nameLabel.text = nameValue[indexPath.row]
                textCell.textField.placeholder = "\(myValue[indexPath.row])"
                textCell.textField.text = "\(myValue[indexPath.row])"
                textCell.creditLabel.text = "/ \(departValue[indexPath.row])학점"
                
                return textCell
            }
            
        }
        else if category == "교양영역" {
            
            if indexPath.row == 0 {
                textCell.nameLabel.text = "일반교양"
                textCell.textField.placeholder = "\((myCurri?.generalCulture)!)"
                textCell.textField.text = "\((myCurri?.generalCulture)!)"
                textCell.creditLabel.text = "학점"
                
                return textCell
            }
            else if (indexPath.row % 2) == 0 {
                detailCell.detailLabel.text = detailGeneral[indexPath.row / 2 - 1]
                
                return detailCell
            }
            else {
                textCell.nameLabel.text = nameGeneral[indexPath.row / 2]
                textCell.textField.placeholder = "\(myGeneral[indexPath.row / 2])"
                textCell.textField.text = "\(myGeneral[indexPath.row / 2])"
                textCell.creditLabel.text = "/ \(departGeneral[indexPath.row / 2])학점"
                
                return textCell
            }
        }
        else if category == "영어강의" || category == "사회봉사"{
            var myValue:Int = 0
            var departValue: String = ""
            var detail:String = ""
            
            if category == "영어강의" {
                myValue = (myCurri?.englishLecture)!
                departValue = "/ \((departmentCurri?.englishLecture)!) 강의"
                detail = (departmentCurri?.englishLectureDetail)!
            }
            else if category == "사회봉사" {
                myValue = (myCurri?.serviceTime)!
                departValue = "/ \((departmentCurri?.serviceTime)!)학점"
                detail = "\((departmentCurri?.serviceTime)!) 학점 이수"
            }
            
            if indexPath.row == 0 {
                textCell.nameLabel.text = category
                textCell.textField.placeholder = "\(myValue)"
                textCell.textField.text = "\(myValue)"
                textCell.creditLabel.text = "\(departValue)"
                
                return textCell
            }
            else {
                detailCell.detailLabel.text = detail
                
                return detailCell

            }
        }
        
        
        var isOn:Bool = false
        var detail:String = ""
        
        if category == "영어성적" {
            isOn = (myCurri?.englishScore)!
            detail = (departmentCurri?.englishScoreDetail)!
        }
        else if category == "졸업논문" {
            isOn = (myCurri?.graduationPaper)!
            detail = (departmentCurri?.graduationPaper)!
        }
        else if category == "기타사항" {
            category = (departmentCurri?.etc)!
            isOn = (myCurri?.etc)!
            detail = (departmentCurri?.etcDetail)!
        }
        
        if indexPath.row == 0 {
            switchCell.nameLabel.text = category
            switchCell.isSwitch.isOn = isOn
            if isOn { switchCell.isLabel.text = "제출완료" }
            else { switchCell.isLabel.text = "제출필요" }
            
            return switchCell
        }
        else {
            detailCell.detailLabel.text = detail
            
            return detailCell
            
        }

    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
    }
}

extension EditConditionViewController: UITableViewDelegate {
    
}
