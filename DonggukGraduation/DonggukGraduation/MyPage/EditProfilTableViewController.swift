//
//  EditProfilTableViewController.swift
//  DonggukGraduation
//
//  Created by linc on 26/01/2019.
//  Copyright © 2019 linc. All rights reserved.
//

import UIKit

class EditProfilTableViewController: UITableViewController{

 
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.row == 0
            {
                return 150
            }
        }
        else if indexPath.section == 1 {
         return 210
       
        }
        return 45
    }
    override func viewDidLoad() {
    
    }

    
    
    
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  
        return 1
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditProfilTableViewCell", for: indexPath) as! EditProfilTableViewCell
            cell.backgroundColor = UIColor.groupTableViewBackground
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditProfilTableViewCell2", for: indexPath) as! EditProfilTableViewCell2
            cell.NameLabel.text = "이름"
            cell.ClassLabel.text = "전공"
            cell.LevelLabel.text = "학번"
            
            cell.LevelTextField.text = "13학번"
            cell.ClassTextField.text = "공과대학 컴퓨터공학과"
            cell.NameTextField.text = "홍길동"
            return cell
        }
        
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
 
}
