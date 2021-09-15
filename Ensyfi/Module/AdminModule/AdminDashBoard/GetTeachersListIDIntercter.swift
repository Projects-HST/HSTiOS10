//
//  GetTeachersListIDIntercter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 14/09/21.
//

import Foundation
import UIKit

protocol TeacherListIDBusinessLogic
{
    func fetchItems(request:TeacherListIDModel.Fetch.Request)
}
protocol TeacherListIDDataStore
{
  
}

class TeacherListIDInteractor:TeacherListIDBusinessLogic,TeacherListIDDataStore
{
    
    var presenter: TeacherListIDPresentationLogic?
    var worker: TeacherListIDWorker?
    var respData = [TeacherListIDModels]()
    func fetchItems(request: TeacherListIDModel.Fetch.Request) {
        if request.user_id == nil {
        self.presenter?.presentFetchResults(resp: TeacherListIDModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = TeacherListIDWorker()
        worker!.fetch(user_id:request.user_id!,user_type:request.user_type!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: TeacherListIDModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: TeacherListIDModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
