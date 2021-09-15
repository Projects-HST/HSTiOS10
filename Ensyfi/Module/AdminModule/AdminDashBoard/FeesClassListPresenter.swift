//
//  FeesClassListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 08/09/21.
//

import Foundation

protocol FeesClassListPresentationLogic
{
  func presentFetchResults(resp: FeesClassListModel.Fetch.Response)
}

class FeesClassListPresenter: FeesClassListPresentationLogic
{
  weak var viewController1: FeesClassListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:FeesClassListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedFeesClassListData: [FeesClassListModel.Fetch.ViewModel.DisplayedFeesClassListData] = []
       
        for data in resp.testObj {
        let displayedFeesClassListDatas = FeesClassListModel.Fetch.ViewModel.DisplayedFeesClassListData(class_id: data.class_id!,class_name: data.class_name!)
            displayedFeesClassListData.append(displayedFeesClassListDatas)
        }
        let viewModel = FeesClassListModel.Fetch.ViewModel(displayedFeesClassListData: displayedFeesClassListData)
        viewController1?.successFetchedItems(viewModel: viewModel)
    }
}
