
import UIKit

class EditTableViewController: UITableViewController {
     
    override func viewDidLoad() {
        super.viewDidLoad()
        arrSaveData.append( SaveData(Point : 0 , Time : 0 , Turn_in  : false ))

    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.row == 0
            {
                return 57
            }
        }
        else if indexPath.section == 1 {
            if indexPath.row == 1
            {
                return 80
                // 내용길이에 따라 달라지게 바꾸기
            }
        }

        return 50
    }


    override func numberOfSections(in tableView: UITableView) -> Int {

        return 11
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if section == 0 {
            return 2
        }
        else if section == 1 {
            if !allCredit_expanded {
                return 1
            }
            else {
                return 2
            }
        }
        else if section == 2 {
            if !generalCommon_expanded {
                return 1
            }
            else {
                return 2
            }
        }
            
        else if section == 3 {
            if !generalCulture_expanded {
                return 1
            }
            else {
                return 2
            }
        }
            
        else if section == 4 {
            if !generalBasic_expanded {
                return 1
            }
            else {
                return 2
            }
        }
            
        else if section == 5 {
            if !generalLiteracy_expanded {
                return 1
            }
            else {
                return 2
            }
        }
            
        else if section == 6 {
            if !englishLecture_expanded {
                return 1
            }
            else {
                return 2
            }
        }
        else if section == 7 {
            if !englishScore_expanded {
                return 1
            }
            else {
                return 2
            }
        }
        else if section == 8 {
            if !grauationPaper_expanded {
                return 1
            }
            else {
                return 2
            }
        }
        else if section == 9 {
            return 1
        }
        else if section == 10 {
            if !project_expanded {
                return 1
            }
            else {
                return 2
            }
        }
        
        return 1
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell
        
        if indexPath.section == 0 {
            if indexPath.row == 0
            {
                cell = tableView.dequeueReusableCell(withIdentifier: "CELL3", for: indexPath)
                cell.textLabel?.text = "학교에서 제공하는 학업이수 가이드를 기반으로 작성되었습니다. 자세한 사항을 확인하고 싶으시면 학과사무실에 문의 하거나  학교 홈페이지에서 학업이수 가이드를 참고하시길 바랍니다"
                cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 12)
                cell.textLabel?.textColor = UIColor.darkGray
                cell.backgroundColor = UIColor.groupTableViewBackground
                cell.textLabel?.textAlignment = .center

                return cell
            }
            else if indexPath.row == 1
            {
                cell = tableView.dequeueReusableCell(withIdentifier: "CELL2", for: indexPath)
                cell.textLabel?.text = "제공되는 정보가 잘못되었다면 이곳을 클릭해주세요"
                cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
                cell.textLabel?.textColor = UIColor.orange
                cell.textLabel?.textAlignment = .center

                return cell
            }
        }
        
        else if indexPath.section == 1 {
            if indexPath.row == 0
            {
                let cell4  = tableView.dequeueReusableCell(withIdentifier: "CELL4", for: indexPath) as! InformationTableViewCell
                cell4.subjectLabel.text = "전공영역"
                cell4.subjectLabel.font.withSize(19)
                cell4.pointLabel.text = "/75 학점"
                cell4.pointLabel.font.withSize(19)
                return cell4
            }
            else if indexPath.row == 1
            {
                cell = tableView.dequeueReusableCell(withIdentifier: "CELL3", for: indexPath)
                cell.textLabel?.text = "- 설계과목 12학점 필수 - 필수과목: 자료구조와 실습, 컴퓨터구성                   창의적공학설계, 개별연구1, 개별연구2 "
                cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 14)
                cell.backgroundColor = UIColor.groupTableViewBackground
                return cell
            }
        }
        
        else if indexPath.section == 2 {
            if indexPath.row == 0
            {
                let cell4 = tableView.dequeueReusableCell(withIdentifier: "CELL4", for: indexPath) as! InformationTableViewCell
                cell4.subjectLabel.text = "공통교양"
                cell4.subjectLabel.font.withSize(19)
                cell4.pointLabel.text = "/14 학점"
                cell4.pointLabel.font.withSize(19)
                return cell4
            }
            else if indexPath.row == 1
            {
                cell = tableView.dequeueReusableCell(withIdentifier: "CELL3", for: indexPath)
                cell.textLabel?.text = "- 공통교양 12~14학점"
                cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 14)
                cell.backgroundColor = UIColor.groupTableViewBackground
                return cell
            }
        }
        else if indexPath.section == 3 {
            if indexPath.row == 0
            {
                let cell4 = tableView.dequeueReusableCell(withIdentifier: "CELL4", for: indexPath) as! InformationTableViewCell
                cell4.subjectLabel.text = "일반교양"
                cell4.subjectLabel.font.withSize(19)
                cell4.pointLabel.text = "/0 학점"
                cell4.pointLabel.font.withSize(19)
                return cell4
            }
            else if indexPath.row == 1
            {
                cell = tableView.dequeueReusableCell(withIdentifier: "CELL3", for: indexPath)
                cell.textLabel?.text = "해당없음 "
                cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 14)
                cell.backgroundColor = UIColor.groupTableViewBackground
                return cell
            }
        }
        else if indexPath.section == 4 {
            if indexPath.row == 0
            {
                let cell4 = tableView.dequeueReusableCell(withIdentifier: "CELL4", for: indexPath) as! InformationTableViewCell
                cell4.subjectLabel.text = "학문기초"
                cell4.subjectLabel.font.withSize(19)
                cell4.pointLabel.text = "/30 학점"
                cell4.pointLabel.font.withSize(19)
                return cell4
            }
            else if indexPath.row == 1
            {
                cell = tableView.dequeueReusableCell(withIdentifier: "CELL3", for: indexPath)
                cell.textLabel?.text = " - MSC 28학점 (필수) [수학] 미적분학 및 연습1, 이산수학, 확률 및 통계학 [과학] 실험교과목 1과목 포함 최소 6학점 이수 [전산학] 전산학 교과목 인정 안 됨 "
                cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 14)
                cell.backgroundColor = UIColor.groupTableViewBackground
                return cell
            }
        }
        else if indexPath.section == 5 {
            if indexPath.row == 0
            {
                let cell4 = tableView.dequeueReusableCell(withIdentifier: "CELL4", for: indexPath) as! InformationTableViewCell
                cell4.subjectLabel.text = "기본소양"
                cell4.subjectLabel.font.withSize(19)
                cell4.pointLabel.text = "/6 학점"
                cell4.pointLabel.font.withSize(19)
                return cell4
            }
            else if indexPath.row == 1
            {
                cell = tableView.dequeueReusableCell(withIdentifier: "CELL3", for: indexPath)
                cell.textLabel?.text = " - 기본소양 9학점 선택필수 : 기술과 사회, 공학경제, 공학법제, 기술창조와 특허, 지속가능한 발전과 인간 "
                cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 14)
                cell.backgroundColor = UIColor.groupTableViewBackground
                return cell
            }
        }
            
        else if indexPath.section == 6 {
            if indexPath.row == 0
            {
                let cell4 = tableView.dequeueReusableCell(withIdentifier: "CELL4", for: indexPath) as! InformationTableViewCell
                cell4.subjectLabel.text = "영어강의"
                cell4.subjectLabel.font.withSize(19)
                cell4.pointLabel.text = "/4 과목"
                cell4.pointLabel.font.withSize(19)
                return cell4
            }
            else if indexPath.row == 1
            {
                cell = tableView.dequeueReusableCell(withIdentifier: "CELL3", for: indexPath)
                cell.textLabel?.text = "- 영어강의 : 4과목 중 전공과목에서 2과목 이상 이수"
                cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 14)
                cell.backgroundColor = UIColor.groupTableViewBackground
                return cell
            }
        }
        
        else if indexPath.section == 7 {
            if indexPath.row == 0
            {
                let cell4  = tableView.dequeueReusableCell(withIdentifier: "CELL5", for: indexPath) as! InformationTableViewCell
                cell4.subjectLabel.text = "영어성적"
                cell4.subjectLabel.font.withSize(19)
                cell4.pointLabel.text = "제출필요"
                cell4.pointLabel.font = UIFont.italicSystemFont(ofSize: 14)
                cell4.pointLabel.textColor = UIColor.orange
                return cell4
            }
            else if indexPath.row == 1
            {
                cell = tableView.dequeueReusableCell(withIdentifier: "CELL3", for: indexPath)
                cell.textLabel?.text = "- 외국어시험(TOEIC) 700"
                cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 14)
                cell.backgroundColor = UIColor.groupTableViewBackground
                
                return cell
            }

        }
        
        else if indexPath.section == 8 {
            if indexPath.row == 0
            {
                let cell4  = tableView.dequeueReusableCell(withIdentifier: "CELL5", for: indexPath) as! InformationTableViewCell
                cell4.subjectLabel.text = "졸업논문"
                cell4.subjectLabel.font.withSize(19)
                cell4.pointLabel.text = "제출필요"
                cell4.pointLabel.font = UIFont.italicSystemFont(ofSize: 14)
                cell4.pointLabel.textColor = UIColor.orange
                return cell4
            }
            else if indexPath.row == 1
            {
                cell = tableView.dequeueReusableCell(withIdentifier: "CELL3", for: indexPath)
                cell.textLabel?.text = "- 컴퓨터공학 종합설계 1, 2 순서대로 이수"
                cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 14)
                cell.backgroundColor = UIColor.groupTableViewBackground
                return cell
            }
        
        }
        
        else if indexPath.section == 9 {
            if indexPath.row == 0
            {
                let cell1 = tableView.dequeueReusableCell(withIdentifier: "CELL1", for: indexPath) as! InformationTableViewCell
                cell1.TimeLabel.text = "사회봉사"
                cell1.TimeLabel.font.withSize(19)
                cell1.TimeInputLabel.text = "/1 학점"
                cell1.TimeInputLabel.font.withSize(15)
            
                return cell1
            }
        }
        
        else if indexPath.section == 10 {
            if indexPath.row == 0
            {
                let cell4  = tableView.dequeueReusableCell(withIdentifier: "CELL5", for: indexPath) as! InformationTableViewCell
                cell4.subjectLabel.text = "산학협력프로젝트"
                cell4.subjectLabel.font.withSize(19)
                cell4.pointLabel.text = "이수필요"
                cell4.pointLabel.font = UIFont.italicSystemFont(ofSize: 14)
                cell4.pointLabel.textColor = UIColor.orange
                return cell4
            }
            else if indexPath.row == 1
            {
                cell = tableView.dequeueReusableCell(withIdentifier: "CELL3", for: indexPath)
                cell.textLabel?.text = "- 컴퓨터공학 종합설계 1, 2 순서대로 이수"
                cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 14)
                cell.backgroundColor = UIColor.groupTableViewBackground
                return cell
            }
        }
        
        return UITableViewCell()
        
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "학점(전공영역)"
        }
        else if section == 2 {
            return "학점(교양영역)"
        }
        else if section == 6 {
            return "언어영역"
        }
        else if section == 8 {
            return "졸업논문"
        }
        else if section == 9 {
            return "사회봉사"
        }
        else if section == 10 {
            return "산학협력프로젝트"
        }
        
        return nil
    }
    
    var allCredit_expanded = false
    var generalCommon_expanded = false
    var generalCulture_expanded = false
    var generalBasic_expanded = false
    var generalLiteracy_expanded = false
    var englishLecture_expanded = false
    var englishScore_expanded = false
    var grauationPaper_expanded = false
    var project_expanded = false
    
    
    //셀을 버튼처럼 선택하여 확장 및 축소한다.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

        if indexPath.section == 1 {
            if indexPath.row == 0 {
                if allCredit_expanded { allCredit_expanded = false }
                else { allCredit_expanded = true }
                tableView.reloadData()
            }
        }
        else if indexPath.section == 2 {
            if indexPath.row == 0 {
                if generalCommon_expanded { generalCommon_expanded = false }
                else { generalCommon_expanded = true }
                tableView.reloadData()
            }
        }
        else if indexPath.section == 3 {
            if indexPath.row == 0 {
                if generalCulture_expanded { generalCulture_expanded = false }
                else { generalCulture_expanded = true }
                tableView.reloadData()
            }
        }
        else if indexPath.section == 4 {
            if indexPath.row == 0 {
                if generalBasic_expanded { generalBasic_expanded = false }
                else { generalBasic_expanded = true }
                tableView.reloadData()
            }
        }
        else if indexPath.section == 5 {
            if indexPath.row == 0 {
                if generalLiteracy_expanded { generalLiteracy_expanded = false }
                else { generalLiteracy_expanded = true }
                tableView.reloadData()
            }
        }
        else if indexPath.section == 6 {
            if indexPath.row == 0 {
                if englishLecture_expanded { englishLecture_expanded = false }
                else { englishLecture_expanded = true }
                tableView.reloadData()
            }
        }
        else if indexPath.section == 7 {
            if indexPath.row == 0 {
                if englishScore_expanded { englishScore_expanded = false }
                else { englishScore_expanded = true }
                tableView.reloadData()
            }
        }
        else if indexPath.section == 8 {
            if indexPath.row == 0 {
                if grauationPaper_expanded { grauationPaper_expanded = false }
                else { grauationPaper_expanded = true }
                tableView.reloadData()
            }
        }
        else if indexPath.section == 10 {
            if indexPath.row == 0 {
                if project_expanded { project_expanded = false }
                else { project_expanded = true }
                tableView.reloadData()
            }
        }
    }


    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


