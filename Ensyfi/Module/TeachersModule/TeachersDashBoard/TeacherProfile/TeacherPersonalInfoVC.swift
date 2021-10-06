//
//  TeacherPersonalInfoVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 04/10/21.
//

import UIKit
import CoreData

class TeacherPersonalInfoVC: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var nationality: UILabel!
    @IBOutlet weak var religion: UILabel!
    @IBOutlet weak var commmunityCLass: UILabel!
    @IBOutlet weak var community: UILabel!
    @IBOutlet weak var handSubject: UILabel!
    @IBOutlet weak var claasTeacherFor: UILabel!
    @IBOutlet weak var mobilNo: UILabel!
    @IBOutlet weak var secMobileNo: UILabel!
    @IBOutlet weak var emailId: UILabel!
    @IBOutlet weak var alternateEmailId: UILabel!
    @IBOutlet weak var techerImage: UIImageView!
    @IBOutlet weak var classSection: UILabel!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context : NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        context = appDelegate.persistentContainer.viewContext
        self.fetchData()
    }
    
    func fetchData(){
    
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "TeacherProfile")
    
            request.returnsObjectsAsFaults = false
    
            do {
                let results = try context?.fetch(request)
    
                    for result in results as! [NSManagedObject] {
                        
                        if let name = result.value(forKey:"name") as? String {
                            self.name.text = name
                        }
                        if let sex = result.value(forKey:"sex") as? String {
                            self.gender.text = sex
                        }
                        if let address = result.value(forKey:"address") as? String {
                            self.address.text = address
                        }
                        if let nationality = result.value(forKey:"nationality") as? String {
                            self.nationality.text = nationality
                        }
                        if let religion = result.value(forKey:"religion") as? String {
                            self.religion.text = religion
                        }
                        if let community_class = result.value(forKey:"community_class") as? String {
                            self.community.text = community_class
                        }
                        if let community = result.value(forKey:"community") as? String {
                            self.community.text = community
                        }
                        if let subject = result.value(forKey:"subject") as? String {
                            self.handSubject.text = subject
                        }
                        if let class_teacher = result.value(forKey:"class_teacher") as? String {
                            self.claasTeacherFor.text = class_teacher
                        }
                        if let phone = result.value(forKey:"phone") as? String {
                            self.mobilNo.text = phone
                        }
                        if let email = result.value(forKey:"email") as? String {
                            self.emailId.text = email
                        }
                        if let sec_email = result.value(forKey:"sec_email") as? String {
                            self.alternateEmailId.text = sec_email
                        }
                        if let class_taken = result.value(forKey:"class_taken") as? String {
                            self.classSection.text = class_taken
                        }
//                        if let profile_pic = result.value(forKey:"profile_pic") as? String {
//
//                        }
                    
               }
            } catch {
    
            }
        }
}
