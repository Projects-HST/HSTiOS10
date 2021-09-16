//
//  StudentAddGroupListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 16/09/21.
//

import Foundation

protocol StudentGroupAddListPresentationLogic
{
  func presentFetchResults(resp: StudentGroupAddListModel.Fetch.Response)
}

class StudentGroupAddListPresenter: StudentGroupAddListPresentationLogic
{
  weak var viewController2: StudentGroupAddListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:StudentGroupAddListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedStudentGroupAddListData: [StudentGroupAddListModel.Fetch.ViewModel.DisplayedStudentGroupAddListData] = []
       
        for data in resp.testObj {
            let displayedStudentGroupAddListDatas = StudentGroupAddListModel.Fetch.ViewModel.DisplayedStudentGroupAddListData(Status: data.Status!, user_id: data.user_id!,name: data.name!)
            displayedStudentGroupAddListData.append(displayedStudentGroupAddListDatas)
        }
        let viewModel = StudentGroupAddListModel.Fetch.ViewModel(displayedStudentGroupAddListData: displayedStudentGroupAddListData)
        viewController2?.successFetchedItems(viewModel: viewModel)
    }
}
