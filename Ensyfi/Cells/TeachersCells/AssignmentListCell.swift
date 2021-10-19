//
//  AssignmentListCell.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 12/10/21.
//

import UIKit

class AssignmentListCell: UITableViewCell {

    @IBOutlet weak var asignmentDate: UILabel!
    @IBOutlet weak var classTest: UILabel!
    @IBOutlet weak var homeWork: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
