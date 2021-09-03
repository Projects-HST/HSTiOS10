//
//  TeacherListCell.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 02/09/21.
//

import UIKit

class TeacherListCell: UITableViewCell {
    
    @IBOutlet weak var SerialNo: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var sub: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
