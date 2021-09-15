//
//  CircularListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 04/09/21.
//
import Foundation

protocol CircularsListPresentationLogic
{
  func presentFetchResults(resp: CircularsListModel.Fetch.Response)
}

class CircularsListPresenter: CircularsListPresentationLogic
{
  weak var viewController: CircularsListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: CircularsListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedCircularsListData: [CircularsListModel.Fetch.ViewModel.DisplayedCircularsListData] = []
       
        for data in resp.testObj {
        let displayedCircularsListDatas = CircularsListModel.Fetch.ViewModel.DisplayedCircularsListData(id: data.id!,circular_date: data.circular_date!,circular_title: data.circular_title!,circular_description: data.circular_description!,circular_type: data.circular_type!,status: data.status!)
            displayedCircularsListData.append(displayedCircularsListDatas)
        }
        let viewModel = CircularsListModel.Fetch.ViewModel(displayedCircularsListData: displayedCircularsListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
