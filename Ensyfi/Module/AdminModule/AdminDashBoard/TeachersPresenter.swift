//
//  TeachersPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/08/21.
//

import Foundation

protocol TeachersListPresentationLogic
{
  func presentFetchResults(resp: TeachersListModel.Fetch.Response)
}

class TeachersListPresenter: TeachersListPresentationLogic
{
  weak var viewController: TeachersListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: TeachersListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedTeachersListData: [TeachersListModel.Fetch.ViewModel.DisplayedTeachersListData] = []
       
        for data in resp.testObj {
        let displayedTeachersListDatas = TeachersListModel.Fetch.ViewModel.DisplayedTeachersListData(class_id: data.class_id!,class_name: data.class_name!)
            displayedTeachersListData.append(displayedTeachersListDatas)
        }
        let viewModel = TeachersListModel.Fetch.ViewModel(displayedTeachersListData: displayedTeachersListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
