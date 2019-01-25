
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
        else if indexPath.section == 2 {
            if indexPath.row == 1
            {
                return 80
            }
        }
        return 50
    }


    override func numberOfSections(in tableView: UITableView) -> Int {

        return 8
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if section == 0 {
            return 2
        }
        else if section == 1 {
            if !majorexpanded {
                return 1
            }
            else {
                return 2
            }
        }
        else if section == 2 {
            if !cultureexpanded {
                return 1
            }
            else {
                return 2
            }
        }
        else if section == 3 {
            if !subjectexpanded {
                return 1
            }
            else {
                return 2
            }
        }
        else if section == 4 {
            if !langexpanded {
                return 1
            }
            else {
                return 2
            }
        }
        else if section == 5 {
            if !thesisexpanded {
                return 1
            }
            else {
                return 2
            }
        }
        else if section == 6 {
            return 1
        }
        else if section == 7{
            return 1
        }
        
        return 0
        
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
                cell4.subjectLabel.text = "교양영역"
                cell4.subjectLabel.font.withSize(19)
                cell4.pointLabel.text = "/75 학점"
                cell4.pointLabel.font.withSize(19)
                return cell4
            }
            else if indexPath.row == 1
            {
                cell = tableView.dequeueReusableCell(withIdentifier: "CELL3", for: indexPath)
                cell.textLabel?.text = "- 공통교양 12~14학점 - 기본소양 9학점 선택필수 : 기술과 사회, 공학경제, 공학법제, 기술창조와 특허, 지속가능한 발전과 인간 - MSC 28학점 (필수) [수학] 미적분학 및 연습1, 이산수학, 확률 및 통계학 [과학] 실험교과목 1과목 포함 최소 6학점 이수 [전산학] 전산학 교과목 인정 안 됨 "
                cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 14)
                cell.backgroundColor = UIColor.groupTableViewBackground
                return cell
            }
        }
            
        else if indexPath.section == 3 {
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
        
        else if indexPath.section == 4 {
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
        
        else if indexPath.section == 5 {
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
        
        else if indexPath.section == 6 {
            if indexPath.row == 0
            {
                cell = tableView.dequeueReusableCell(withIdentifier: "CELL1", for: indexPath)
                cell.textLabel?.text = "채운시간"
                cell.textLabel?.font.withSize(19)
                cell.detailTextLabel?.text = "/90 (시간)"
                cell.detailTextLabel?.font.withSize(15)
                
                return cell
            }
        }
        
        else if indexPath.section == 7 {
            if indexPath.row == 0
            {
                cell = tableView.dequeueReusableCell(withIdentifier: "CELL6", for: indexPath)
                return cell
            }
        }
        
        return UITableViewCell()
        
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "학점"
        }
        else if section == 3 {
            return "언어영역"
        }
        else if section == 5 {
            return "졸업논문"
        }
        else if section == 6 {
            return "봉사시간"
        }
        else if section == 7 {
            return "추가 졸업요건사항"
        }
        
        return nil
    }
    
    var majorexpanded = false
    var cultureexpanded = false
    var subjectexpanded = false
    var langexpanded = false
    var thesisexpanded = false
    
    
    //셀을 버튼처럼 선택하여 확장 및 축소한다.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

        if indexPath.section == 1 {
            if indexPath.row == 0 {
                if majorexpanded { majorexpanded = false }
                else { majorexpanded = true }
                tableView.reloadData()
            }
        }
        else if indexPath.section == 2 {
            if indexPath.row == 0 {
                if cultureexpanded { cultureexpanded = false }
                else { cultureexpanded = true }
                tableView.reloadData()
            }
        }
        else if indexPath.section == 3 {
            if indexPath.row == 0 {
                if subjectexpanded { subjectexpanded = false }
                else { subjectexpanded = true }
                tableView.reloadData()
            }
        }
        else if indexPath.section == 4 {
            if indexPath.row == 0 {
                if langexpanded { langexpanded = false }
                else { langexpanded = true }
                tableView.reloadData()
            }
        }
        else if indexPath.section == 5 {
            if indexPath.row == 0 {
                if thesisexpanded { thesisexpanded = false }
                else { thesisexpanded = true }
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


