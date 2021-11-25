//
//  TimeTableListCell.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/10/21.
//

import UIKit

class TimeTableListCell: UITableViewCell {

    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var subNameLbl: UILabel!
    @IBOutlet weak var lineLbl: UILabel!
    @IBOutlet weak var secNmae: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var fromToTimeLbl: UILabel!

    
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
