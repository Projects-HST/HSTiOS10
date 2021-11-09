//
//  StudentsLoginProfileVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 27/09/21.
//

import UIKit
import CoreData
import DropDown

class StudentsLoginProfileVC: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var admissionNo: UILabel!
    @IBOutlet weak var className: UILabel!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var selectTypeView: UIView!
    @IBOutlet weak var selectTypeField: UITextField!
    
    let userdata = UserDefaults.standard.getStudentRegDetails()
    var dummy = [String]()
    var studentRegArr = [StudentRegDatas]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context : NSManagedObjectContext?
    let dropDown = DropDown()
     
    var registered_idRegArr = [String]()
    var admission_idRegArr = [String]()
    var admission_noRegArr = [String]()
    var class_idRegArr = [String]()
    var nameRegArr = [String]()
    var class_nameRegArr = [String]()
    var sec_nameRegArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.bgView.dropShadow()
        self.context = appDelegate.persistentContainer.viewContext
//        UserDefaults.standard.setValue("Yes", forKey: "ParentStudentCount")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.fetchStudentRegDetails()
    }
    
    @IBAction func selectClass(_ sender: Any) {
        
        dropDown.show()
        dropDown.anchorView = selectTypeField
        dropDown.dataSource = nameRegArr
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            selectTypeField.text = item
            let slectedRegId = registered_idRegArr[index]
            let slectedClassId = class_idRegArr[index]
            let slectedAdmissionId = admission_idRegArr[index]
            let slectedName = nameRegArr[index]
            let slectedClassName = class_nameRegArr[index]
            let slectedSecName = sec_nameRegArr[index]
            let slectedAdmissionNo = admission_noRegArr[index]
          
            UserDefaults.standard.set(slectedRegId, forKey: UserDefaultsKey.registered_idKey.rawValue)
            UserDefaults.standard.set(slectedAdmissionId, forKey: UserDefaultsKey.admission_idKey.rawValue)
            UserDefaults.standard.set(slectedAdmissionNo, forKey: UserDefaultsKey.admission_noKey.rawValue)
            UserDefaults.standard.set(slectedClassId, forKey: UserDefaultsKey.class_idKey.rawValue)
            UserDefaults.standard.set(slectedName, forKey: UserDefaultsKey.regnameKey.rawValue)
            UserDefaults.standard.set(slectedClassName, forKey: UserDefaultsKey.class_nameKey.rawValue)
            UserDefaults.standard.set(slectedSecName, forKey: UserDefaultsKey.sec_nameKey.rawValue)
            
            self.name.text = slectedName
            self.admissionNo.text = slectedAdmissionNo
            self.className.text = slectedClassName
        }
    }

    @IBAction func continueAction(_ sender: Any) {
        
        self.performSegue(withIdentifier: "to_DashBoard", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "to_DashBoard")
        {
            _ = segue.destination as! UINavigationController
        }
    }
    
    func fetchStudentRegDetails() {
    
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "StudentRegDatas")
    
        do {
            let results = try context.fetch(fetchRequest)
            self.studentRegArr = results as! [StudentRegDatas]
            
            for datas in studentRegArr {
                self.nameRegArr = datas.name as! [String]
                self.registered_idRegArr = datas.registered_id as! [String]
                self.admission_idRegArr = datas.admission_id as! [String]
                self.class_idRegArr = datas.class_id as! [String]
                self.class_nameRegArr = datas.class_name as! [String]
                self.sec_nameRegArr = datas.sec_name as! [String]
                self.admission_noRegArr = datas.admission_no as! [String]
            }
            if nameRegArr.count > 1 {
                self.selectTypeView.alpha = 1
                self.name.text = nameRegArr[0]
                self.admissionNo.text = admission_noRegArr[0]
                self.className.text = class_nameRegArr[0]
            }
            else {
                self.selectTypeView.alpha = 0
                self.name.text = nameRegArr[0]
                self.admissionNo.text = admission_noRegArr[0]
                self.className.text = class_nameRegArr[0]
            }
            
            UserDefaults.standard.set(registered_idRegArr[0], forKey: UserDefaultsKey.registered_idKey.rawValue)
            UserDefaults.standard.set(admission_idRegArr[0], forKey: UserDefaultsKey.admission_idKey.rawValue)
            UserDefaults.standard.set(admission_noRegArr[0], forKey: UserDefaultsKey.admission_noKey.rawValue)
            UserDefaults.standard.set(class_idRegArr[0], forKey: UserDefaultsKey.class_idKey.rawValue)
            UserDefaults.standard.set(nameRegArr[0], forKey: UserDefaultsKey.regnameKey.rawValue)
            UserDefaults.standard.set(class_nameRegArr[0], forKey: UserDefaultsKey.class_nameKey.rawValue)
            UserDefaults.standard.set(sec_nameRegArr[0], forKey: UserDefaultsKey.sec_nameKey.rawValue)
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
}
 
