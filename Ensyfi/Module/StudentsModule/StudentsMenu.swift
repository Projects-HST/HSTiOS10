//
//  StudentsMenu.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 27/09/21.
//

import UIKit
import CoreData

class StudentsMenu: UIViewController {

    @IBOutlet weak var userPic: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    var from = String()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context : NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.name.text = "Hi \(GlobalVariables.shared.userName)"
        self.from = "Students"
        self.context = appDelegate.persistentContainer.viewContext
    }
    
    @IBAction func specialClassAction(_ sender: Any) {
        self.performSegue(withIdentifier: "to_specialClass", sender: self)
    }
    
    @IBAction func signOutAction(_ sender: Any) {
        
        let alertController = UIAlertController(title: Globals.alertTitle, message: "Are you sure want to sign out", preferredStyle: .alert)

        // Create the actions
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            UIAlertAction in
            NSLog("OK Pressed")
          
            UserDefaults.standard.clearUserData()
            self.clearGlobalVariables ()
            self.reNew()
            self.deleteAllData(entity:"StudentRegDatas")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
        }
        // Add the actions
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)

        // Present the controller
        self.present(alertController, animated: true, completion: nil)
    }
    
    func reNew(){
            //reload application data (renew root view )
        UIApplication.shared.keyWindow?.rootViewController = storyboard!.instantiateViewController(withIdentifier: "loginVC")
    }
    
    func deleteAllData(entity: String)
    {
        let ReqVar = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: ReqVar)
        do { try context!.execute(DelAllReqVar) }
        catch { print(error) }
    }
    
 
    func clearGlobalVariables () {
        
        GlobalVariables.shared.user_loginType = ""
        GlobalVariables.shared.Institute_Code = ""
        GlobalVariables.shared.leave_days = 0
        GlobalVariables.shared.absent_days = 0
        GlobalVariables.shared.od_days = 0
        GlobalVariables.shared.total_working_days = 0
        GlobalVariables.shared.present_days = 0
        GlobalVariables.shared.user_id = ""
        GlobalVariables.shared.profilePic = ""
        GlobalVariables.shared.userName = ""
        GlobalVariables.shared.registered_id = ""
        GlobalVariables.shared.admission_id = ""
        GlobalVariables.shared.admission_no = ""
        GlobalVariables.shared.class_id = ""
        GlobalVariables.shared.regName = ""
        GlobalVariables.shared.class_name = ""
        GlobalVariables.shared.sec_name = ""
        GlobalVariables.shared.NAME = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if (segue.identifier == "to_specialClass")
        {
        let vc = segue.destination as! AdminSpecialClassVC
         vc.from = self.from
       }
    }
}
