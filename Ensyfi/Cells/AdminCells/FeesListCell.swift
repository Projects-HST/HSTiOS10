//
//  FeesListCell.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 08/09/21.
//

import UIKit

class FeesListCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var date: UILabel!
    
    
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
