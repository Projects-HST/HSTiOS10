//
//  DisplayAttendanceCell.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 11/10/21.
//

import UIKit

class DisplayAttendanceCell: UITableViewCell {

    @IBOutlet weak var Atendate: UILabel!
    @IBOutlet weak var classStrength: UILabel!
    @IBOutlet weak var noPresent: UILabel!
    @IBOutlet weak var noAbsent: UILabel!
    @IBOutlet weak var sentImg: UIImageView!
    @IBOutlet weak var sentStatus: UILabel!
    @IBOutlet weak var bgView: UIView!
    
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
