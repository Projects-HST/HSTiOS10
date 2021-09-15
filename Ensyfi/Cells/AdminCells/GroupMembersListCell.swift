//
//  GroupMembersListCell.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 15/09/21.
//

import UIKit

class GroupMembersListCell: UITableViewCell {
    
    @IBOutlet weak var member: UILabel!
    @IBOutlet weak var role: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
