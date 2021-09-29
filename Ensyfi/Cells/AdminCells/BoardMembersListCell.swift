//
//  BoardMembersListCell.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/09/21.
//

import UIKit

class BoardMembersListCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var sNo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
