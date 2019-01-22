
import UIKit

class MainTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 3
        }
        else if section == 1 {
            return 1
        }
        else if section == 2 {
            return 1
        }
        else {
            return 2
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell
        
        if indexPath.section == 0 {
            if indexPath.row == 0
            {
                cell = tableView.dequeueReusableCell(withIdentifier: "CELL1", for: indexPath)
                cell.textLabel?.text = "남은학점"
                cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
                cell.detailTextLabel?.text = "0/160"
                cell.detailTextLabel?.font = UIFont.boldSystemFont(ofSize: 30)
                return cell
            }
            else if indexPath.row == 1
            {
                cell = tableView.dequeueReusableCell(withIdentifier: "CELL4", for: indexPath)
                cell.accessoryType = .disclosureIndicator
                cell.textLabel?.text = "전공영역"
                cell.textLabel?.font.withSize(15)
                cell.textLabel?.textColor = UIColor.lightGray
                cell.detailTextLabel?.text = "0/75"
                cell.detailTextLabel?.font.withSize(15)
                cell.detailTextLabel?.textColor = UIColor.lightGray

                return cell
            }
            else
            {
                cell = tableView.dequeueReusableCell(withIdentifier: "CELL4", for: indexPath)
                cell.accessoryType = .disclosureIndicator
                cell.textLabel?.text = "교양영역"
                cell.textLabel?.font.withSize(15)
                cell.textLabel?.textColor = UIColor.lightGray
                cell.detailTextLabel?.text = "0/75"
                cell.detailTextLabel?.font.withSize(15)
                cell.detailTextLabel?.textColor = UIColor.lightGray
                return cell
            }
        }
        
        else if indexPath.section == 1 {
            if indexPath.row == 0
            {
                cell = tableView.dequeueReusableCell(withIdentifier: "CELL1", for: indexPath)
                cell.textLabel?.text = "영어성적"
                cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
                cell.detailTextLabel?.text = "제출여부"
                cell.detailTextLabel?.font = UIFont.boldSystemFont(ofSize: 30)
                return cell
            }
        }
        
        else if indexPath.section == 2 {
            if indexPath.row == 0
            {
                cell = tableView.dequeueReusableCell(withIdentifier: "CELL1", for: indexPath)
                cell.textLabel?.text = "졸업논문"
                cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
                cell.detailTextLabel?.text = "제출여부"
                cell.detailTextLabel?.font = UIFont.boldSystemFont(ofSize: 30)
                return cell
            }
        }
        else if indexPath.section == 3 {
            if indexPath.row == 0
            {
                cell = tableView.dequeueReusableCell(withIdentifier: "CELL1", for: indexPath)
                cell.textLabel?.text = "남은시간"
                cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
                cell.detailTextLabel?.text = "0/90(시간)"
                cell.detailTextLabel?.font = UIFont.boldSystemFont(ofSize: 30)
                
            return cell
            }
            else if indexPath.row == 1
            {
                cell = tableView.dequeueReusableCell(withIdentifier: "CELL2", for: indexPath)
                cell.textLabel?.text = "채운시간"
                cell.textLabel?.textColor = UIColor.lightGray
                cell.detailTextLabel?.text = "0/90(시간)"
                cell.detailTextLabel?.font.withSize(15)
                cell.detailTextLabel?.textColor = UIColor.lightGray
                return cell
                
            }
        }
        
       return UITableViewCell()
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "학점"
        }
        else if section == 1 {
            return "언어영역"
        }
        else if section == 2 {
            return "졸업논문"
        }
        else if section == 3 {
            return "봉사시간"
        }
        return nil
    }

    
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
