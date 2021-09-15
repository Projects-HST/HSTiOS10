//
//  GroupUpdatePresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 15/09/21.
//

import Foundation

protocol UpdateGroupPresentationLogic
{
  func presentFetchResults(resp: UpdateGroupModel.Fetch.Response)
}

class UpdateGroupPresenter: UpdateGroupPresentationLogic
{
  weak var viewController1: UpdateGroupDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: UpdateGroupModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = UpdateGroupModel.Fetch.ViewModel(status: resp.testObj?.status,msg: resp.testObj?.msg,isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController1?.errorFetchingItems(viewModel: viewModel)
        }
        else{
            viewController1?.successFetchedItems(viewModel: viewModel)
        }
    }
}
