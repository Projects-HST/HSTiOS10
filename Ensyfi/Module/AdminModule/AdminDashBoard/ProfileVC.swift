//
//  ProfileVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 16/09/21.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var moduleType: UILabel!
    @IBOutlet weak var userNmae: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.titleName.text = GlobalVariables.shared.userName
        self.moduleType.text = GlobalVariables.shared.user_loginType
        self.userNmae.text = GlobalVariables.shared.user_type
    }
}
