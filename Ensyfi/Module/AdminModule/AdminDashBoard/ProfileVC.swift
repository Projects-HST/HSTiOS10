//
//  ProfileVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 16/09/21.
//

import UIKit
import SideMenu

class ProfileVC: UIViewController,SideMenuNavigationControllerDelegate {

    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var moduleType: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var userNmae: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.titleName.text = GlobalVariables.shared.userName
        self.moduleType.text = GlobalVariables.shared.user_loginType
        self.userNmae.text = GlobalVariables.shared.user_type
        self.bgView.dropShadow()
    }
    
    func sideMenuWillAppear(menu: SideMenuNavigationController, animated: Bool) {
           print("SideMenu Appearing! (animated: \(animated))")
        view.alpha = 0.8
    }
    
    func sideMenuWillDisappear(menu: SideMenuNavigationController, animated: Bool) {
           print("SideMenu Disappearing! (animated: \(animated))")
           view.alpha = 1
    }
}
