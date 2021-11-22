//
//  AddOnDutyWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 18/11/21.
//

import Foundation
import UIKit

typealias AddONDutyresponseHandler = (_ response:AddONDutyModel.Fetch.Response) ->()

class AddONDutyWorker{

   func fetch(user_id:String,dynamic_db:String,user_type:String,od_for:String,from_date:String,to_date:String,created_by:String,created_at:String,status:String,notes:String,onSuccess successCallback:(AddONDutyresponseHandler)?,onFailure failureCallback: @escaping(AddONDutyresponseHandler)) {
       let manager = TeachersAPIManager()
       manager.callAPIAddONDuty(
        user_id:user_id,dynamic_db:dynamic_db, user_type:user_type,od_for:od_for, from_date:from_date,to_date:to_date,created_by:created_by, created_at:created_at,status:status,notes:notes, onSuccess: { (resp)  in
               successCallback?(AddONDutyModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(AddONDutyModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}
