
import UIKit

class MyPageTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func dataInit() {
        let initQuestionAlert = UIAlertController(title: "초기화", message: "정보를 지우겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        let yesAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default) { ACTION in
            
            
        }
        
        let noAction = UIAlertAction(title: "아니요", style: UIAlertAction.Style.default)
        
        initQuestionAlert.addAction(yesAction)
        initQuestionAlert.addAction(noAction)
        
        present(initQuestionAlert, animated: true, completion: nil)

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.row == 0
            {
                return 210
            }
        }
        else if indexPath.section == 1 {
            if indexPath.row == 0
            {
                return 50
            }
        }
        else if indexPath.section == 2 {
            if indexPath.row == 0
            {
                return 50
            }
        }
        else if indexPath.section == 5 {
            return 90
        }
        return 50
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        if section == 1 {
            return 2
        }
        return 1
    }
 
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "나의 프로필"
        }
       
        else if section == 1 {
            return "바로가기 링크"
        }
     
        return nil
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageTableViewCell1", for: indexPath) as! MyPageTableViewCell1
            cell.MyPageNameLabel.text = (myInfo?.name)!
            cell.MyPageClassLabel.text = "\((myInfo?.college)!) \((myInfo?.department)!) \((myInfo?.admissionYear)!)학번"
            let percentage = Int(100.0 - 100.0 * cell.MyPageProgressView.progress)
            cell.MyPageProgressLabel.text = "졸업까지 \(percentage)% 남았습니다."
            
            
            return cell
        }

        else if indexPath.section == 1 {
            if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageTableViewCell3", for: indexPath) as! MyPageTableViewCell3
                
            return cell
                
            }
            else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageTableViewCell4", for: indexPath) as! MyPageTableViewCell4
                return cell
            }
        
        }
        else if indexPath.section == 2 {
            let cell =  tableView.dequeueReusableCell(withIdentifier: "MyPageTableViewCell2", for: indexPath) as! MyPageTableViewCell2
            return cell
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }

}
