//
//  ForgotPswdPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 23/08/21.
//

import Foundation

protocol ForgotPasswordPresentationLogic
{
  func presentFetchResults(resp: ForgotPasswordModel.Fetch.Response)
}

class ForgotPasswordPresenter: ForgotPasswordPresentationLogic
{
  weak var viewController: ForgotPasswordDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: ForgotPasswordModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = ForgotPasswordModel.Fetch.ViewModel(status: resp.testObj?.status,msg: resp.testObj?.msg,isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController?.successFetchedItems(viewModel: viewModel)
        }
    }
}
