//
//  BoardMembersPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/09/21.
//

import Foundation

protocol BoardMembersListPresentationLogic
{
  func presentFetchResults(resp: BoardMembersListModel.Fetch.Response)
}

class BoardMembersListPresenter: BoardMembersListPresentationLogic
{
  weak var viewController: BoardMembersListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: BoardMembersListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedBoardMembersListData: [BoardMembersListModel.Fetch.ViewModel.DisplayedBoardMembersListData] = []
       
        for data in resp.testObj {
        let displayedBoardMembersListDatas = BoardMembersListModel.Fetch.ViewModel.DisplayedBoardMembersListData(age: data.age!,name: data.name!,sex: data.sex!,teacher_id: data.teacher_id!)
            displayedBoardMembersListData.append(displayedBoardMembersListDatas)
        }
        let viewModel = BoardMembersListModel.Fetch.ViewModel(displayedBoardMembersListData: displayedBoardMembersListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
