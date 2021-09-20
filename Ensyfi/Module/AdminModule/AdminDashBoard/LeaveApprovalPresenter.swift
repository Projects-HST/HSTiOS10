//
//  LeaveApprovalPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 20/09/21.
//

import Foundation

protocol LeaveApprovalPresentationLogic
{
  func presentFetchResults(resp: LeaveApprovalModel.Fetch.Response)
}

class LeaveApprovalPresenter: LeaveApprovalPresentationLogic
{
  weak var viewController:LeaveApprovalDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: LeaveApprovalModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = LeaveApprovalModel.Fetch.ViewModel(status: resp.testObj?.status,msg: resp.testObj?.msg,isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController?.successFetchedItems(viewModel: viewModel)
        }
    }
}
