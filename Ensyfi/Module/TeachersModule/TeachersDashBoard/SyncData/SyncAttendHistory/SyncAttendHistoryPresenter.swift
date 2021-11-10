//
//  SyncAttendHistoryPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 09/11/21.
//

import Foundation
import CoreData

protocol SyncAttendanceHistoryPresentationLogic
{
  func presentFetchResults(resp: SyncAttendanceHistoryModel.Fetch.Response)
}

class SyncAttendanceHistoryPresenter: SyncAttendanceHistoryPresentationLogic
{
  weak var viewController1: SyncAttendanceHistoryDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: SyncAttendanceHistoryModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = SyncAttendanceHistoryModel.Fetch.ViewModel(status: resp.testObj?.status,msg: resp.testObj?.msg,isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController1?.errorFetchingItems(viewModel: viewModel)
        }
        else{
            viewController1?.successFetchedItems(viewModel: viewModel)
        }
    }
}
