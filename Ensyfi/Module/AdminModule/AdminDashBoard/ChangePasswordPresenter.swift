//
//  ChangePasswordPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/09/21.
//

import Foundation

protocol ChangePasswordPresentationLogic
{
  func presentFetchResults(resp: ChangePasswordModel.Fetch.Response)
}

class ChangePasswordPresenter: ChangePasswordPresentationLogic
{
  weak var viewController: ChangePasswordDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: ChangePasswordModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = ChangePasswordModel.Fetch.ViewModel(status: resp.testObj?.status,msg: resp.testObj?.msg,isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController?.errorFetchingItems(viewModel: viewModel)
        }
        else{
            viewController?.successFetchedItems(viewModel: viewModel)
        }
    }
}
