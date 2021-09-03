//
//  ClassForTeacherListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//
import Foundation

protocol ClassForTeacherListPresentationLogic
{
  func presentFetchResults(resp: ClassForTeacherListModel.Fetch.Response)
}

class ClassForTeacherListPresenter: ClassForTeacherListPresentationLogic
{
  weak var viewController3: ClassForTeacherListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: ClassForTeacherListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedClassForTeacherListData: [ClassForTeacherListModel.Fetch.ViewModel.DisplayedClassForTeacherListData] = []
       
        for data in resp.testObj {
        let displayedClassForTeacherListDatas = ClassForTeacherListModel.Fetch.ViewModel.DisplayedClassForTeacherListData(teacher_id: data.teacher_id!,subject_name: data.subject_name!,subject_id: data.subject_id!,name: data.name!)
            displayedClassForTeacherListData.append(displayedClassForTeacherListDatas)
        }
        let viewModel = ClassForTeacherListModel.Fetch.ViewModel(displayedClassForTeacherListData: displayedClassForTeacherListData)
        viewController3?.successFetchedItems(viewModel: viewModel)
    }
}
