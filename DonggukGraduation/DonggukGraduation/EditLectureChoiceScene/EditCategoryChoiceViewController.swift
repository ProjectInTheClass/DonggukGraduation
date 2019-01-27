
import UIKit

class EditCategoryChoiceViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var firstCategory: String?
    var majorList = ["공과대학", "경영대학"]
    var generelList = ["대학생활탐구","자아성찰"]
    var printList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let firstCategory = firstCategory {
            title = firstCategory
            
            if firstCategory == "전공" {
                printList = majorList
            }
            else {
                printList = generelList
            }
        }
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension EditCategoryChoiceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return printList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = printList[indexPath.row]
        cell.detailTextLabel?.text = ""
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    
    
}

extension EditCategoryChoiceViewController: UITableViewDelegate {
    
}
