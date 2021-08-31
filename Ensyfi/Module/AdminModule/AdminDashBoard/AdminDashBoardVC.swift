//
//  AdminDashboardVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 23/08/21.
//

import UIKit

class AdminDashboardVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let user_loginType = UserDefaults.standard.object(forKey: UserDefaultsKey.user_login_type_Key.rawValue) ?? ""
        let institute_code = UserDefaults.standard.object(forKey: UserDefaultsKey.institude_Code_Key.rawValue) ?? ""
        
        if user_loginType as! String == "" {
            
        }
        else {
            GlobalVariables.shared.user_loginType = user_loginType as! String
            GlobalVariables.shared.Institute_Code = "/testing"
        }
        print(user_loginType)
    }
}
