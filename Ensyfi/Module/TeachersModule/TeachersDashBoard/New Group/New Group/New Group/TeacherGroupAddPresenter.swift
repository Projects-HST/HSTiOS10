//
//  TeacherGroupAddPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/10/21.
//

import Foundation
import CoreData

protocol SendTecherGroupPresentationLogic
{
  func presentFetchResults(resp: SendTecherGroupModel.Fetch.Response)
}

class SendTecherGroupPresenter: SendTecherGroupPresentationLogic
{
  weak var viewController1: SendTecherGroupDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: SendTecherGroupModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = SendTecherGroupModel.Fetch.ViewModel(status: resp.testObj?.status,msg: resp.testObj?.msg, last_group_history_id: resp.testObj?.last_group_history_id,isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController1?.errorFetchingItems(viewModel: viewModel)
        }
        else{
            viewController1?.successFetchedItems(viewModel: viewModel)
        }
    }
}
