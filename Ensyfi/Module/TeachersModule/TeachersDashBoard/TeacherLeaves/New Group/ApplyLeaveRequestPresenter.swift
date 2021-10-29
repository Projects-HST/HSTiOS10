//
//  ApplyLeaveRequestPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/10/21.
//

import Foundation
import CoreData

protocol ApplyLeaveRequestPresentationLogic
{
  func presentFetchResults(resp:ApplyLeaveRequestModel.Fetch.Response)
}

class ApplyLeaveRequestPresenter: ApplyLeaveRequestPresentationLogic
{
  weak var viewController1: ApplyLeaveRequestDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:ApplyLeaveRequestModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = ApplyLeaveRequestModel.Fetch.ViewModel(status: resp.testObj?.status,msg: resp.testObj?.msg,isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController1?.errorFetchingItems(viewModel: viewModel)
        }
        else{
            viewController1?.successFetchedItems(viewModel: viewModel)
        }
    }
}
