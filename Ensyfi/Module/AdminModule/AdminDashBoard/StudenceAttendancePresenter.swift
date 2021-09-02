//
//  StudenceAttendancePresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 02/09/21.
//

import Foundation

protocol StudentAttendancePresentationLogic
{
  func presentFetchResults(resp: StudentAttendanceModel.Fetch.Response)
}

class StudentAttendancePresenter: StudentAttendancePresentationLogic
{
  weak var viewController: StudentAttendanceDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: StudentAttendanceModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedStudentAttendanceData: [StudentAttendanceModel.Fetch.ViewModel.DisplayedStudentAttendanceData] = []
       
        for data in resp.testObj {
        let displayedStudentAttendanceDatas = StudentAttendanceModel.Fetch.ViewModel.DisplayedStudentAttendanceData(abs_count: data.abs_count!,at_id: data.at_id!,student_id: data.student_id!,abs_date: data.abs_date!,a_status: data.a_status!)
            displayedStudentAttendanceData.append(displayedStudentAttendanceDatas)
        }
        let viewModel = StudentAttendanceModel.Fetch.ViewModel(displayedStudentAttendanceData: displayedStudentAttendanceData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
