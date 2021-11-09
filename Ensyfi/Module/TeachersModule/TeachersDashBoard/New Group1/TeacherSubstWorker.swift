//
//  TeacherSubstWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/10/21.
//

import Foundation
import UIKit

typealias TeacherSubstutionListresponseHandler = (_ response:TeacherSubstutionListModel.Fetch.Response) ->()

class TeacherSubstutionListWorker{
    
   var respData = [TeacherSubstutionListModels]()
    func fetch(user_id:String,onSuccess successCallback:(TeacherSubstutionListresponseHandler)?,onFailure failureCallback: @escaping(TeacherSubstutionListresponseHandler)) {
       let manager = TeachersAPIManager()
       manager.callAPITeacherSubstutionList(
        user_id:user_id,onSuccess: { (resp)  in
               successCallback?(TeacherSubstutionListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(TeacherSubstutionListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}
