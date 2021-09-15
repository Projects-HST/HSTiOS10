//
//  CreateGroupPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 14/09/21.
//

import Foundation

protocol CreateGroupPresentationLogic
{
  func presentFetchResults(resp: CreateGroupModel.Fetch.Response)
}

class CreateGroupPresenter: CreateGroupPresentationLogic
{
  weak var viewController1: CreateGroupDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: CreateGroupModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = CreateGroupModel.Fetch.ViewModel(status: resp.testObj?.status,msg: resp.testObj?.msg,isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController1?.errorFetchingItems(viewModel: viewModel)
        }
        else{
            viewController1?.successFetchedItems(viewModel: viewModel)
        }
    }
}
