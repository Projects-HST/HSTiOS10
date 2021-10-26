//
//  StudentDashBoardVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 27/09/21.
//

import UIKit

class StudentDashBoardVC: UIViewController {

    @IBOutlet weak var bgView: UIView!
    
    let userdata = UserDefaults.standard.getStudentRegDetails()
    var from = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.bgView.dropShadow()
        GlobalVariables.shared.registered_id = (userdata?.registered_id)!
        GlobalVariables.shared.admission_id = (userdata?.admission_id)!
        GlobalVariables.shared.admission_no = (userdata?.admission_no)!
        GlobalVariables.shared.class_id = (userdata?.class_id)!
        GlobalVariables.shared.name = (userdata?.name)!
        GlobalVariables.shared.class_name = (userdata?.class_name)!
        GlobalVariables.shared.sec_name = (userdata?.sec_name)!

        from = "Student"
        
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
