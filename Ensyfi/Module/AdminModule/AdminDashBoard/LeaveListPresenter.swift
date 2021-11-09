//
//  LeaveListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 20/09/21.
//

import Foundation

protocol LeavesListPresentationLogic
{
  func presentFetchResults(resp: LeavesListModel.Fetch.Response)
}

class LeavesListPresenter: LeavesListPresentationLogic
{
  weak var viewController: LeavesListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: LeavesListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedLeavesListData: [LeavesListModel.Fetch.ViewModel.DisplayedLeavesListData] = []
       
        for data in resp.testObj {
        let displayedLeavesListDatas = LeavesListModel.Fetch.ViewModel.DisplayedLeavesListData(leave_id: data.leave_id!,user_id: data.user_id!,name: data.name!,leave_title: data.leave_title!,leave_type: data.leave_type!,status: data.status!,from_leave_date: data.from_leave_date!,leave_description: data.leave_description!,frm_time: data.frm_time!,to_time: data.to_time!)
            displayedLeavesListData.append(displayedLeavesListDatas)
        }
        let viewModel = LeavesListModel.Fetch.ViewModel(displayedLeavesListData: displayedLeavesListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
