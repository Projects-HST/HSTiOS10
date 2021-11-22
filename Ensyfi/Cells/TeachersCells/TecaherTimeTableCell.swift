//
//  TecaherTimeTableCell.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 01/11/21.
//

import UIKit

class TecaherTimeTableCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var secName: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
