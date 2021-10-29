//
//  LeaveTypeListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/10/21.
//

import Foundation

protocol TeacherLeavesRequestPresentationLogic
{
  func presentFetchResults(resp: TeacherLeavesRequestModel.Fetch.Response)
}

class TeacherLeavesRequestPresenter: TeacherLeavesRequestPresentationLogic
{
  weak var viewController: TeacherLeavesRequestDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: TeacherLeavesRequestModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedTeacherLeavesRequestData: [TeacherLeavesRequestModel.Fetch.ViewModel.DisplayedTeacherLeavesRequestData] = []
       
        for data in resp.testObj {
        let displayedTeacherLeavesRequestDatas = TeacherLeavesRequestModel.Fetch.ViewModel.DisplayedTeacherLeavesRequestData(id: data.id!,leave_type: data.leave_type!,leave_title: data.leave_title!)
            displayedTeacherLeavesRequestData.append(displayedTeacherLeavesRequestDatas)
        }
        let viewModel = TeacherLeavesRequestModel.Fetch.ViewModel(displayedTeacherLeavesRequestData: displayedTeacherLeavesRequestData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
