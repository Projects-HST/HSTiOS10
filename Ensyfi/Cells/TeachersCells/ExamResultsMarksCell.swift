//
//  ExamResultsMarksCell.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 19/10/21.
//

import UIKit

class ExamResultsMarksCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var grade: UILabel!
    @IBOutlet weak var mark: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
