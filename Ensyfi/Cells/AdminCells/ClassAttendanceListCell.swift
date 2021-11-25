//
//  ClassAttendanceListCell.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/09/21.
//

import UIKit

class ClassAttendanceListCell: UITableViewCell {

    @IBOutlet weak var className: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var absentLbl: UILabel!
    @IBOutlet weak var presentLbl: UILabel!
    @IBOutlet weak var classStrengthLbl: UILabel!
    @IBOutlet weak var absentImg: UIImageView!
    @IBOutlet weak var presentImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bgView.dropShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
