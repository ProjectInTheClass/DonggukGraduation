//
//  File.swift
//  DonggukGraduation
//
//  Created by linc on 14/01/2019.
//  Copyright © 2019 linc. All rights reserved.
//

import UIKit

class CHTableViewControllers: UITableViewController {
    @IBAction func showAlert() {
    }
    @IBAction func alert(_ sender: Any) {
        let alert = UIAlertController(title: "새로운 사용자 명", message: "메세지", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.destructive, handler: nil)
        
        alert.addAction(cancel)
        alert.addAction(okAction)
        
        present(alert, animated:true, completion: nil)
    
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
}
}
}
