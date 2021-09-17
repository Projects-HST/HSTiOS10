//
//  GroupAddMemberListCell.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 16/09/21.
//

import UIKit

class GroupAddMemberListCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var addBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
