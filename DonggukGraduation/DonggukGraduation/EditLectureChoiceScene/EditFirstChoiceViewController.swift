//
//  EditFirstChoiceViewController.swift
//  DonggukGraduation
//
//  Created by jisu on 21/01/2019.
//  Copyright © 2019 linc. All rights reserved.
//

import UIKit

class EditFirstChoiceViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func goMain() {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PDVCStoryboard")
        
        (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController = viewController
    }
    
    var categoryList = ["전공","교양"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "계획수정"
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
}

extension EditFirstChoiceViewController: UITableViewDataSource {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CATEGORY_SEGUE" {
            if let editCategoryVC = segue.destination as? EditCategoryChoiceViewController, let cell = sender as? UITableViewCell {
                let indexPath = tableView.indexPath(for: cell)!
                let firstCategory = categoryList[indexPath.row]
                editCategoryVC.firstCategory = firstCategory
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return 2 }
        else { return categoryList.count }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "KeywordSearchCell", for: indexPath)
                cell.detailTextLabel?.text = ""
                cell.accessoryType = .disclosureIndicator

                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DirectAddCell", for: indexPath)
                cell.detailTextLabel?.text = ""
                cell.accessoryType = .disclosureIndicator
                
                return cell
                
            }
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategorySearchCell", for: indexPath)
            
            cell.textLabel?.text = categoryList[indexPath.row]
            
            cell.detailTextLabel?.text = ""
            cell.accessoryType = .disclosureIndicator
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 1 { return "분류에서 선택" }
        return nil
    }

}

extension EditFirstChoiceViewController: UITableViewDelegate {

}
