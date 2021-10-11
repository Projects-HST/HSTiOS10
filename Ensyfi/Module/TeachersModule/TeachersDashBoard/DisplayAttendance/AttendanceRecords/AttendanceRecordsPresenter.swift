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
        let displayedAttendanceRecordListDatas = AttendanceRecordListModel.Fetch.ViewModel.DisplayedAttendanceRecordListData(ac_year: data.ac_year!,at_id: data.at_id!,attendence_period: data.attendence_period!,class_id: data.class_id!,class_total: data.class_total!,created_at: data.created_at!,created_by: data.created_by!,name: data.name!,no_of_absent: data.no_of_absent!,no_of_present: data.no_of_present!,sent_status: data.sent_status!,status: data.status!,updated_at: data.updated_at!,updated_by: data.updated_by!)
            displayedAttendanceRecordListData.append(displayedAttendanceRecordListDatas)
        }
        let viewModel = AttendanceRecordListModel.Fetch.ViewModel(displayedAttendanceRecordListData: displayedAttendanceRecordListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
