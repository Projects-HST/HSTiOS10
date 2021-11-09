//
//  TeacherSubstInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/10/21.
//

import Foundation
import UIKit

protocol TeacherSubstutionListBusinessLogic
{
    func fetchItems(request: TeacherSubstutionListModel.Fetch.Request)
}
protocol TeacherSubstutionListDataStore
{
  
}

class TeacherSubstutionListInteractor:TeacherSubstutionListBusinessLogic,TeacherSubstutionListDataStore
{
    var presenter: TeacherSubstutionListPresentationLogic?
    var worker:TeacherSubstutionListWorker?
    var respData = [TeacherSubstutionListModels]()
    func fetchItems(request:TeacherSubstutionListModel.Fetch.Request) {
        if request.user_id == nil {
        self.presenter?.presentFetchResults(resp: TeacherSubstutionListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy"))
        }
        worker = TeacherSubstutionListWorker()
        worker!.fetch(user_id:request.user_id!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: TeacherSubstutionListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp:TeacherSubstutionListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

