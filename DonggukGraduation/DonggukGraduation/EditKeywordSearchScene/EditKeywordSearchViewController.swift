
import UIKit

class EditKeywordSearchViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBAction func addLecture() {
        if selectNumber != 0 {
            selectNumber -= 1
            let lecture = filteredList[selectNumber]
            if lecture.category == "전공" {
                majorList.append(PlanLecture(name: lecture.name, category: lecture.category, categorySmall: lecture.categorySmall, credit: lecture.credit, semester: selectedPlan))
            }
            else {
                generalList.append(PlanLecture(name: lecture.name, category: lecture.category, categorySmall: lecture.categorySmall, credit: lecture.credit, semester: selectedPlan))
            }
            print("추가완료")
            
            let noticeAlert = UIAlertController(title: "추가완료", message: "수업이 추가되었습니다", preferredStyle: UIAlertController.Style.alert)
            
            let okAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
            
            noticeAlert.addAction(okAction)
            
            present(noticeAlert, animated: true, completion: nil)
        }
    }
    
    var selectNumber:Int = 0
    
    var lectureList = [
        Lecture(name: "자아와 명상", category: "공통교양", categorySmall: "공통교양", credit: 1),
        Lecture(name: "불교와 인간", category: "기본교양", categorySmall: "공통교양",credit: 3),
        Lecture(name: "자아와 명상", category: "공통교양", categorySmall: "공통교양",credit: 1),
        Lecture(name: "불교와 인간", category: "기본교양", categorySmall: "공통교양",credit: 3),
        Lecture(name: "자아와 명상", category: "공통교양", categorySmall: "공통교양",credit: 1),
        Lecture(name: "불교와 인간", category: "기본교양", categorySmall: "공통교양",credit: 3),
    ]
    
    var filteredList: [Lecture] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "수업목록에서 검색"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        searchBar.delegate = self
        searchBar.placeholder = "수업명을 입력하세요."
        searchBar.barTintColor = UIColor.groupTableViewBackground
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EditKeywordSarchTableViewCell", for: indexPath) as! EditKeywordSarchTableViewCell
        
        cell.nameLabel.text = filteredList[indexPath.row].name
        cell.categoryLabel.text = filteredList[indexPath.row].category
        cell.creditLabel.text = "\(filteredList[indexPath.row].credit)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectNumber = indexPath.row + 1
    }
    
    
}

extension EditKeywordSearchViewController: UITableViewDelegate {
    
}
