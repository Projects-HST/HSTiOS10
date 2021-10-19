//
//  AssignmentOverViewCell.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 13/10/21.
//

import UIKit

class AssignmentOverViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var sentImg: UIImageView!
    @IBOutlet weak var sentStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
