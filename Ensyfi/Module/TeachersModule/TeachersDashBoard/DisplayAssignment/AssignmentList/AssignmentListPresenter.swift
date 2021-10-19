//
//  AssignmentListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 12/10/21.
//

import Foundation

protocol AssignmentListPresentationLogic
{
  func presentFetchResults(resp: AssignmentListModel.Fetch.Response)
}

class AssignmentListPresenter: AssignmentListPresentationLogic
{
  weak var viewController: AssignmentListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: AssignmentListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedAssignmentListData: [AssignmentListModel.Fetch.ViewModel.DisplayedAssignmentListData] = []
       
        for data in resp.testObj {
        let displayedAssignmentListDatas = AssignmentListModel.Fetch.ViewModel.DisplayedAssignmentListData(hw_date: data.hw_date!,hw_count: data.hw_count!,ht_count: data.ht_count!)
            displayedAssignmentListData.append(displayedAssignmentListDatas)
        }
        let viewModel = AssignmentListModel.Fetch.ViewModel(displayedAssignmentListData: displayedAssignmentListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
