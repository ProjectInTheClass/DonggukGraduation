//
//  MyPageTableViewController.swift
//  DonggukGraduation
//
//  Created by linc on 25/01/2019.
//  Copyright © 2019 linc. All rights reserved.
//

import UIKit

class MyPageTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.row == 0
            {
                return 150
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
        else if indexPath.section == 5 {
            return 90
        }
        return 50
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        if section == 2 {
            return 2
        }
        return 1
    }
 
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "나의 프로필"
        }
        else if section == 1 {
            return "정보 재등록"
        }
        else if section == 2 {
            return "바로가기 링크"
        }
        else if section == 3 {
            return " "
        }
       
        return nil
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageTableViewCell1", for: indexPath) as! MyPageTableViewCell1
            cell.MyPageNameLabel.text = "홍길동"
            cell.MyPageClassLabel.text = "컴퓨터공학과 13학번"
            let percentage = Int(100.0 - 100.0 * cell.MyPageProgressView.progress)
            cell.MyPageProgressLabel.text = "졸업까지 \(percentage)% 남았습니다."
            
            
            return cell
        }
        else if indexPath.section == 1 {
          
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageCell", for: indexPath)
                cell.textLabel?.text = "프로필 변경"
            cell.textLabel?.font.withSize(19)
    return cell
        }
        else if indexPath.section == 2 {
            if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageTableViewCell3", for: indexPath) as! MyPageTableViewCell3
            return cell}
            else if indexPath.row == 1 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageTableViewCell4", for: indexPath) as! MyPageTableViewCell4
               return cell
            }
        
        }
        else if indexPath.section == 3 {
            let cell =  tableView.dequeueReusableCell(withIdentifier: "MyPageTableViewCell2", for: indexPath) as! MyPageTableViewCell2
            return cell
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        
        

        return cell
    }
   

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