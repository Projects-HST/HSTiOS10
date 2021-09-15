//
//  ONDutyListCell.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 08/09/21.
//

import UIKit

class ONDutyListCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var statusImg: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
