//
//  GroupSectionListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 16/09/21.
//

import Foundation

protocol GroupSectionListPresentationLogic
{
  func presentFetchResults(resp: GroupSectionListModel.Fetch.Response)
}

class GroupSectionListPresenter: GroupSectionListPresentationLogic
{
  weak var viewController1: GroupSectionListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:GroupSectionListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedGroupSectionListData: [GroupSectionListModel.Fetch.ViewModel.DisplayedGroupSectionListData] = []
       
        for data in resp.testObj {
            let displayedGroupSectionListDatas = GroupSectionListModel.Fetch.ViewModel.DisplayedGroupSectionListData(class_sec_id: data.class_sec_id!, class_section: data.class_section!)
            displayedGroupSectionListData.append(displayedGroupSectionListDatas)
        }
        let viewModel = GroupSectionListModel.Fetch.ViewModel(displayedGroupSectionListData: displayedGroupSectionListData)
        viewController1?.successFetchedItems(viewModel: viewModel)
    }
}
