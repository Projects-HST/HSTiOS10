//
//  ClassForTeacherListInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//

import Foundation
import UIKit

protocol ClassForTeacherListBusinessLogic
{
    func fetchItems(request: ClassForTeacherListModel.Fetch.Request)
}
protocol ClassForTeacherListDataStore
{
  
}

class ClassForTeacherListInteractor: ClassForTeacherListBusinessLogic, ClassForTeacherListDataStore
{
    
    var presenter3: ClassForTeacherListPresentationLogic?
    var worker: ClassForTeacherListWorker?
    var respData = [ClassForTeacherListModels]()
    func fetchItems(request: ClassForTeacherListModel.Fetch.Request) {
        if request.class_id == nil {
        self.presenter3?.presentFetchResults(resp: ClassForTeacherListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = ClassForTeacherListWorker()
        worker!.fetch(class_id:request.class_id!,section_id:request.section_id!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter3?.presentFetchResults(resp: ClassForTeacherListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter3?.presentFetchResults(resp: ClassForTeacherListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
