//
//  GroupTitleListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 22/11/21.
//


import Foundation

protocol GroupTitleListPresentationLogic
{
  func presentFetchResults(resp: GroupTitleListModel.Fetch.Response)
}

class GroupTitleListPresenter:GroupTitleListPresentationLogic
{
  weak var viewController: GroupTitleListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: GroupTitleListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedGroupTitleListData: [GroupTitleListModel.Fetch.ViewModel.DisplayedGroupTitleListData] = []
       
        for data in resp.testObj {
        let displayedGroupTitleListDatas = GroupTitleListModel.Fetch.ViewModel.DisplayedGroupTitleListData(group_title: data.group_title!,id: data.id!)
            displayedGroupTitleListData.append(displayedGroupTitleListDatas)
        }
        let viewModel = GroupTitleListModel.Fetch.ViewModel(displayedGroupTitleListData: displayedGroupTitleListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
