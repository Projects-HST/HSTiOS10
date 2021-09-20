//
//  LeavesListCell.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 20/09/21.
//

import UIKit

class LeavesListCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var statusImg: UIImageView!
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
