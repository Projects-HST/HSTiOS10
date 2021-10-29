//
//  SpecialClassCell.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/10/21.
//

import UIKit

class SpecialClassCell: UITableViewCell {

    @IBOutlet weak var className: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var teacherName: UILabel!
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
