//
//  ExamMarkEntryCell.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 20/10/21.
//

import UIKit

class ExamMarkEntryCell: UITableViewCell {

    @IBOutlet weak var SerialNo: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var markField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
