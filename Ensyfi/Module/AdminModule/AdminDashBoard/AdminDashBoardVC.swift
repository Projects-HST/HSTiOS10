//
//  AdminDashboardVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 23/08/21.
//

import UIKit

class AdminDashboardVC: UIViewController {

    @IBOutlet weak var bgView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let user_loginType = UserDefaults.standard.object(forKey: UserDefaultsKey.user_login_type_Key.rawValue) ?? ""
        let institute_code = UserDefaults.standard.object(forKey: UserDefaultsKey.institude_Code_Key.rawValue) ?? ""
        let userType = UserDefaults.standard.object(forKey: UserDefaultsKey.userTypeKey.rawValue) ?? ""
        let user_id = UserDefaults.standard.object(forKey: UserDefaultsKey.user_idkey.rawValue) ?? ""
        let userName = UserDefaults.standard.object(forKey: UserDefaultsKey.namekey.rawValue) ?? ""
        
        if user_loginType as! String == "" {
            
        }
        else {
            GlobalVariables.shared.user_loginType = user_loginType as! String
            GlobalVariables.shared.Institute_Code = institute_code as! String
            print(user_loginType)
            GlobalVariables.shared.userName = userName as! String
            GlobalVariables.shared.user_type = userType as! String
            GlobalVariables.shared.user_id = user_id as! String
            print(GlobalVariables.shared.userName)
            print(GlobalVariables.shared.user_type)
        }
        self.bgView.dropShadow()
    }
}
//adminNavV
