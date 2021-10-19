//
//  SendAssignmentPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 18/10/21.
//

import Foundation
import CoreData

protocol SendAssignmentPresentationLogic
{
  func presentFetchResults(resp:SendAssignmentModel.Fetch.Response)
}

class SendAssignmentPresenter: SendAssignmentPresentationLogic
{
  weak var viewController: SendAssignmentDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: SendAssignmentModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = SendAssignmentModel.Fetch.ViewModel(status: resp.testObj?.status,msg: resp.testObj?.msg,isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController?.errorFetchingItems(viewModel: viewModel)
        }
        else{
            viewController?.successFetchedItems(viewModel: viewModel)
        }
    }
}
