//
//  TeachersTeacherDetailWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/09/21.
//


import Foundation
import UIKit

typealias GetTeacherDetailsresponseHandler = (_ response:GetTeacherDetailsModel.Fetch.Response) ->()

class GetTeacherDetailsWorker{
    
   var respData = [GetTeacherDetailsModels]()
   func fetch(institue_code:String,userName:String,password:String, onSuccess successCallback:(GetTeacherDetailsresponseHandler)?,onFailure failureCallback: @escaping(GetTeacherDetailsresponseHandler)) {
       let manager = TeachersAPIManager()
       manager.callAPIGetTeacherDetails(
        institue_code:institue_code,userName:userName,password:password, onSuccess: { (resp)  in
               successCallback?(GetTeacherDetailsModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(GetTeacherDetailsModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}
