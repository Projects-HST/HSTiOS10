//
//  GroupMembersListInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 15/09/21.
//

import Foundation

protocol GroupMembersListPresentationLogic
{
  func presentFetchResults(resp: GroupMembersListModel.Fetch.Response)
}

class GroupMembersListPresenter: GroupMembersListPresentationLogic
{
  weak var viewController: GroupMembersListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:GroupMembersListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedGroupMembersListData: [GroupMembersListModel.Fetch.ViewModel.DisplayedGroupMembersListData] = []
       
        for data in resp.testObj {
            let displayedGroupMembersListDatas = GroupMembersListModel.Fetch.ViewModel.DisplayedGroupMembersListData(name: data.name!, id: data.id!,user_type_name: data.user_type_name!)
            displayedGroupMembersListData.append(displayedGroupMembersListDatas)
        }
        let viewModel = GroupMembersListModel.Fetch.ViewModel(displayedGroupMembersListData: displayedGroupMembersListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
