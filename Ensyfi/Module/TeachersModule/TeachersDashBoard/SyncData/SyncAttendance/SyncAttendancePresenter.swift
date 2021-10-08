//
//  SyncAttendancePresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 06/10/21.
//

import Foundation
import CoreData

protocol SyncAttendancePresentationLogic
{
  func presentFetchResults(resp: SyncAttendanceModel.Fetch.Response)
}

class SyncAttendancePresenter: SyncAttendancePresentationLogic
{
  weak var viewController: SyncAttendanceDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: SyncAttendanceModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = SyncAttendanceModel.Fetch.ViewModel(status: resp.testObj?.status,msg: resp.testObj?.msg,isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController?.errorFetchingItems(viewModel: viewModel)
        }
        else{
            viewController?.successFetchedItems(viewModel: viewModel)
        }
    }
}
//
//@objc(ClassAttenadance)
//
//extension ClassAttenadance {
//
//    @NSManaged var id: AnyObject!
//}
