//
//  SyncC_TestMarksInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 09/11/21.
//

import Foundation

protocol SyncCTestMarksBusinessLogic
{
    func fetchItems(request:SyncCTestMarksModel.Fetch.Request)
}
protocol SyncCTestMarksDataStore
{
  
}

class SyncCTestMarksInteractor:SyncCTestMarksBusinessLogic,SyncCTestMarksDataStore
{

    var presenter3:SyncCTestMarksPresentationLogic?
    var worker:SyncCTestMarksWorker?
 
    func fetchItems(request: SyncCTestMarksModel.Fetch.Request) {
        if request.hw_masterid == nil {
           self.presenter3?.presentFetchResults(resp: SyncCTestMarksModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = SyncCTestMarksWorker()
        worker!.fetch(hw_masterid:request.hw_masterid!, student_id:request.student_id!,marks:request.marks!, remarks:request.remarks!, created_by:request.created_by!,created_at:request.created_at!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter3?.presentFetchResults(resp: SyncCTestMarksModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter3?.presentFetchResults(resp: SyncCTestMarksModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

