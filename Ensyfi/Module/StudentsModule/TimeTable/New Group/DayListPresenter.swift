//
//  DayListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/10/21.
//

import Foundation

protocol DayListPresentationLogic
{
  func presentFetchResults(resp:DayListModel.Fetch.Response)
}

class DayListPresenter: DayListPresentationLogic
{
  weak var viewController: DayListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: DayListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedDayListData: [DayListModel.Fetch.ViewModel.DisplayedDayListData] = []
       
        for data in resp.testObj {
            let displayedDayListDatas = DayListModel.Fetch.ViewModel.DisplayedDayListData(day_name: data.day_name!, day_id: data.day_id!)
            displayedDayListData.append(displayedDayListDatas)
        }
        let viewModel = DayListModel.Fetch.ViewModel(displayedDayListData: displayedDayListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
