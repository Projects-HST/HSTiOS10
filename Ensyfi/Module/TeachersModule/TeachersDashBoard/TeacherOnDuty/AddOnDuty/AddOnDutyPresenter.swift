//
//  AddOnDutyPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 18/11/21.
//

import Foundation
import CoreData

protocol AddONDutyPresentationLogic
{
  func presentFetchResults(resp:AddONDutyModel.Fetch.Response)
}

class AddONDutyPresenter:AddONDutyPresentationLogic
{
  weak var viewController: AddONDutyDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: AddONDutyModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = AddONDutyModel.Fetch.ViewModel(status: resp.testObj?.status,msg: resp.testObj?.msg,isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController?.errorFetchingItems(viewModel: viewModel)
        }
        else{
            viewController?.successFetchedItems(viewModel: viewModel)
        }
    }
}
