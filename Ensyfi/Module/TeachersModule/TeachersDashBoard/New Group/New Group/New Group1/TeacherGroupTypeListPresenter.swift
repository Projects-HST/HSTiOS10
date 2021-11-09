//
//  TeacherGroupTypeListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/10/21.
//

import Foundation

protocol TeacherGroupTypleListPresentationLogic
{
  func presentFetchResults(resp: TeacherGroupTypleListModel.Fetch.Response)
}

class TeacherGroupTypleListPresenter:TeacherGroupTypleListPresentationLogic
{
  weak var viewController: TeacherGroupTypleListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: TeacherGroupTypleListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedTeacherGroupTypleListData: [TeacherGroupTypleListModel.Fetch.ViewModel.DisplayedTeacherGroupTypleListData] = []
       
        for data in resp.testObj {
        let displayedTeacherGroupTypleListDatas = TeacherGroupTypleListModel.Fetch.ViewModel.DisplayedTeacherGroupTypleListData(id: data.id!,group_title: data.group_title!)
            displayedTeacherGroupTypleListData.append(displayedTeacherGroupTypleListDatas)
        }
        let viewModel = TeacherGroupTypleListModel.Fetch.ViewModel(displayedTeacherGroupTypleListData: displayedTeacherGroupTypleListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
