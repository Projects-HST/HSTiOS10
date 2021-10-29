//
//  TeacherLeaveListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/10/21.
//

import Foundation

protocol TeacherLeavesListPresentationLogic
{
  func presentFetchResults(resp: TeacherLeavesListModel.Fetch.Response)
}

class TeacherLeavesListPresenter: TeacherLeavesListPresentationLogic
{
  weak var viewController: TeacherLeavesListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: TeacherLeavesListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedTeacherLeavesListData: [TeacherLeavesListModel.Fetch.ViewModel.DisplayedTeacherLeavesListData] = []
       
        for data in resp.testObj {
        let displayedTeacherLeavesListDatas = TeacherLeavesListModel.Fetch.ViewModel.DisplayedTeacherLeavesListData(leave_title: data.leave_title!,from_leave_date: data.from_leave_date!,to_leave_date: data.to_leave_date!,frm_time: data.frm_time!,to_time: data.to_time!,leave_type: data.leave_type!,status: data.status!,teacher_id: data.teacher_id!,name: data.name!)
            displayedTeacherLeavesListData.append(displayedTeacherLeavesListDatas)
        }
        let viewModel = TeacherLeavesListModel.Fetch.ViewModel(displayedTeacherLeavesListData: displayedTeacherLeavesListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
