//
//  HomeWorkListCell.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 01/09/21.
//

import UIKit

class HomeWorkListCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subName: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.dropShadow()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
