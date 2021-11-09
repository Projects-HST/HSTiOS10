//
//  TeacherGroupListCell.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/10/21.
//

import UIKit

class TeacherGroupListCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var msgLbl: UILabel!
    @IBOutlet weak var bgView: UIView!
    
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
