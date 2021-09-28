//
//  FeesClassListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 08/09/21.
//

import Foundation

protocol FeesListPresentationLogic
{
  func presentFetchResults(resp: FeesListModel.Fetch.Response)
}

class FeesListPresenter: FeesListPresentationLogic
{
  weak var viewController2: FeesListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:FeesListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedFeesListData: [FeesListModel.Fetch.ViewModel.DisplayedFeesListData] = []
       
        for data in resp.testObj {
        let displayedFeesListDatas = FeesListModel.Fetch.ViewModel.DisplayedFeesListData(fees_id: data.fees_id!,from_year: data.from_year!,term_name: data.term_name!,to_year: data.to_year!,due_date_to: data.due_date_to!,due_date_from: data.due_date_from!)
            displayedFeesListData.append(displayedFeesListDatas)
        }
        let viewModel = FeesListModel.Fetch.ViewModel(displayedFeesListData: displayedFeesListData)
        viewController2?.successFetchedItems(viewModel: viewModel)
    }
}
