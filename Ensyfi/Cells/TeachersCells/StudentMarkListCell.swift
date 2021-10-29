//
//  StudentMarkListCell.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 27/10/21.
//

import UIKit

class StudentMarkListCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var marks: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
