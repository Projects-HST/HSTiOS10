//
//  OverViewAttendancePresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 11/10/21.
//

import Foundation

protocol AttendanceRecordListPresentationLogic
{
  func presentFetchResults(resp: AttendanceRecordListModel.Fetch.Response)
}

class AttendanceRecordListPresenter: AttendanceRecordListPresentationLogic
{
  weak var viewController: AttendanceRecordListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: AttendanceRecordListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedAttendanceRecordListData: [AttendanceRecordListModel.Fetch.ViewModel.DisplayedAttendanceRecordListData] = []
       
        for data in resp.testObj {
        let displayedAttendanceRecordListDatas = AttendanceRecordListModel.Fetch.ViewModel.DisplayedAttendanceRecordListData(sex: data.sex!,a_status: data.a_status!,enroll_id: data.enroll_id!,admission_id: data.admission_id!,name: data.name!)
            displayedAttendanceRecordListData.append(displayedAttendanceRecordListDatas)
        }
        let viewModel = AttendanceRecordListModel.Fetch.ViewModel(displayedAttendanceRecordListData: displayedAttendanceRecordListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}

