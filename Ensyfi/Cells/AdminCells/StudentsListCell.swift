//
//  StudentsListCell.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/08/21.
//

import UIKit

class StudentsListCell: UITableViewCell {

    @IBOutlet weak var SerialNo: UILabel!
    @IBOutlet weak var studentName: UILabel!
    @IBOutlet weak var admissionNo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
