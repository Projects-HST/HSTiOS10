//
//  ClassTestMarksListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 09/11/21.
//

import Foundation

protocol ClassTestMarkListPresentationLogic
{
  func presentFetchResults(resp: ClassTestMarkListModel.Fetch.Response)
}

class ClassTestMarkListPresenter:ClassTestMarkListPresentationLogic
{
  weak var viewController:ClassTestMarkListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: ClassTestMarkListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedClassTestMarkListData: [ClassTestMarkListModel.Fetch.ViewModel.DisplayedClassTestMarkListData] = []
       
        for data in resp.testObj {
        let displayedClassTestMarkListDatas = ClassTestMarkListModel.Fetch.ViewModel.DisplayedClassTestMarkListData(enroll_id: data.enroll_id!,name: data.name!,marks: data.marks!)
            displayedClassTestMarkListData.append(displayedClassTestMarkListDatas)
        }
        let viewModel = ClassTestMarkListModel.Fetch.ViewModel(displayedClassTestMarkListData: displayedClassTestMarkListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
