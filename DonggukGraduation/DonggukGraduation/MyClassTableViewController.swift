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
        return 50
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       
        
        if section == 0 {
            return 2
        }
            
        else {
            return 1 }
    }
    
   
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "학점"
        }
        else if section == 1 {
            return "언어영역"
        }
        else if section == 2 {
            return "졸업논문"
        }
        else if section == 3 {
            return "봉사시간"
        }
        else if section == 4 {
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
            }
            if indexPath.row == 1 {
                let cell1 = tableView.dequeueReusableCell(withIdentifier: "MyClassTableViewCell1", for:indexPath) as! MyClassTableViewCell1
                cell1.Cell1Label.text = "교양영역"
                cell1.Cell1Label.font.withSize(19)
                
                return cell1
            }
            
        }
            
        else if indexPath.section == 1 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyClassTableViewCell2", for:indexPath) as! MyClassTableViewCell2
                cell.MyClassLabel.text = "영어성적"
                return cell
            }
            }
       

        else if indexPath.section == 2 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyClassTableViewCell2", for: indexPath) as! MyClassTableViewCell2
                cell.MyClassLabel.text = "졸업논문"
                return cell
            }
        }
        else if indexPath.section == 3 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyClassTableViewCell3", for: indexPath) as! MyClassTableViewCell3
                cell.MyClassTableLabel.text = "봉사시간"
                cell.countLabel.text = "시간"
                return cell
            }
        }
        else if indexPath.section == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyClassTableViewCell5", for: indexPath) as! MyClassTableViewCell5
            return cell
            
            
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyClassTableViewCell5", for: indexPath) as! MyClassTableViewCell5
        return cell
        
    }

    
  


}
