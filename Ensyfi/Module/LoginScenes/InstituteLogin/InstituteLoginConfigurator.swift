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
