//
//  StudentDashBoardVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 27/09/21.
//

import UIKit
import SideMenu

class StudentDashBoardVC: UIViewController,SideMenuNavigationControllerDelegate {

    @IBOutlet weak var bgView: UIView!
    
    var from = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().barTintColor = UIColor.white
        self.bgView.dropShadow()
        self.from = "Student"
        
        let user_loginType = UserDefaults.standard.object(forKey: UserDefaultsKey.user_login_type_Key.rawValue) ?? ""
        let institute_code = UserDefaults.standard.object(forKey: UserDefaultsKey.institude_Code_Key.rawValue) ?? ""
        let userType = UserDefaults.standard.object(forKey: UserDefaultsKey.userTypeKey.rawValue) ?? ""
        let user_id = UserDefaults.standard.object(forKey: UserDefaultsKey.user_idkey.rawValue) ?? ""
        let userName = UserDefaults.standard.object(forKey: UserDefaultsKey.namekey.rawValue) ?? ""
        let registered_idKey = UserDefaults.standard.object(forKey: UserDefaultsKey.registered_idKey.rawValue) ?? ""
        let admission_idKey = UserDefaults.standard.object(forKey: UserDefaultsKey.admission_idKey.rawValue) ?? ""
        let admission_noKey = UserDefaults.standard.object(forKey: UserDefaultsKey.admission_noKey.rawValue) ?? ""
        let class_idKey = UserDefaults.standard.object(forKey: UserDefaultsKey.class_idKey.rawValue) ?? ""
        let regnameKey = UserDefaults.standard.object(forKey: UserDefaultsKey.regnameKey.rawValue) ?? ""
        let class_nameKey = UserDefaults.standard.object(forKey: UserDefaultsKey.class_nameKey.rawValue) ?? ""
        let sec_nameKey = UserDefaults.standard.object(forKey: UserDefaultsKey.sec_nameKey.rawValue) ?? ""
        
        if user_loginType as! String == "" {
            
        }
        else {
            GlobalVariables.shared.user_loginType = user_loginType as! String
            GlobalVariables.shared.Institute_Code = institute_code as! String
            GlobalVariables.shared.userName = userName as! String
            GlobalVariables.shared.user_type = userType as! String
            GlobalVariables.shared.user_id = user_id as! String
            GlobalVariables.shared.registered_id = registered_idKey as! String
            GlobalVariables.shared.admission_id = admission_idKey as! String
            GlobalVariables.shared.admission_no = admission_noKey as! String
            GlobalVariables.shared.class_id = class_idKey as! String
            GlobalVariables.shared.regName = regnameKey as! String
            GlobalVariables.shared.class_name = class_nameKey as! String
            GlobalVariables.shared.sec_name = sec_nameKey as! String
            
            print(GlobalVariables.shared.regName)
            print(GlobalVariables.shared.registered_id)
            print(GlobalVariables.shared.admission_no)
            print(GlobalVariables.shared.sec_name)
            print(GlobalVariables.shared.user_id)
        }
    }
    
    func sideMenuWillAppear(menu: SideMenuNavigationController, animated: Bool) {
        view.alpha = 0.8
    }
    
    func sideMenuWillDisappear(menu: SideMenuNavigationController, animated: Bool) {
           view.alpha = 1
    }
    
    @IBAction func toClassTestHW(_ sender: Any) {
        
        self.performSegue(withIdentifier: "toHWClassTest", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "toHWClassTest")
        {
        let vc = segue.destination as! HomeWorkTestVC
            vc.from = self.from
        }
    }
}
//studentsDashboardVC
//to_DashBoard
 
