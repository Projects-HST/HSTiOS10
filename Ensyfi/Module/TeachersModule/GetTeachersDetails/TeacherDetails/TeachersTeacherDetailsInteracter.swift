//
//  TeachersTeacherDetails.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/09/21.
//

import Foundation
import UIKit

protocol GetTeacherDetailsBusinessLogic
{
    func fetchItems(request: GetTeacherDetailsModel.Fetch.Request)
}
protocol GetTeacherDetailsDataStore
{
  
}

class GetTeacherDetailsInteractor: GetTeacherDetailsBusinessLogic, GetTeacherDetailsDataStore
{
    
    var presenter1: GetTeacherDetailsPresentationLogic?
    var worker: GetTeacherDetailsWorker?
    var respData = [GetTeacherDetailsModels]()
    func fetchItems(request: GetTeacherDetailsModel.Fetch.Request) {
        if request.userName == nil {
        self.presenter1?.presentFetchResults(resp: GetTeacherDetailsModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = GetTeacherDetailsWorker()
        worker!.fetch(institue_code:request.institue_code!,userName:request.userName!,password:request.password!, onSuccess: { (resp) in
            self.presenter1?.presentFetchResults(resp: GetTeacherDetailsModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter1?.presentFetchResults(resp: GetTeacherDetailsModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
