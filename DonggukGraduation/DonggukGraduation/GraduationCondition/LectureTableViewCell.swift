import UIKit

class LectureTableViewCell: UITableViewCell {

    @IBOutlet weak var symbolview: UIView!
    @IBOutlet weak var lectureLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
