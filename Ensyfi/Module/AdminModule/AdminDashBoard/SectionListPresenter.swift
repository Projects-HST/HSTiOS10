//
//  SectionListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 25/08/21.
//

import Foundation

protocol SectionListPresentationLogic
{
  func presentFetchResults(resp: SectionListModel.Fetch.Response)
}

class SectionListPresenter: SectionListPresentationLogic
{
  weak var viewController1: SectionListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: SectionListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedSectionListData: [SectionListModel.Fetch.ViewModel.DisplayedSectionListData] = []
       
        for data in resp.testObj {
            let displayedSectionListDatas = SectionListModel.Fetch.ViewModel.DisplayedSectionListData(sec_id: data.sec_id!, sec_name: data.sec_name!)
            displayedSectionListData.append(displayedSectionListDatas)
        }
        let viewModel = SectionListModel.Fetch.ViewModel(displayedSectionListData: displayedSectionListData)
        viewController1?.successFetchedItems(viewModel: viewModel)
    }
}
