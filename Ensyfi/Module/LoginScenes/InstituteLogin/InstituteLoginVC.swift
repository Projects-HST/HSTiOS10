//
//  InstituteLoginVC.swift
//  Ensyfi
//
//  Created by HappysanziMac on 19/08/21.
//

import UIKit
import MBProgressHUD
import CoreData
import SwiftyJSON

class InstituteLoginVC: UIViewController, InstituteLoginDisplayLogic {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context : NSManagedObjectContext?
    
    var interactor1: GetTeacherDetailsBusinessLogic?
    var displayedTeacherDetailsData: [GetTeacherDetailsModel.Fetch.ViewModel.DisplayedGetTeacherDetailsData] = []
    
    var interactor: InstituteLoginBusinessLogic?
    var institute_code = String()
    var login_type = String()
    var user_id = String()
    var user_type = String()
    var profilePic = String()
    var name = String()
    var nameArr = [String]()
    
//    TeacherSubject
    var subNameArr = [String]()
    var class_master_idArr = [String]()
    var teacher_idArr = [String]()
    var sec_nameArr = [String]()
    var class_nameArr = [String]()
    var subject_idArr = [String]()
    
//    StudentsData
    var enroll_idArr = [String]()
    var attendanceStatus = [String]()
    var statusArr = [String]()
    var admission_idArr = [String]()
    var class_idArr = [String]()
    var studentnameArr = [String]()
    var sexArr = [String]()
    var class_sectionArr = [String]()
    var pref_languageArr = [String]()
   
//    ExamDatas
    var exam_idArr = [String]()
    var exam_nameArr = [String]()
    var is_internal_externalArr = [String]()
    var classmaster_idArr = [String]()
    var sec_nameExamsArr = [String]()
    var class_nameExamsArr = [String]()
    var FromdateArr = [String]()
    var TodateArr = [String]()
    var MarkStatusArr = [String]()
    
//    ExamsDetails
    var exam_idDetailsArr = [String]()
    var exam_nameDetailsArr = [String]()
    var subject_nameDetailsArr = [String]()
    var subject_idDetailsdArr = [String]()
    var exam_dateDetailsArr = [String]()
    var timesDetailsArr = [String]()
    var is_internal_externalDetailsArr = [String]()
    var subject_totalDetailsArr = [String]()
    var internal_markDetailsArr = [String]()
    var external_markDetailsArr = [String]()
    var classmaster_idDetailsArr = [String]()
    var class_nameDetailsArr = [String]()
    var sec_nameDetailsArr = [String]()

    
    //    HWDetails
    var hw_idArr = [String]()
    var hw_typeArr = [String]()
    var titleArr = [String]()
    var test_datedArr = [String]()
    var due_dateArr = [String]()
    var timesArr = [String]()
    var hWClass_idArr = [String]()
    var hw_detailsArr = [String]()
    var mark_statusArr = [String]()
    var hwSubject_idArr = [String]()
    var subject_nameArr = [String]()
    var hwClass_nameArr = [String]()
    var hwSec_nameArr = [String]()
    
// RemindersData
    var reminderIddArr = [String]()
    var reminderUser_idArr = [String]()
    var to_do_titleeArr = [String]()
    var to_do_dateArr = [String]()
    var to_do_descriptionArr = [String]()
    var remindersStatusArr = [String]()
    var created_byArr = [String]()
    var created_atArr = [String]()
    var updated_byArr = [String]()
    var updated_atArr = [String]()
    
    var academicMonthArr = [String]()
   
    var teachersDataArr = [TeachersDataList]()
    var teachersClassSubjectArr = [ClassSubjectData]()
    var studentsDetailsDataArr = [StudentDetailsData]()
    var examsDataArr = [ExamData]()
    var examsDetilsDataArr = [ExamDetailsData]()
    var hwDetailsArr = [HomeWorksData]()
    var remindersArr = [RemindersData]()
    var acadaamicMonthDataArr = [AdcademicMonthData]()
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var logoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupView ()
        self.hideKeyboardWhenTappedAround()
        context = appDelegate.persistentContainer.viewContext
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup()
    {
        let viewController = self
        let interactor = InstituteLoginInteractor()
        let presenter = InstituteLoginPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
   
    func setupView () {
        
        userName.attributedPlaceholder = NSAttributedString(string:NSLocalizedString("", comment: "Username"), attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray.withAlphaComponent(1)])
        password.attributedPlaceholder = NSAttributedString(string:NSLocalizedString("", comment: "Password"), attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray.withAlphaComponent(1)])
    }
    
    @IBAction func signInAction(_ sender: Any) {
        
        guard CheckValuesAreEmpty () else {
                   return
        }
        
        interactor?.fetchItems(request: InstituteLoginModel.Fetch.Request(institue_code :self.institute_code,userName:self.userName.text!,password:self.password.text!))
        MBProgressHUD.showAdded(to: self.view, animated: true)
        callAPILogin(userName:self.userName.text!,password:password.text!)
    }
  
    @IBAction func forgotPasswordAction(_ sender: Any) {
        
    }
    
    func CheckValuesAreEmpty () -> Bool{
        
        guard Reachability.isConnectedToNetwork() == true else {
              AlertController.shared.offlineAlert(targetVc: self, complition: {
                //Custom action code
             })
            return false
        }
        
        guard self.userName.text?.count != 0  else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: "username is empty", complition: {
                
              })
            return false
        }
        
        guard self.password.text?.count != 0  else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: "password is empty", complition: {
                    
              })
            return false
         }
          return true
     }
}
extension InstituteLoginVC {
    
    func successFetchedItems(viewModel: InstituteLoginModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        self.login_type = viewModel.user_type_name!
        UserDefaults.standard.set(login_type, forKey: UserDefaultsKey.user_login_type_Key.rawValue)
        GlobalVariables.shared.user_loginType = login_type

        self.user_id = viewModel.user_id!
        UserDefaults.standard.set(user_id, forKey: UserDefaultsKey.user_idkey.rawValue)
        GlobalVariables.shared.user_id = user_id

        self.user_type = viewModel.user_type!
        UserDefaults.standard.set(user_type, forKey: UserDefaultsKey.userTypeKey.rawValue)
        GlobalVariables.shared.user_type = user_type

        self.profilePic = viewModel.user_pic!
        UserDefaults.standard.set(profilePic, forKey: UserDefaultsKey.profile_picturekey.rawValue)
        GlobalVariables.shared.profilePic = profilePic

        self.name = viewModel.name!
        UserDefaults.standard.set(name, forKey: UserDefaultsKey.namekey.rawValue)
        GlobalVariables.shared.userName = name

        if login_type == "Admin" {
        self.performSegue(withIdentifier: "to_AdminDashboard", sender: self)
        }
        else if login_type == "Students" {
        self.performSegue(withIdentifier: "to_studentsDashboard", sender: self)
        }
        else if login_type == "Teachers" {
        self.performSegue(withIdentifier: "to_TeachersDashBoard", sender: self)
        }
    }

    func errorFetchingItems(viewModel: InstituteLoginModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "to_AdminDashboard")
        {
            _ = segue.destination as! UINavigationController
           
        }
        else if (segue.identifier == "to_studentsDashboard")
        {
            _ = segue.destination as! StudentsLoginProfileVC
           
        }
        else if (segue.identifier == "to_TeachersDashBoard")
        {
            _ = segue.destination as! UINavigationController
           
        }
    }
}
extension InstituteLoginVC {
    
    func callAPILogin (userName:String,password:String)
       {
           let parameters = ["username": userName,"password": password]
           MBProgressHUD.showAdded(to: self.view, animated: true)
           DispatchQueue.global().async
               {
                   do
                   {
                    try AFWrapper.requestPOSTURL(APIURL.base_URL + APIFunctionName.instituteLoginUrl, params: parameters, headers: nil, success: { [self]
                           (JSONResponse) -> Void in
                           MBProgressHUD.hide(for: self.view, animated: true)
                           print(JSONResponse)
                           let json = JSON(JSONResponse)
                                                
                           let status = json["status"].stringValue
                           if  status == "loggedIn"
                           {
                            let jsonArr:[JSON] = json["academic_month"].arrayValue
                            
                            if jsonArr.count > 0 {
                                
                                let stringArr:[String] = json["academic_month"].arrayValue.map { $0.stringValue}
                                
                                self.academicMonthArr = stringArr
                            }
                            print(academicMonthArr)
                            saveAcadamicMonthData(academic_month:academicMonthArr)
                            
                            let academic_marks = json["academic_marks"]["academic_marks"].stringValue
                            let externals = json["academic_marks"]["externals"].stringValue
                            
                            self.saveAcadamicMarksData(externals:academic_marks,academic_marks:externals)
                            
                               if json["teacherProfile"].count > 0 {
                                   
                                   for i in 0..<json["teacherProfile"].count {
                                       let teachers = TeachersDataList.init(json: json["teacherProfile"][i])
                                       self.teachersDataArr.append(teachers)

                                    let teacher_id = teachers.teacher_id
                                    let nationality = teachers.nationality
                                    let name = teachers.name
                                    let community = teachers.community
                                    let class_taken = teachers.class_taken
                                    let class_teacher = teachers.class_teacher
                                    let profile_pic = teachers.profile_pic
                                    let community_class = teachers.community_class
                                    let sec_email = teachers.sec_email
                                    let subject = teachers.subject
                                    let email = teachers.email
                                    let address = teachers.address
                                    let sex = teachers.sex
                                    let phone = teachers.phone
                                    let age = teachers.age
                                    let sec_phone = teachers.sec_phone
                                    let religion = teachers.religion
                                    let update_at = teachers.update_at
                                    self.save(name:name!,teacher_id:teacher_id!,sex:sex!,nationality:nationality!,age:age!,religion:religion!,community_class:community_class!,community:community!,address:address!,email:email!,phone:phone!,sec_email:sec_email!,sec_phone:sec_phone!,profile_pic:profile_pic!,update_at:update_at!,subject:subject!,class_taken:class_taken!,class_teacher:class_teacher!)
                                   }
                               }
                           }
                           
                        if json["classSubject"]["data"].count > 0 {
                            
                            for i in 0..<json["classSubject"]["data"].count {
                                let teachers = ClassSubjectData.init(json: json["classSubject"]["data"][i])
                                self.teachersClassSubjectArr.append(teachers)

                                let subject_name = teachers.subject_name
                                self.subNameArr.append(subject_name!)
                                
                                let class_master_id = teachers.class_master_id
                                self.class_master_idArr.append(class_master_id!)
                                
                                let subject_id = teachers.subject_id
                                self.subject_idArr.append(subject_id!)
                                
                                let sec_name = teachers.sec_name
                                self.sec_nameArr.append(sec_name!)
                                
                                let class_name = teachers.class_name
                                self.class_nameArr.append(class_name!)
                                
                                let teacher_id = teachers.teacher_id
                                self.teacher_idArr.append(teacher_id!)
                                
                             print("karan\(subject_name!)")
                            }
                        }
                        saveClassSubject(subject_name:self.subNameArr,class_master_id:self.class_master_idArr,subject_id:self.subject_idArr,sec_name:self.sec_nameArr,class_name:self.class_nameArr,teacher_id:self.teacher_idArr)
                        
                        
                        if json["studDetails"]["data"].count > 0 {
                            
                            for i in 0..<json["studDetails"]["data"].count {
                                let students = StudentDetailsData.init(json: json["studDetails"]["data"][i])
                                self.studentsDetailsDataArr.append(students)
                                
                                let enroll_id = students.enroll_id
                                self.enroll_idArr.append(enroll_id!)
                                
                                let status = students.status
                                self.statusArr.append(status!)
                                
                                let admission_id = students.admission_id
                                self.admission_idArr.append(admission_id!)
                                
                                let class_id = students.class_id
                                self.class_idArr.append(class_id!)
                                
                                let name = students.name
                                self.studentnameArr.append(name!)
                                
                                let sex = students.sex
                                self.sexArr.append(sex!)
                                
                                let pref_language = students.pref_language
                                self.pref_languageArr.append(pref_language!)
                                
                                let class_section = students.class_section
                                self.class_sectionArr.append(class_section!)
                            }
                        }
                        saveStudentDetailsData(enroll_id:self.enroll_idArr,status:self.statusArr,admission_id:self.admission_idArr,class_id:self.class_idArr,name:self.studentnameArr,sex:self.sexArr,pref_language:self.pref_languageArr,class_section:self.class_sectionArr)
                        
                        if json["Exams"]["data"].count > 0 {
                            
                            for i in 0..<json["Exams"]["data"].count {
                                let examDetails = ExamData.init(json: json["Exams"]["data"][i])
                                self.examsDataArr.append(examDetails)
                                
                                let exam_id = examDetails.exam_id
                                self.exam_idArr.append(exam_id!)
                                
                                let exam_name = examDetails.exam_name
                                self.exam_nameArr.append(exam_name!)
                                
                                let is_internal_external = examDetails.is_internal_external
                                self.is_internal_externalArr.append(is_internal_external!)
                                
                                let classmaster_id = examDetails.classmaster_id
                                self.classmaster_idArr.append(classmaster_id!)
                                
                                let sec_name = examDetails.sec_name
                                self.sec_nameExamsArr.append(sec_name!)
                                
                                let class_name = examDetails.class_name
                                self.class_nameExamsArr.append(class_name!)
                                
                                let Fromdate = examDetails.Fromdate
                                self.FromdateArr.append(Fromdate!)
                                
                                let Todate = examDetails.Todate
                                self.TodateArr.append(Todate!)
                                
                                let MarkStatus = examDetails.MarkStatus
                                self.MarkStatusArr.append(MarkStatus!)
                            }
                            self.saveExamsData(exam_id:self.exam_idArr,exam_name:self.exam_nameArr,is_internal_external:self.is_internal_externalArr,classmaster_id:self.classmaster_idArr,sec_name:self.sec_nameExamsArr,class_name:self.class_nameExamsArr,Fromdate:self.FromdateArr,Todate:self.TodateArr,MarkStatus:self.MarkStatusArr)
                            
                        }
                        
                        if json["examDetails"]["data"].count > 0 {
                            
                            for i in 0..<json["examDetails"]["data"].count {
                                let examDetails = ExamDetailsData.init(json: json["examDetails"]["data"][i])
                                self.examsDetilsDataArr.append(examDetails)
                                
                                let exam_id = examDetails.exam_id
                                self.exam_idDetailsArr.append(exam_id!)
                                
                                let exam_name = examDetails.exam_name
                                self.exam_nameDetailsArr.append(exam_name!)
                                
                                let subject_name = examDetails.subject_name
                                self.subject_nameDetailsArr.append(subject_name!)
                                
                                let subject_id = examDetails.subject_id
                                self.subject_idDetailsdArr.append(subject_id!)
                                
                                let exam_date = examDetails.exam_date
                                self.exam_dateDetailsArr.append(exam_date!)
                                
                                let times = examDetails.times
                                self.timesDetailsArr.append(times!)
                                
                                let is_internal_external = examDetails.is_internal_external
                                self.is_internal_externalDetailsArr.append(is_internal_external!)
                                
                                let subject_total = examDetails.subject_total
                                self.subject_totalDetailsArr.append(subject_total!)
                                
                                let internal_mark = examDetails.internal_mark
                                self.internal_markDetailsArr.append(internal_mark!)
                        
                                let external_mark = examDetails.external_mark
                                self.external_markDetailsArr.append(external_mark!)
                                
                                let classmaster_id = examDetails.classmaster_id
                                self.classmaster_idDetailsArr.append(classmaster_id!)
                                
                                let class_name = examDetails.class_name
                                self.class_nameDetailsArr.append(class_name!)
                                
                                let sec_name = examDetails.sec_name
                                self.sec_nameDetailsArr.append(sec_name!)
                                
                            }
                         

                            self.saveExamsDetailsData(exam_id:self.exam_idDetailsArr,exam_name:self.exam_nameDetailsArr,subject_name:self.subject_nameDetailsArr,subject_id:self.subject_idDetailsdArr,exam_date:self.exam_dateDetailsArr,times:self.timesDetailsArr,is_internal_external:self.is_internal_externalDetailsArr,subject_total:self.subject_totalDetailsArr,internal_mark:self.internal_markDetailsArr,external_mark:self.external_markDetailsArr,classmaster_id:self.classmaster_idDetailsArr,class_name:self.class_nameDetailsArr, sec_name:self.sec_nameDetailsArr)
                      
                        }
                       
                        if json["homeWork"]["data"].count > 0 {
                            
                            for i in 0..<json["homeWork"]["data"].count {
                                let HWDetails = HomeWorksData.init(json: json["homeWork"]["data"][i])
                                self.hwDetailsArr.append(HWDetails)
                                
                                let hw_id = HWDetails.hw_id
                                self.hw_idArr.append(hw_id!)
                                
                                let hw_type = HWDetails.hw_type
                                self.hw_idArr.append(hw_type!)
                                
                                let title = HWDetails.title
                                self.titleArr.append(title!)
                                
                                let test_date = HWDetails.test_date
                                self.test_datedArr.append(test_date!)
                                
                                let due_date = HWDetails.due_date
                                self.due_dateArr.append(due_date!)
                                
                                let times = HWDetails.times
                                self.timesArr.append(times!)
                                
                                let class_id = HWDetails.class_id
                                self.hWClass_idArr.append(class_id!)
                                
                                let hw_details = HWDetails.hw_details
                                self.hw_detailsArr.append(hw_details!)
                                
                                let mark_status = HWDetails.mark_status
                                self.mark_statusArr.append(mark_status!)
                        
                                let subject_id = HWDetails.subject_id
                                self.hwSubject_idArr.append(subject_id!)
                                
                                let subject_name = HWDetails.subject_name
                                self.subject_nameArr.append(subject_name!)
                                
                                let class_name = HWDetails.class_name
                                self.hwClass_nameArr.append(class_name!)
                                
                                let sec_name = HWDetails.sec_name
                                self.hwSec_nameArr.append(sec_name!)
                            }
                            saveHWDetailsData(hw_id:hw_idArr,hw_type:hw_typeArr,title:titleArr,test_date:test_datedArr,due_date:due_dateArr,times:timesArr,class_id:hWClass_idArr,hw_details:hw_detailsArr,mark_status:mark_statusArr,subject_id:hwSubject_idArr,subject_name:subject_nameArr,class_name:hwClass_nameArr,sec_name:hwSec_nameArr)
                            
                            }
                        
                        if json["Reminders"]["data"].count > 0 {
                            
                            for i in 0..<json["Reminders"]["data"].count {
                                let remainderList = RemindersData.init(json: json["Reminders"]["data"][i])
                                self.remindersArr.append(remainderList)
                                
                                let id = remainderList.id
                                self.reminderIddArr.append(id!)
                                
                                let user_id = remainderList.user_id
                                self.reminderUser_idArr.append(user_id!)
                                
                                let to_do_date = remainderList.to_do_date
                                self.to_do_dateArr.append(to_do_date!)
                                
                                let to_do_title = remainderList.to_do_title
                                self.to_do_titleeArr.append(to_do_title!)
                                
                                let to_do_description = remainderList.to_do_description
                                self.to_do_descriptionArr.append(to_do_description!)
                                
                                let status = remainderList.status
                                self.remindersStatusArr.append(status!)
                                
                                let created_by = remainderList.created_by
                                self.created_byArr.append(created_by!)
                                
                                let created_at = remainderList.created_at
                                self.created_atArr.append(created_at!)
                                
                                let updated_by = remainderList.updated_by
                                self.updated_byArr.append(updated_by!)
                        
                                let updated_at = remainderList.updated_at
                                self.updated_atArr.append(updated_at!)

                            }
                            saveRemindersDatasData(id:reminderIddArr,user_id:reminderUser_idArr,to_do_date:to_do_dateArr,to_do_title:to_do_titleeArr,to_do_description:to_do_descriptionArr,status:remindersStatusArr,created_by:created_byArr,created_at:created_atArr,updated_by:updated_byArr,updated_at:updated_atArr)
//
                            }
                  
                      
                       }) {
                           (error) -> Void in
                           print(error)
                       }
                   }
                   catch
                   {
                       print("Unable to load data: \(error)")
                   }
            }
      }
    
    func save(name:String,teacher_id:String,sex:String,nationality:String,age:String,religion:String,community_class:String,community:String,address:String,email:String,phone:String,sec_email:String,sec_phone:String,profile_pic:String,update_at:String,subject:String,class_taken:String,class_teacher:String) {
        
        let teacherProfile = NSEntityDescription.insertNewObject(forEntityName: "TeacherProfile", into: context!)
        
        teacherProfile.setValue(name, forKey: "name")
        teacherProfile.setValue(teacher_id, forKey: "teacher_id")
        teacherProfile.setValue(sex, forKey: "sex")
        teacherProfile.setValue(age, forKey: "age")
        teacherProfile.setValue(nationality, forKey: "nationality")
        teacherProfile.setValue(religion, forKey: "religion")
        teacherProfile.setValue(community_class, forKey: "community_class")
        teacherProfile.setValue(community, forKey: "community")
        teacherProfile.setValue(address, forKey: "address")
        teacherProfile.setValue(email, forKey: "email")
        teacherProfile.setValue(phone, forKey: "phone")
        teacherProfile.setValue(sec_email, forKey: "sec_email")
        teacherProfile.setValue(sec_phone, forKey: "sec_phone")
        teacherProfile.setValue(profile_pic, forKey: "profile_pic")
        teacherProfile.setValue(update_at, forKey: "update_at")
        teacherProfile.setValue(subject, forKey: "subject")
        teacherProfile.setValue(class_taken, forKey: "class_taken")
        teacherProfile.setValue(class_teacher, forKey: "class_teacher")
        
        do {
            try context?.save()
                print("suucess")
            }
        catch {
            print("error")
        }
    }
    
    func saveClassSubject(subject_name:[String],class_master_id:[String],subject_id:[String],sec_name:[String],class_name:[String],teacher_id:[String]) {
        
        let teacherProfile = NSEntityDescription.insertNewObject(forEntityName: "ClassSubjects", into: context!)
        
        teacherProfile.setValue(subNameArr, forKey: "subject_name")
        teacherProfile.setValue(class_master_idArr, forKey: "class_master_id")
        teacherProfile.setValue(subject_idArr, forKey: "subject_id")
        teacherProfile.setValue(class_nameArr, forKey: "class_name")
        teacherProfile.setValue(sec_nameArr, forKey: "sec_name")
        teacherProfile.setValue(teacher_idArr, forKey: "teacher_id")
        
        do {
            try context?.save()
                print("suucess")
            }
        catch {
            print("error")
        }
    }
    
    func saveStudentDetailsData(enroll_id:[String],status:[String],admission_id:[String],class_id:[String],name:[String],sex:[String],pref_language:[String],class_section:[String]) {
        
        let teacherProfile = NSEntityDescription.insertNewObject(forEntityName: "StudentDetails", into: context!)
        
        teacherProfile.setValue(enroll_idArr, forKey: "enroll_id")
        teacherProfile.setValue(statusArr, forKey: "status")
        teacherProfile.setValue(admission_idArr, forKey: "admission_id")
        teacherProfile.setValue(class_idArr, forKey: "class_id")
        teacherProfile.setValue(studentnameArr, forKey: "name")
        teacherProfile.setValue(sexArr, forKey: "sex")
        teacherProfile.setValue(pref_languageArr, forKey: "pref_language")
        teacherProfile.setValue(class_sectionArr, forKey: "class_section")
        teacherProfile.setValue(attendanceStatus, forKey: "attendanceStatus")
        
        do {
            try context?.save()
                print("suucess")
            }
        catch {
            print("error")
        }
    }
  
    func saveExamsData(exam_id:[String],exam_name:[String],is_internal_external:[String],classmaster_id:[String],sec_name:[String],class_name:[String],Fromdate:[String],Todate:[String],MarkStatus:[String]) {
        
        let teacherProfile = NSEntityDescription.insertNewObject(forEntityName: "ExamsDatas", into: context!)
        
        teacherProfile.setValue(exam_idArr, forKey: "exam_id")
        teacherProfile.setValue(exam_nameArr, forKey: "exam_name")
        teacherProfile.setValue(is_internal_externalArr, forKey: "is_internal_external")
        teacherProfile.setValue(classmaster_idArr, forKey: "classmaster_id")
        teacherProfile.setValue(sec_nameExamsArr, forKey: "sec_name")
        teacherProfile.setValue(class_nameExamsArr, forKey: "class_name")
        teacherProfile.setValue(FromdateArr, forKey: "fromdate")
        teacherProfile.setValue(TodateArr, forKey: "todate")
        teacherProfile.setValue(MarkStatusArr, forKey: "markStatus")
        
        do {
            try context?.save()
                print("suucess")
            }
        catch {
            print("error")
        }
    }
 
   
    func saveExamsDetailsData(exam_id:[String],exam_name:[String],subject_name:[String],subject_id:[String],exam_date:[String],times:[String],is_internal_external:[String],subject_total:[String],internal_mark:[String],external_mark:[String],classmaster_id:[String],class_name:[String],sec_name:[String]) {
        
        let teacherProfile = NSEntityDescription.insertNewObject(forEntityName: "ExamDetails", into: context!)
        
        teacherProfile.setValue(exam_idDetailsArr, forKey: "exam_id")
        teacherProfile.setValue(exam_nameDetailsArr, forKey: "exam_name")
        teacherProfile.setValue(subject_nameDetailsArr, forKey: "subject_name")
        teacherProfile.setValue(subject_idDetailsdArr, forKey: "subject_id")
        teacherProfile.setValue(exam_dateDetailsArr, forKey: "exam_date")
        teacherProfile.setValue(timesDetailsArr, forKey: "times")
        teacherProfile.setValue(is_internal_externalDetailsArr, forKey: "is_internal_external")
        teacherProfile.setValue(subject_totalDetailsArr, forKey: "subject_total")
        teacherProfile.setValue(internal_markDetailsArr, forKey: "internal_mark")
        teacherProfile.setValue(external_markDetailsArr, forKey: "external_mark")
        teacherProfile.setValue(classmaster_idDetailsArr, forKey: "classmaster_id")
        teacherProfile.setValue(class_nameDetailsArr, forKey: "class_name")
        teacherProfile.setValue(sec_nameDetailsArr, forKey: "sec_name")
        
        do {
            try context?.save()
                print(" suucess")
            }
        catch {
            print("error")
        }
    }
    
    func saveHWDetailsData(hw_id:[String],hw_type:[String],title:[String],test_date:[String],due_date:[String],times:[String],class_id:[String],hw_details:[String],mark_status:[String],subject_id:[String],subject_name:[String],class_name:[String],sec_name:[String]){
        
        let teacherProfile = NSEntityDescription.insertNewObject(forEntityName: "HomeWorkDetails", into: context!)
        
        teacherProfile.setValue(hw_id, forKey: "hw_id")
        teacherProfile.setValue(hw_type, forKey: "hw_type")
        teacherProfile.setValue(title, forKey: "title")
        teacherProfile.setValue(test_date, forKey: "test_date")
        teacherProfile.setValue(due_date, forKey: "due_date")
        teacherProfile.setValue(times, forKey: "times")
        teacherProfile.setValue(class_id, forKey: "class_id")
        teacherProfile.setValue(hw_details, forKey: "hw_details")
        teacherProfile.setValue(mark_status, forKey: "mark_status")
        teacherProfile.setValue(subject_id, forKey: "subject_id")
        teacherProfile.setValue(subject_name, forKey: "subject_name")
        teacherProfile.setValue(class_name, forKey: "class_name")
        teacherProfile.setValue(sec_name, forKey: "sec_name")
        
        do {
            try context?.save()
                print("suucess")
            }
        catch {
            print("error")
        }
    }
    
    func saveRemindersDatasData(id:[String],user_id:[String],to_do_date:[String],to_do_title:[String],to_do_description:[String],status:[String],created_by:[String],created_at:[String],updated_by:[String],updated_at:[String]){
        
        let teacherProfile = NSEntityDescription.insertNewObject(forEntityName: "Reminders", into: context!)
        
        teacherProfile.setValue(id, forKey: "id")
        teacherProfile.setValue(user_id, forKey: "user_id")
        teacherProfile.setValue(to_do_date, forKey: "to_do_date")
        teacherProfile.setValue(to_do_title, forKey: "to_do_title")
        teacherProfile.setValue(to_do_description, forKey: "to_do_description")
        teacherProfile.setValue(status, forKey: "status")
        teacherProfile.setValue(created_by, forKey: "created_by")
        teacherProfile.setValue(created_at, forKey: "created_at")
        teacherProfile.setValue(updated_by, forKey: "updated_by")
        teacherProfile.setValue(updated_at, forKey: "updated_at")
   
        do {
            try context?.save()
                print(" suucess")
            }
        catch {
            print("error")
        }
    }
    
    func saveAcadamicMonthData(academic_month:[String]){
        
        let teacherProfile = NSEntityDescription.insertNewObject(forEntityName: "AcademicMonths", into: context!)
        
        teacherProfile.setValue(academicMonthArr, forKey: "academic_month")
       
        do {
            try context?.save()
                print(" suucess")
            }
        catch {
            print("error")
        }
    }
    
    func saveAcadamicMarksData(externals:String,academic_marks:String){
        
        let teacherProfile = NSEntityDescription.insertNewObject(forEntityName: "AcademicMarks", into: context!)
        
        teacherProfile.setValue(academic_marks, forKey: "academic_marks")
        teacherProfile.setValue(externals, forKey: "externals")
   
        do {
            try context?.save()
                print(" suucess")
            }
        catch {
            print("error")
        }
    }
}

