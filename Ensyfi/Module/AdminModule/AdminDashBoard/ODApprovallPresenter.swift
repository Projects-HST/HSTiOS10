//
//  ODApprovallPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 08/09/21.
//

import Foundation

protocol ODApprovalPresentationLogic
{
  func presentFetchResults(resp: ODApprovalModel.Fetch.Response)
}

class ODApprovalPresenter: ODApprovalPresentationLogic
{
  weak var viewController: ODApprovalDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: ODApprovalModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = ODApprovalModel.Fetch.ViewModel(status: resp.testObj?.status,msg: resp.testObj?.msg,isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController?.successFetchedItems(viewModel: viewModel)
        }
    }
}
