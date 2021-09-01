//
//  HomeWorkTestPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 01/09/21.
//

import Foundation

protocol HomeWorkTestListPresentationLogic
{
  func presentFetchResults(resp: HomeWorkTestListModel.Fetch.Response)
}

class HomeWorkTestListPresenter: HomeWorkTestListPresentationLogic
{
  weak var viewController: HomeWorkTestListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: HomeWorkTestListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedHomeWorkTestListData: [HomeWorkTestListModel.Fetch.ViewModel.DisplayedHomeWorkTestListData] = []
       
        for data in resp.testObj {
        let displayedHomeWorkTestListDatas = HomeWorkTestListModel.Fetch.ViewModel.DisplayedHomeWorkTestListData(due_date: data.due_date!,hw_details: data.hw_details!,hw_id: data.hw_id!,hw_type: data.hw_type!,mark_status: data.mark_status!,subject_name: data.subject_name!,test_date: data.test_date!,title: data.title!)
            displayedHomeWorkTestListData.append(displayedHomeWorkTestListDatas)
        }
        let viewModel = HomeWorkTestListModel.Fetch.ViewModel(displayedHomeWorkTestListData: displayedHomeWorkTestListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
