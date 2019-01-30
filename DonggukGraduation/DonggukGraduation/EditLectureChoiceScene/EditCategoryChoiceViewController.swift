
import UIKit

class EditCategoryChoiceViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var firstCategory: String?
    
    var categoryList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let firstCategory = firstCategory {
            title = firstCategory
        }
        
        categoryList = departmentList.filter { $0.college == firstCategory }.map { $0.name } + smallGeneralList.filter { $0.category == firstCategory }.map { $0.name }
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension EditCategoryChoiceViewController: UITableViewDataSource {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LAST_CHOICE_SEGUE" {
            if let ELCVC = segue.destination as? EditLectureChoiceViewController, let cell = sender as? UITableViewCell {
                let indexPath = tableView.indexPath(for: cell)!
                let category = categoryList[indexPath.row]
                ELCVC.category = category
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categoryList[indexPath.row]
        cell.detailTextLabel?.text = ""
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    
    
}

extension EditCategoryChoiceViewController: UITableViewDelegate {
    
}
