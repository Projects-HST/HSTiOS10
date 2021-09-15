//
//  GroupListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 14/09/21.
//


import Foundation

protocol GroupListPresentationLogic
{
  func presentFetchResults(resp: GroupListModel.Fetch.Response)
}

class GroupListPresenter: GroupListPresentationLogic
{
  weak var viewController: GroupListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: GroupListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedGroupListData: [GroupListModel.Fetch.ViewModel.DisplayedGroupListData] = []
       
        for data in resp.testObj {
        let displayedGroupListDatas = GroupListModel.Fetch.ViewModel.DisplayedGroupListData(id: data.id!,group_title: data.group_title!,group_lead_id: data.group_lead_id!,year_id: data.year_id!,status: data.status!,created_by: data.created_by!,updated_by: data.updated_by!,updated_at: data.updated_at!,lead_name: data.lead_name!)
            displayedGroupListData.append(displayedGroupListDatas)
        }
        let viewModel = GroupListModel.Fetch.ViewModel(displayedGroupListData: displayedGroupListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
