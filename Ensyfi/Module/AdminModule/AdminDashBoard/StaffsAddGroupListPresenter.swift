//
//  StaffsAddGroupListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 17/09/21.
//

import Foundation

protocol StaffGroupAddListPresentationLogic
{
  func presentFetchResults(resp: StaffGroupAddListModel.Fetch.Response)
}

class StaffGroupAddListPresenter: StaffGroupAddListPresentationLogic
{
  weak var viewController3: StaffGroupAddListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:StaffGroupAddListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedStaffGroupAddListData: [StaffGroupAddListModel.Fetch.ViewModel.DisplayedStaffGroupAddListData] = []
       
        for data in resp.testObj {
            let displayedStaffGroupAddListDatas = StaffGroupAddListModel.Fetch.ViewModel.DisplayedStaffGroupAddListData(Status: data.Status!, user_id: data.user_id!,name: data.name!)
            displayedStaffGroupAddListData.append(displayedStaffGroupAddListDatas)
        }
        let viewModel = StaffGroupAddListModel.Fetch.ViewModel(displayedStaffGroupAddListData: displayedStaffGroupAddListData)
        viewController3?.successFetchedItems(viewModel: viewModel)
    }
}
