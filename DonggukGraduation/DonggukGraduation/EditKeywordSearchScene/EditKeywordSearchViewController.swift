
import UIKit

class EditKeywordSearchViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    @IBAction func addLecture() {
        if selectNumber != 0 {
            selectNumber -= 1
            let lecture = filteredList[selectNumber]
            
            if (departmentList.filter { $0.name == lecture.bigCategory }.count) != 0 {
                majorList.append(PlanLecture(name: lecture.name, category: "전공", categorySmall: lecture.smallCategory, credit: lecture.credit, semester: selectedPlan))
                if lecture.smallCategory == "전문" { myCurri?.majorSpecialty += lecture.credit }
                myCurri?.majorCredit += lecture.credit
                myCurri?.allCredit += lecture.credit
            }
            else {
                generalList.append(PlanLecture(name: lecture.name, category: lecture.bigCategory, categorySmall: lecture.smallCategory, credit: lecture.credit, semester: selectedPlan))
                
                if lecture.bigCategory == "공통교양" { myCurri?.generalCommon += lecture.credit }
                else if lecture.bigCategory == "일반교양" { myCurri?.generalCulture += lecture.credit }
                else if lecture.bigCategory == "핵심교양" { myCurri?.generalMain += lecture.credit }
                else if lecture.bigCategory == "기본소양" { myCurri?.generalLiteracy += lecture.credit }
                else if lecture.bigCategory == "대학전공기초" { myCurri?.generalMajorBasic += lecture.credit }
                else if lecture.bigCategory == "학문기초" { myCurri?.generalBasic += lecture.credit }
                myCurri?.allCredit += lecture.credit
                
            }
            print("추가완료")
            if !savePlanData() { return }
            if !saveMyCurriData() { return }

            let noticeAlert = UIAlertController(title: "추가완료", message: "수업이 추가되었습니다", preferredStyle: UIAlertController.Style.alert)

            let okAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)

            noticeAlert.addAction(okAction)

            present(noticeAlert, animated: true, completion: nil)
        }
    }

    var selectNumber:Int = 0

    var lectureList:[Lecture] = []

    var filteredList: [Lecture] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "수업목록에서 검색"
        
        lectureList = majorLectureList + generalLectureList
        print(lectureList)
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
        cell.categoryLabel.text = filteredList[indexPath.row].bigCategory
        cell.creditLabel.text = "\(filteredList[indexPath.row].credit)학점"

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectNumber = indexPath.row + 1
    }


}

extension EditKeywordSearchViewController: UITableViewDelegate {

}
