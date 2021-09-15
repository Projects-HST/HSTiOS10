//
//  GetTeachersListIDPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 14/09/21.
//

import Foundation

protocol TeacherListIDPresentationLogic
{
  func presentFetchResults(resp: TeacherListIDModel.Fetch.Response)
}

class TeacherListIDPresenter: TeacherListIDPresentationLogic
{
  weak var viewController: TeacherListIDDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:TeacherListIDModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedTeacherListIDData: [TeacherListIDModel.Fetch.ViewModel.DisplayedTeacherListIDData] = []
       
        for data in resp.testObj {
        let displayedTeacherListIDDatas = TeacherListIDModel.Fetch.ViewModel.DisplayedTeacherListIDData(user_id: data.user_id!,name: data.name!)
            displayedTeacherListIDData.append(displayedTeacherListIDDatas)
        }
        let viewModel = TeacherListIDModel.Fetch.ViewModel(displayedTeacherListIDData: displayedTeacherListIDData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
