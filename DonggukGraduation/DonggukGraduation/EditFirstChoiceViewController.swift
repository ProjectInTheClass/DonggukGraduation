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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
    }
}

extension EditFirstChoiceViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "KeywordSearchCell", for: indexPath)
            cell.detailTextLabel?.text = ""
            cell.accessoryType = .disclosureIndicator

            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategorySearchCell", for: indexPath)
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


}

extension EditFirstChoiceViewController: UITableViewDelegate {

}
