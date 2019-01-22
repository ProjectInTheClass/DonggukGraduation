
import UIKit

class EditKeywordSearchViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var lectureList = [
        Lecture(name: "자아와 명상", category: "공통교양", credit: 1),
        Lecture(name: "불교와 인간", category: "기본교양", credit: 3),
        Lecture(name: "자아와 명상", category: "공통교양", credit: 1),
        Lecture(name: "불교와 인간", category: "기본교양", credit: 3),
        Lecture(name: "자아와 명상", category: "공통교양", credit: 1),
        Lecture(name: "불교와 인간", category: "기본교양", credit: 3),
    ]
    
    var filteredList: [Lecture] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "수업목록에서 검색"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        searchBar.delegate = self
        searchBar.placeholder = "수업명을 입력하세요."
        
    }
    

}

extension EditKeywordSearchViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let keyword = searchBar.text {
            filteredList = lectureList.filter{ $0.name.range(of:keyword, options: .caseInsensitive) != nil }
            
            self.tableView.reloadData()
        }
    }
}

extension EditKeywordSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EditKeywordSarchTableViewCell", for: indexPath) as! EditKeywordSarchTableViewCell
        
        cell.nameLabel.text = filteredList[indexPath.row].name
        cell.categoryLabel.text = filteredList[indexPath.row].category
        cell.creditLabel.text = "\(filteredList[indexPath.row].credit)"
        
        return cell
    }
    
    
}

extension EditKeywordSearchViewController: UITableViewDelegate {
    
}
