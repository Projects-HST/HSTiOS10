//
//  SyncAssignmentsPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 10/11/21.
//

import Foundation

protocol SyncAssignmentPresentationLogic
{
  func presentFetchResults(resp: SyncAssignmentModel.Fetch.Response)
}

class SyncAssignmentPresenter: SyncAssignmentPresentationLogic
{
  weak var viewController2: SyncAssignmentDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: SyncAssignmentModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = SyncAssignmentModel.Fetch.ViewModel(status: resp.testObj?.status,msg: resp.testObj?.msg,isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController2?.errorFetchingItems(viewModel: viewModel)
        }
        else{
            viewController2?.successFetchedItems(viewModel: viewModel)
        }
    }
}
