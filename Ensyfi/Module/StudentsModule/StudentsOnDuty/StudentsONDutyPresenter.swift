//
//  StudentsONDutyPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 23/10/21.
//


import Foundation

protocol StudentsONDutyPresentationLogic
{
  func presentFetchResults(resp: StudentsONDutyModel.Fetch.Response)
}

class StudentsONDutyPresenter: StudentsONDutyPresentationLogic
{
  weak var viewController1: StudentsONDutyDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: StudentsONDutyModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedStudentsONDutyData: [StudentsONDutyModel.Fetch.ViewModel.DisplayedStudentsONDutyData] = []
       
        for data in resp.testObj {
            let displayedStudentsONDutyDatas = StudentsONDutyModel.Fetch.ViewModel.DisplayedStudentsONDutyData(od_for: data.od_for!, from_date: data.from_date!,to_date: data.to_date!, notes: data.notes!,status: data.status!, student_id: data.student_id!,name: data.name!)
            displayedStudentsONDutyData.append(displayedStudentsONDutyDatas)
        }
        let viewModel = StudentsONDutyModel.Fetch.ViewModel(displayedStudentsONDutyData: displayedStudentsONDutyData)
        viewController1?.successFetchedItems(viewModel: viewModel)
    }
}
