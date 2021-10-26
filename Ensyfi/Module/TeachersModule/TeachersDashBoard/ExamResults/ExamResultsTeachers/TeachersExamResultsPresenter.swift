//
//  TeachersExamResultsPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 19/10/21.
//

import Foundation

protocol TeachersExamsResultsPresentationLogic
{
  func presentFetchResults(resp:TeachersExamsResultsModel.Fetch.Response)
}

class TeachersExamsResultsPresenter: TeachersExamsResultsPresentationLogic
{
  weak var viewController: TeachersExamsResultsDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: TeachersExamsResultsModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedTeachersExamsResultsData: [TeachersExamsResultsModel.Fetch.ViewModel.DisplayedTeachersExamsResultsData] = []
       
        for data in resp.testObj {
        let displayedTeachersExamsResultsDatas = TeachersExamsResultsModel.Fetch.ViewModel.DisplayedTeachersExamsResultsData(name: data.name!,exam_name: data.exam_name!,subject_name: data.subject_name!,internal_mark: data.internal_mark!,internal_grade: data.internal_grade!,external_mark: data.external_mark!,external_grade: data.external_grade!,total_marks: data.total_marks!,total_grade: data.total_grade!,enroll_id: data.enroll_id!)
            displayedTeachersExamsResultsData.append(displayedTeachersExamsResultsDatas)
        }
        let viewModel = TeachersExamsResultsModel.Fetch.ViewModel(displayedTeachersExamsResultsData: displayedTeachersExamsResultsData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
