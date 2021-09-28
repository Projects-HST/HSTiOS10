//
//  FeesSectionListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 08/09/21.
//

import Foundation

protocol FeesSectionListPresentationLogic
{
  func presentFetchResults(resp: FeesSectionListModel.Fetch.Response)
}

class FeesSectionListPresenter: FeesSectionListPresentationLogic
{
  weak var viewController1: FeesSectionListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: FeesSectionListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedFeesSectionListData: [FeesSectionListModel.Fetch.ViewModel.DisplayedFeesSectionListData] = []
       
        for data in resp.testObj {
            let displayedFeesSectionListDatas = FeesSectionListModel.Fetch.ViewModel.DisplayedFeesSectionListData(sec_id: data.sec_id!, sec_name: data.sec_name!)
            displayedFeesSectionListData.append(displayedFeesSectionListDatas)
        }
        let viewModel = FeesSectionListModel.Fetch.ViewModel(displayedFeesSectionListData: displayedFeesSectionListData)
        viewController1?.successFetchedItems(viewModel: viewModel)
    }
}
