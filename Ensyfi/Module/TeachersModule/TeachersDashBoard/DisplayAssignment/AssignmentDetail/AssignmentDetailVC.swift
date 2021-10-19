//
//  AssignmentDetailVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 13/10/21.
//

import UIKit

class AssignmentDetailVC: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var Description: UILabel!
    
    var SelTitle = String()
    var selSubject = String()
    var selTeacherName = String()
    var selType = String()
    var selDescription = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.titleLbl.text = SelTitle
        self.subject.text = selSubject
        self.name.text = selTeacherName
        self.type.text = selType
        self.Description.text = selDescription
    }
}
