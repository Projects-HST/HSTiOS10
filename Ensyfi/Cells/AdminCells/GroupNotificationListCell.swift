//
//  GroupNotificationListCell.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 22/11/21.
//

import UIKit

class GroupNotificationListCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var msgType: UILabel!
    @IBOutlet weak var desc: UILabel!
    
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
