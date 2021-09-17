//
//  AddGroupMemberPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 17/09/21.
//

import Foundation

protocol AddGroupMemberPresentationLogic
{
  func presentFetchResults(resp: AddGroupMemberModel.Fetch.Response)
}

class AddGroupMemberPresenter: AddGroupMemberPresentationLogic
{
  weak var viewController4: AddGroupMemberDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: AddGroupMemberModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = AddGroupMemberModel.Fetch.ViewModel(status: resp.testObj?.status,msg: resp.testObj?.msg,isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController4?.errorFetchingItems(viewModel: viewModel)
        }
        else{
            viewController4?.successFetchedItems(viewModel: viewModel)
        }
    }
}
