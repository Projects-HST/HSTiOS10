//
//  TeacherSideMenuVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/09/21.
//

import UIKit
import CoreData

class TeacherSideMenuVC: UIViewController {
    
    @IBOutlet weak var userPic: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context : NSManagedObjectContext?
    var from = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.name.text = "Hi \(GlobalVariables.shared.userName)"
        context = appDelegate.persistentContainer.viewContext
        self.from = "Teachers"
    }
    
    @IBAction func specialClassAction(_ sender: Any) {
        self.performSegue(withIdentifier: "techaerSpecialClass", sender: self)
    }
    
    @IBAction func signOutAction(_ sender: Any) {
        
        let alertController = UIAlertController(title: Globals.alertTitle, message: "Are you sure want to sign out", preferredStyle: .alert)

        // Create the actions
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { [self]
            UIAlertAction in
            NSLog("OK Pressed")
          
            UserDefaults.standard.clearUserData()
            self.clearGlobalVariables ()
            self.reNew()
            deleteAllData(entity:"AcademicMonths")
            deleteAllData(entity:"AcademicMarks")
            deleteAllData(entity:"ClassSubjects")
            deleteAllData(entity:"ExamDetails")
            deleteAllData(entity:"ExamsDatas")
            deleteAllData(entity:"HomeWorkDetails")
            deleteAllData(entity:"Reminders")
            deleteAllData(entity:"StudentDetails")
            deleteAllData(entity:"TeacherProfile")
            deleteAllData(entity:"ClassAttendances")
            deleteAllData(entity:"ClassAttendanceHistory")
            deleteAllData(entity:"Homework_class_test")
            deleteAllData(entity:"TimeTables")
            
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
    }
    
    func deleteAllData(entity: String)
    {
        let ReqVar = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: ReqVar)
        do { try context!.execute(DelAllReqVar) }
        catch { print(error) }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if (segue.identifier == "techaerSpecialClass")
        {
        let vc = segue.destination as! AdminSpecialClassVC
         vc.from = self.from
       }
    }
}


