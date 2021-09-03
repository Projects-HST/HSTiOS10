//
//  ExamResultsPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 02/09/21.
//

import Foundation

protocol ExamResultsPresentationLogic
{
  func presentFetchResults(resp: ExamResultsModel.Fetch.Response)
}

class ExamResultsPresenter: ExamResultsPresentationLogic
{
  weak var viewController: ExamResultsDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: ExamResultsModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedExamResultsData: [ExamResultsModel.Fetch.ViewModel.DisplayedExamResultsData] = []
       
        for data in resp.testObj {
        let displayedExamResultsDatas = ExamResultsModel.Fetch.ViewModel.DisplayedExamResultsData(exam_id: data.exam_id!,exam_name: data.exam_name!,is_internal_external: data.is_internal_external!,Fromdate: data.Fromdate!,Todate: data.Todate!,MarkStatus: data.MarkStatus!)
            displayedExamResultsData.append(displayedExamResultsDatas)
        }
        let viewModel = ExamResultsModel.Fetch.ViewModel(displayedExamResultsData: displayedExamResultsData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
