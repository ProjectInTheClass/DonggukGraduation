//
//  MyClassTableViewController.swift
//  DonggukGraduation
//
//  Created by linc on 21/01/2019.
//  Copyright © 2019 linc. All rights reserved.
//

import UIKit

class MyClassTableViewController: UITableViewController {

    @IBOutlet weak var plusButton: UIButton!
    @IBAction func cell1Button(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.row == 0
            {
                return 57
            }
        }
        else if indexPath.section == 1 {
            if indexPath.row == 0
            {
                return 57
            }
        }
        else if indexPath.section == 2 {
            if indexPath.row == 0
            {
                return 57
            }
        }
        else if indexPath.section == 6 {
            return 90
        }
        return 50
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            if !majorexpanded {
                return 1
            }
            else {
                return 2
            }
        }
        else if section == 1 {
            if !cultureexpanded {
                return 1
            }
            else {
                return 2
            }
        }
        else if section == 2 {
            if !langexpanded {
                return 1
            }
            else {
                return 2
            }
        }
        else if section == 3 {
            if !thesisexpanded {
                return 1
            }
            else {
                return 2
            }
        }
     return    1
    }
    
   
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "학점"
        }
        else if section == 2 {
            return "언어영역"
        }
        else if section == 3 {
            return "졸업논문"
        }
        else if section == 4 {
            return "봉사시간"
        }
        else if section == 5 {
            return "졸업충족요건 추가"
        }
        
        return nil
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let cell1 = tableView.dequeueReusableCell(withIdentifier: "MyClassTableViewCell1", for:indexPath) as! MyClassTableViewCell1
                cell1.Cell1Label.text = "전공영역"
                cell1.Cell1Label.font.withSize(19)
                
                return cell1
            }else if indexPath.row == 1
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
                cell.textLabel?.text = "- 설계과목 12학점 필수 - 필수과목: 자료구조와 실습, 컴퓨터구성                   창의적공학설계, 개별연구1, 개별연구2 "
                cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 14)
                cell.backgroundColor = UIColor.groupTableViewBackground
                return cell
            }
       
        }
        if indexPath.section == 1 {
            if indexPath.row == 0 { let cell1 = tableView.dequeueReusableCell(withIdentifier: "MyClassTableViewCell1", for:indexPath) as! MyClassTableViewCell1
            cell1.Cell1Label.text = "교양영역"
            cell1.Cell1Label.font.withSize(19)
            
                return cell1}
            else if indexPath.row == 1
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
                cell.textLabel?.text = "- 공통교양 12~14학점 - 기본소양 9학점 선택필수 : 기술과 사회, 공학경제, 공학법제, 기술창조와 특허, 지속가능한 발전과 인간 - MSC 28학점 (필수) [수학] 미적분학 및 연습1, 이산수학, 확률 및 통계학 [과학] 실험교과목 1과목 포함 최소 6학점 이수 [전산학] 전산학 교과목 인정 안 됨 "
                cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 14)
                cell.backgroundColor = UIColor.groupTableViewBackground
                return cell
            }
        }
        else if indexPath.section == 2 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyClassTableViewCell2", for:indexPath) as! MyClassTableViewCell2
                cell.MyClassLabel.text = "영어성적"
                return cell
            }
            else if indexPath.row == 1
            {
               let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
                cell.textLabel?.text = "- 외국어시험(TOEIC) 700 - 영어강의 : 4과목 중 전공과목에서 2과목 이상 이수 "
                cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 14)
                cell.backgroundColor = UIColor.groupTableViewBackground
                
                return cell
            }
            }
       

        else if indexPath.section == 3 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyClassTableViewCell2", for: indexPath) as! MyClassTableViewCell2
                cell.MyClassLabel.text = "졸업논문"
                return cell
            }else if indexPath.row == 1
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
                cell.textLabel?.text = "- 컴퓨터공학 종합설계 1, 2 순서대로 이수"
                cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 14)
                cell.backgroundColor = UIColor.groupTableViewBackground
                return cell
            }
        }
        else if indexPath.section == 4 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyClassTableViewCell3", for: indexPath) as! MyClassTableViewCell3
                cell.MyClassTableLabel.text = "봉사시간"
                cell.countLabel.text = "시간"
                return cell
            }
        }
        else if indexPath.section == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyClassTableViewCell5", for: indexPath) as! MyClassTableViewCell5
            return cell
            
            
        }
        else if indexPath.section == 6 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyClassTableViewCell4", for: indexPath) as! MyClassTableViewCell4
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyClassTableViewCell5", for: indexPath) as! MyClassTableViewCell5
        return cell
        
    }
    var majorexpanded = false
    var cultureexpanded = false
    var langexpanded = false
    var thesisexpanded = false
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                if majorexpanded { majorexpanded = false }
                else { majorexpanded = true }
                tableView.reloadData()
            }
          
        }
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                if cultureexpanded { cultureexpanded = false }
                else { cultureexpanded = true }
                tableView.reloadData()
            }
            
        }
        if indexPath.section == 2 {
            if indexPath.row == 0 {
                if langexpanded { langexpanded = false }
                else { langexpanded = true }
                tableView.reloadData()
            }
            
        }
        if indexPath.section == 3 {
            if indexPath.row == 0 {
                if thesisexpanded { thesisexpanded = false }
                else { thesisexpanded = true }
                tableView.reloadData()
            }
            
        }
    }
  


}
