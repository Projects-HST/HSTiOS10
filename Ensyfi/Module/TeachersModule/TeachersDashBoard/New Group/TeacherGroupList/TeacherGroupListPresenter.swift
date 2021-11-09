//
//  TeacherGroupListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/10/21.
//
import Foundation

protocol TeacherGroupListPresentationLogic
{
  func presentFetchResults(resp: TeacherGroupListModel.Fetch.Response)
}

class TeacherGroupListPresenter: TeacherGroupListPresentationLogic
{
  weak var viewController: TeacherGroupListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: TeacherGroupListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedTeacherGroupListData: [TeacherGroupListModel.Fetch.ViewModel.DisplayedTeacherGroupListData] = []
       
        for data in resp.testObj {
        let displayedTeacherGroupListDatas = TeacherGroupListModel.Fetch.ViewModel.DisplayedTeacherGroupListData(group_title_id: data.group_title_id!,id: data.id!,notes: data.notes!,created_at: data.created_at!,group_title: data.group_title!)
            displayedTeacherGroupListData.append(displayedTeacherGroupListDatas)
        }
        let viewModel = TeacherGroupListModel.Fetch.ViewModel(displayedTeacherGroupListData: displayedTeacherGroupListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
