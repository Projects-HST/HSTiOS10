//
//  StudentListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 25/08/21.
//

import Foundation

protocol StudentsListPresentationLogic
{
  func presentFetchResults(resp: StudentsListModel.Fetch.Response)
}

class StudentsListPresenter: StudentsListPresentationLogic
{
  weak var viewController2: StudentsListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: StudentsListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedStudentsListData: [StudentsListModel.Fetch.ViewModel.DisplayedStudentsListData] = []
       
        for data in resp.testObj {
        let displayedStudentsListDatas = StudentsListModel.Fetch.ViewModel.DisplayedStudentsListData(admisn_no: data.admisn_no!,enroll_id: data.enroll_id!,admisn_year: data.admisn_year!,class_id: data.class_id!,sex: data.sex!,name: data.name!)
            displayedStudentsListData.append(displayedStudentsListDatas)
        }
        let viewModel = StudentsListModel.Fetch.ViewModel(displayedStudentsListData: displayedStudentsListData)
        viewController2?.successFetchedItems(viewModel: viewModel)
    }
}
