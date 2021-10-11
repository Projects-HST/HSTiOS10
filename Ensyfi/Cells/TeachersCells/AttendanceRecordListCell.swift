//
//  AttendanceRecordListCell.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 11/10/21.
//

import UIKit

class AttendanceRecordListCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var status: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
