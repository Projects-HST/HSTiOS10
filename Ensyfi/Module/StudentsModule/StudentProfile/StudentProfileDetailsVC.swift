//
//  StudentProfileDetails.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 22/10/21.
//

import UIKit
import CoreData

class StudentProfileDetailsVC: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var admissionNo: UILabel!
    @IBOutlet weak var EmsiNo: UILabel!
    @IBOutlet weak var admissionDate: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var dob: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var nationality: UILabel!
    @IBOutlet weak var religion: UILabel!
    @IBOutlet weak var communalClass: UILabel!
    @IBOutlet weak var community: UILabel!
    @IBOutlet weak var parentName: UILabel!
    @IBOutlet weak var parentId: UILabel!
    @IBOutlet weak var motherTongue: UILabel!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var mobileNo: UILabel!
    @IBOutlet weak var secMobileNo: UILabel!
    @IBOutlet weak var emailId: UILabel!
    @IBOutlet weak var secEmailId: UILabel!
    @IBOutlet weak var previousSchool: UILabel!
    @IBOutlet weak var previousClass: UILabel!
    @IBOutlet weak var promotionStatus: UILabel!
    @IBOutlet weak var tc: UILabel!
    @IBOutlet weak var recordSheet: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var parentStatus: UILabel!
    @IBOutlet weak var studentPic: UIImageView!
    @IBOutlet weak var bgView: UIView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context : NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.context = appDelegate.persistentContainer.viewContext
        self.fetchData()
        self.bgView.dropShadow()
    }

    func fetchData(){
    
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "StudentProfile")
    
            request.returnsObjectsAsFaults = false
    
            do {
                let results = try context?.fetch(request)
                 print(results!)
                    for result in results as! [NSManagedObject] {
                        
                        if let name = result.value(forKey:"name") as? String {
                            self.name.text = name
                        }
                        if let admisn_no = result.value(forKey:"admisn_no") as? String {
                            self.admissionNo.text = admisn_no
                        }
                        if let emsi_num = result.value(forKey:"emsi_num") as? String {
                            self.EmsiNo.text = emsi_num
                        }
                        if let admisn_date = result.value(forKey:"admisn_date") as? String {
                            self.admissionDate.text = admisn_date
                        }
                        if let sex = result.value(forKey:"sex") as? String {
                            self.gender.text = sex
                        }
                        if let dob = result.value(forKey:"dob") as? String {
                            self.dob.text = dob
                        }
                        if let age = result.value(forKey:"age") as? String {
                            self.age.text = age
                        }
                        if let nationality = result.value(forKey:"nationality") as? String {
                            self.nationality.text = nationality
                        }
                        if let religion = result.value(forKey:"religion") as? String {
                            self.religion.text = religion
                        }
                        if let community_class = result.value(forKey:"community_class") as? String {
                            self.communalClass.text = community_class
                        }
                        if let community = result.value(forKey:"community") as? String {
                            self.community.text = community
                        }
                        if let parnt_guardn = result.value(forKey:"parnt_guardn") as? String {
                            self.parentName.text = parnt_guardn
                        }
                        if let parnt_guardn_id = result.value(forKey:"parnt_guardn_id") as? String {
                            self.parentId.text = parnt_guardn_id
                        }
                        if let mother_tongue = result.value(forKey:"mother_tongue") as? String {
                            self.motherTongue.text = mother_tongue
                        }
                        if let language = result.value(forKey:"language") as? String {
                            self.language.text = language
                        }
                        if let mobile = result.value(forKey:"mobile") as? String {
                            self.mobileNo.text = mobile
                        }
                        if let sec_mobile = result.value(forKey:"sec_mobile") as? String {
                            self.secMobileNo.text = sec_mobile
                        }
                        if let email = result.value(forKey:"email") as? String {
                            self.emailId.text = email
                        }
                        if let sec_email = result.value(forKey:"sec_email") as? String {
                            self.secEmailId.text = sec_email
                        }
                        if let qualified_promotion = result.value(forKey:"qualified_promotion") as? String {
                            self.promotionStatus.text = qualified_promotion
                        }
                        if let transfer_certificate = result.value(forKey:"transfer_certificate") as? String {
                            self.tc.text = transfer_certificate
                        }
                        if let record_sheet = result.value(forKey:"record_sheet") as? String {
                            self.recordSheet.text = record_sheet
                        }
                        if let status = result.value(forKey:"status") as? String {
                            self.status.text = status
                        }
                        if let parents_status = result.value(forKey:"parents_status") as? String {
                            self.parentStatus.text = parents_status
                        }
                        if let last_sch_name = result.value(forKey:"last_sch_name") as? String {
                            self.previousSchool.text = last_sch_name
                        }
                        if let last_studied = result.value(forKey:"last_studied") as? String {
                            self.previousClass.text = last_studied
                        }
               }
            } catch {
    
            }
        }
}
