//
//  SendGrpNoticationPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 22/11/21.
//

import Foundation

protocol SendGroupNotificationPresentationLogic
{
  func presentFetchResults(resp: SendGroupNotificationModel.Fetch.Response)
}

class SendGroupNotificationPresenter: SendGroupNotificationPresentationLogic
{
  weak var viewController1: SendGroupNotificationDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:SendGroupNotificationModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = SendGroupNotificationModel.Fetch.ViewModel(status: resp.testObj?.status,msg: resp.testObj?.msg,isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController1?.errorFetchingItems(viewModel: viewModel)
        }
        else{
            viewController1?.successFetchedItems(viewModel: viewModel)
        }
    }
}
