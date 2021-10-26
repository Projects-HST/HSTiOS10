//
//  TeachersHWDetailsVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 26/10/21.
//

import UIKit

class TeachersHWDetailsVC: UIViewController {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var topicLbl: UILabel!
    @IBOutlet weak var dueDate: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    var selectedTopic = String()
    var selectedTitle = String()
    var selectedDate = String()
    var selectedDescription = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.bgView.dropShadow()
        self.titleLbl.text = self.selectedTitle
        self.topicLbl.text = self.selectedTopic
        self.dueDate.text = self.selectedDate
        self.descriptionLbl.text = self.selectedDescription
    }
}
