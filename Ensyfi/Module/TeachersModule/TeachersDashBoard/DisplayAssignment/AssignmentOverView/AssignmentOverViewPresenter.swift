//
//  AssignmentOverViewPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 12/10/21.
//

import Foundation

protocol AssignmentOverViewPresentationLogic
{
  func presentFetchResults(resp: AssignmentOverViewModel.Fetch.Response)
}

class AssignmentOverViewPresenter: AssignmentOverViewPresentationLogic
{
  weak var viewController: AssignmentOverViewDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: AssignmentOverViewModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedAssignmentOverViewData: [AssignmentOverViewModel.Fetch.ViewModel.DisplayedAssignmentOverViewData] = []
       
        for data in resp.testObj {
        let displayedAssignmentOverViewDatas = AssignmentOverViewModel.Fetch.ViewModel.DisplayedAssignmentOverViewData(hw_id: data.hw_id!,hw_type: data.hw_type!,title: data.title!,created_at: data.created_at!,test_date: data.test_date!,due_date: data.due_date!,hw_details: data.hw_details!,send_option_status: data.send_option_status!,subject_id: data.subject_id!,subject_name: data.subject_name!,name: data.name!)
            displayedAssignmentOverViewData.append(displayedAssignmentOverViewDatas)
        }
        let viewModel = AssignmentOverViewModel.Fetch.ViewModel(displayedAssignmentOverViewData: displayedAssignmentOverViewData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
