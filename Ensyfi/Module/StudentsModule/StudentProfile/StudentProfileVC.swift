//
//  StudentProfileVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 22/10/21.
//

import UIKit

class StudentProfileVC: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var bgView: UIView!
    
//    let userdata = UserDefaults.standard.getStudentDatas()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setViewBackGround()
    }
    
    func setViewBackGround() {
        
        self.view1.dropShadow()
        self.view2.dropShadow()
        self.view3.dropShadow()
        self.view4.dropShadow()
        self.bgView.dropShadow()
        
        self.name.text =  GlobalVariables.shared.name
        self.type.text =  "Students"
        self.userName.text =  GlobalVariables.shared.name
        
    }
    
    @IBAction func parentsAction(_ sender: Any) {
      
    }
    
    @IBAction func guardianAction(_ sender: Any) {
        
    }
    
    @IBAction func studentAction(_ sender: Any) {
        
    }
    
    @IBAction func feesAction(_ sender: Any) {
        
    }
}
