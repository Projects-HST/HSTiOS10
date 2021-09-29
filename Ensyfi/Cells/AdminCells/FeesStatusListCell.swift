//
//  FeesStatusListCell.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/09/21.
//

import UIKit

class FeesStatusListCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var quota: UILabel!
    @IBOutlet weak var status: UILabel!
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
