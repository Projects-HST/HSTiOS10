//
//  ExamTimeTablePresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/09/21.
//
import Foundation

protocol ExamTimeTablePresentationLogic
{
  func presentFetchResults(resp:ExamTimeTableModel.Fetch.Response)
}

class ExamTimeTablePresenter: ExamTimeTablePresentationLogic
{
  weak var viewController: ExamTimeTableDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: ExamTimeTableModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedExamTimeTableData: [ExamTimeTableModel.Fetch.ViewModel.DisplayedExamTimeTableData] = []
       
        for data in resp.testObj {
        let displayedExamTimeTableDatas = ExamTimeTableModel.Fetch.ViewModel.DisplayedExamTimeTableData(exam_name: data.exam_name!,exam_id: data.exam_id!,times: data.times!,subject_name: data.subject_name!,exam_date: data.exam_date!)
            displayedExamTimeTableData.append(displayedExamTimeTableDatas)
        }
        let viewModel = ExamTimeTableModel.Fetch.ViewModel(displayedExamTimeTableData: displayedExamTimeTableData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
