import UIKit
class EventTableViewCell: UITableViewCell {
    //this class holds all the data that is to be displayed in a cell of the table
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var socNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var start: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
