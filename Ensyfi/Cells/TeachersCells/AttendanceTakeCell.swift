//
//  AttendanceTakeCell.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 05/10/21.
//

import UIKit
import DropDown

class AttendanceTakeCell: UITableViewCell {

    @IBOutlet weak var SerialNo: UILabel!
    @IBOutlet weak var studentName: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var selectStatus: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
