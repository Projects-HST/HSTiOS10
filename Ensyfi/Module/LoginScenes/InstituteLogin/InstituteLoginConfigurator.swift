//
//  InstituteLoginConfigurator.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/09/21.
//

import Foundation
import UIKit

protocol InstituteLoginDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: InstituteLoginModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: InstituteLoginModel.Fetch.ViewModel)
}

protocol GetTeacherDetailsDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: GetTeacherDetailsModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: GetTeacherDetailsModel.Fetch.ViewModel)
}

extension InstituteLoginVC {
        
   
    
}
//func fetch(){
//
//    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "TeacherProfile")
//
//    request.returnsObjectsAsFaults = false
//
//    do {
//        let results = try context?.fetch(request)
//
//        let count = results?.count
//
//        if 0 < count! {
//
//            for result in results as! [NSManagedObject] {
//            if let name = result.value(forKey:"name") as? String {
//                print("name == \(name)")
//            }
//          }
//       }
//    } catch {
//    
//    }
//}
//func fetchData(){
//
//    subjectArr.removeAll()
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ClassSubjects")
//
//    do {
//        let results = try context.fetch(fetchRequest)
//        let  classSubData = results as! [ClassSubjects]
//
//        for data in classSubData {
//            print(data.subject_name!)
//            subjectArr = data.subject_name as! [String]
//            print(subjectArr)
//        }
//
//
//    }catch let err as NSError {
//        print(err.debugDescription)
//    }
//}


//    func fetch(){
//
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ClassSubjects")
//
//        request.returnsObjectsAsFaults = false
//
//        do {
//            let results = try context?.fetch(request)
//
////            let count = results?.count
//
////            if count! > 0 {
//
//                for result in results as! [NSManagedObject] {
//                    if let class_name = result.value(forKey:"class_name") as? String {
//                        print("class_name == \(class_name)")
//                    }
//                    if let sec_name = result.value(forKey:"sec_name") as? String {
//                        print("sec_name == \(sec_name)")
//                        class_name = sec_name
//                    }
////                    if let phone = result.value(forKey:"phone") as? String {
////                        print("name == \(phone)")
////                    }
////              }
//                print(class_name)
//           }
//        } catch {
//
//        }
//    }
//
//
//func fetchData(){
//
//    subjectArr.removeAll()
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AcademicMonth")
//
//    do {
//        let results = try context.fetch(fetchRequest)
//        let  classSubData = results as! [AcademicMonth]
//
//        for data in classSubData {
//            subjectArr = data.academic_month as! [String]
//            print(subjectArr)
//
////                classArr = data.class_name as! [String]
////                print(classArr)
//        }
//    } catch let err as NSError {
//        print(err.debugDescription)
//    }
//}




//                        if json["parentProfile"]["motherProfile"].count > 0 {
//
//                            for i in 0..<json["parentProfile"]["motherProfile"].count {
//                                let studentprofile = StudentsMotherDetails.init(json: json["parentProfile"]["motherProfile"][i])
//                                let id  = ["parentProfile"]["motherProfile"][""].stringValue
//                                let name = studentprofile.name
//                                let occupation = studentprofile.occupation
//                                let income = studentprofile.income
//                                let home_address = studentprofile.home_address
//                                let email = studentprofile.email
//                                let mobile = studentprofile.mobile
//                                let home_phone = studentprofile.home_phone
//                                let office_phone = studentprofile.office_phone
//                                let relationship = studentprofile.relationship
//                                let user_pic = studentprofile.user_pic
//
//                                saveStudentMotherProfileData(id:id!,name:name!,occupation:occupation!,income:income!,home_address:home_address!,email:email!,mobile:mobile!,home_phone:home_phone!,office_phone:office_phone!,relationship:relationship!,user_pic:user_pic!)
//
//                             }
//                        }
//                        if json["parentProfile"]["fatherProfile"].count > 0 {
//
//                            for i in 0..<json["parentProfile"]["fatherProfile"].count {
//                                let studentprofile = StudentsFatherDetails.init(json: json["parentProfile"]["fatherProfile"][i])
//                                let id = studentprofile.id
//                                let name = studentprofile.name
//                                let occupation = studentprofile.occupation
//                                let income = studentprofile.income
//                                let home_address = studentprofile.home_address
//                                let email = studentprofile.email
//                                let mobile = studentprofile.mobile
//                                let home_phone = studentprofile.home_phone
//                                let office_phone = studentprofile.office_phone
//                                let relationship = studentprofile.relationship
//                                let user_pic = studentprofile.user_pic
//
//                                saveStudentFatherProfileData(id:id!,name:name! ,occupation:occupation!,income:income!,home_address:home_address!,email:email!,mobile:mobile!,home_phone:home_phone!,office_phone:office_phone!,relationship:relationship!,user_pic:user_pic!)
//
//                             }
//                        }
//                        if json["parentProfile"]["guardianProfile"].count > 0 {
//
//                            for i in 0..<json["parentProfile"]["guardianProfile"].count {
//                                let studentprofile = StudentsGuardianDetails.init(json: json["parentProfile"]["guardianProfile"][i])
//                                let id = studentprofile.id
//                                let name = studentprofile.name
//                                let occupation = studentprofile.occupation
//                                let income = studentprofile.income
//                                let home_address = studentprofile.home_address
//                                let email = studentprofile.email
//                                let mobile = studentprofile.mobile
//                                let home_phone = studentprofile.home_phone
//                                let office_phone = studentprofile.office_phone
//                                let relationship = studentprofile.relationship
//                                let user_pic = studentprofile.user_pic
//
//                                saveStudentGuardianProfileData(id:id!,name:name! ,occupation:occupation!,income:income!,home_address:home_address!,email:email!,mobile:mobile!,home_phone:home_phone!,office_phone:office_phone!,relationship:relationship!,user_pic:user_pic!)
//
//                             }
//                        }
