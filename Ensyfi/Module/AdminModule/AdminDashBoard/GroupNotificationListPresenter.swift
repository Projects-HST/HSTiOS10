//
//  GroupNotificationListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 20/11/21.
//

import Foundation

protocol GroupNotificationListPresentationLogic
{
  func presentFetchResults(resp: GroupNotificationListModel.Fetch.Response)
}

class GroupNotificationListPresenter: GroupNotificationListPresentationLogic
{
  weak var viewController: GroupNotificationListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: GroupNotificationListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedGroupNotificationListData: [GroupNotificationListModel.Fetch.ViewModel.DisplayedGroupNotificationListData] = []
       
        for data in resp.testObj {
        let displayedGroupNotificationListDatas = GroupNotificationListModel.Fetch.ViewModel.DisplayedGroupNotificationListData(notes: data.notes!,name: data.name!,group_title: data.group_title!,group_title_id: data.group_title_id!,created_by: data.created_by!,created_at: data.created_at!,notification_type: data.notification_type!)
            displayedGroupNotificationListData.append(displayedGroupNotificationListDatas)
        }
        let viewModel = GroupNotificationListModel.Fetch.ViewModel(displayedGroupNotificationListData: displayedGroupNotificationListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
