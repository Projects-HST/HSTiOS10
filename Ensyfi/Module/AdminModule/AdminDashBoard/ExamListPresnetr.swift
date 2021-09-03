//
//  ExamListPresnetr.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//

import Foundation

protocol ExamListPresentationLogic
{
  func presentFetchResults(resp: ExamListModel.Fetch.Response)
}

class ExamListPresenter: ExamListPresentationLogic
{
  weak var viewController2: ExamListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: ExamListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedExamListData: [ExamListModel.Fetch.ViewModel.DisplayedExamListData] = []
       
        for data in resp.testObj {
        let displayedExamListDatas = ExamListModel.Fetch.ViewModel.DisplayedExamListData(exam_id: data.exam_id!,exam_name: data.exam_name!,is_internal_external: data.is_internal_external!,Fromdate: data.Fromdate!,Todate: data.Todate!,MarkStatus: data.MarkStatus!)
            displayedExamListData.append(displayedExamListDatas)
        }
        let viewModel = ExamListModel.Fetch.ViewModel(displayedExamListData: displayedExamListData)
        viewController2?.successFetchedItems(viewModel: viewModel)
    }
}
