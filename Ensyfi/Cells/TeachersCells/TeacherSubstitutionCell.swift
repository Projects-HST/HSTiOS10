//
//  TeacherSubstitutionCell.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/10/21.
//

import UIKit

class TeacherSubstitutionCell: UITableViewCell {

    @IBOutlet weak var secName: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var periodLbl: UILabel!
    @IBOutlet weak var periodNum: UILabel!
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
