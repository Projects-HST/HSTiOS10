//
//  SyncExamMarksPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 11/11/21.
//

import Foundation
import CoreData

protocol SyncExamMarksPresentationLogic
{
  func presentFetchResults(resp: SyncExamMarksModel.Fetch.Response)
}

class SyncExamMarksPresenter:SyncExamMarksPresentationLogic
{
  weak var viewController4: SyncExamMarksDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: SyncExamMarksModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = SyncExamMarksModel.Fetch.ViewModel(status: resp.testObj?.status,msg: resp.testObj?.msg,isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController4?.errorFetchingItems(viewModel: viewModel)
        }
        else{
            viewController4?.successFetchedItems(viewModel: viewModel)
        }
    }
}
