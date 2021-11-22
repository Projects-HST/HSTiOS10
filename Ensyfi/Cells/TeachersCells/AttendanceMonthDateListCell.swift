//
//  AttendanceMonthDateListCell.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 17/11/21.
//

import UIKit

class AttendanceMonthDateListCell: UITableViewCell {

    @IBOutlet weak var serialNo: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var statusView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
