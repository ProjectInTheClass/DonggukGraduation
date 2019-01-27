import UIKit

class AllLectureListTableViewController: UITableViewController {
    var category : String?
    var lecture : [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let category = category {
            if category == "전공영역" {
                
            }
            else if category == "교양영역" {
                
            }
            print(category)
        }

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 5

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.section == 0 {
            
            let cell1  = tableView.dequeueReusableCell(withIdentifier: "CELL1", for: indexPath) as! LectureTableViewCell
            cell1.lectureLabel.text = "신호및시스템"
            cell1.pointLabel.text = "3학점"
            cell1.pointLabel.textColor = UIColor.lightGray
            cell1.symbolview.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            return cell1
            
        }
        
        else if indexPath.section == 1 {
            let cell1  = tableView.dequeueReusableCell(withIdentifier: "CELL1", for: indexPath) as! LectureTableViewCell
            cell1.lectureLabel.text = "회로이론"
            cell1.pointLabel.text = "3학점"
            cell1.pointLabel.textColor = UIColor.lightGray
            cell1.symbolview.backgroundColor = .blue
            cell1.symbolview.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            return cell1
        }

        
        return UITableViewCell()
        
    }
    
/*

     if indexPath.section == 0 {
     
     let cell1  = tableView.dequeueReusableCell(withIdentifier: "CELL1", for: indexPath) as! LectureTableViewCell
     cell1.lectureLabel.text = "신호및시스템"
     cell1.pointLabel.text = "3학점"
     cell1.pointLabel.textColor = UIColor.lightGray
     cell1.symbolview.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
     return cell1
     
     }
     
     else if indexPath.section == 1 {
     let cell1  = tableView.dequeueReusableCell(withIdentifier: "CELL1", for: indexPath) as! LectureTableViewCell
     cell1.lectureLabel.text = "회로이론"
     cell1.pointLabel.text = "3학점"
     cell1.pointLabel.textColor = UIColor.lightGray
     cell1.symbolview.backgroundColor = .blue
     cell1.symbolview.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
     return cell1
     }
     
     else if indexPath.section == 2 {
     let cell1  = tableView.dequeueReusableCell(withIdentifier: "CELL1", for: indexPath) as! LectureTableViewCell
     cell1.lectureLabel.text = "회로이론"
     cell1.pointLabel.text = "3학점"
     cell1.pointLabel.textColor = UIColor.lightGray
     cell1.symbolview.backgroundColor = .blue
     cell1.symbolview.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
     return cell1
     }
     
     else if indexPath.section == 3 {
     let cell1  = tableView.dequeueReusableCell(withIdentifier: "CELL1", for: indexPath) as! LectureTableViewCell
     cell1.lectureLabel.text = "회로이론"
     cell1.pointLabel.text = "3학점"
     cell1.pointLabel.textColor = UIColor.lightGray
     cell1.symbolview.backgroundColor = .blue
     cell1.symbolview.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
     return cell1
     }
     
     else if indexPath.section == 4 {
     let cell1  = tableView.dequeueReusableCell(withIdentifier: "CELL1", for: indexPath) as! LectureTableViewCell
     cell1.lectureLabel.text = "회로이론"
     cell1.pointLabel.text = "3학점"
     cell1.pointLabel.textColor = UIColor.lightGray
     cell1.symbolview.backgroundColor = .blue
     cell1.symbolview.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
     return cell1
     }
     
     
*/
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "전공기초"
        }
        else if section == 1 {
            return "전공전문"
        }
        return nil
    }
    
    /*
 override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
 if section == 0 {
 return "학문기초 (0/30)"
 }
 else if section == 1 {
return "기본소양 (0/6)"
 }
     else if section == 2 {
     return "공통교양 (0/9)"
     }
     
     else if section == 3 {
     return "핵심교양 (0/9)"
     }
     else if section == 4 {
     return "일반교양 (0/9)"
     }
 return nil
 }
 
 */


    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
