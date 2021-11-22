//
//  DayMonthAttendListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 17/11/21.
//

import Foundation

protocol DayMonthAttendanceListPresentationLogic
{
  func presentFetchResults(resp: DayMonthAttendanceListModel.Fetch.Response)
}

class DayMonthAttendanceListPresenter: DayMonthAttendanceListPresentationLogic
{
  weak var viewController:DayMonthAttendanceListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: DayMonthAttendanceListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedDayMonthAttendanceListData: [DayMonthAttendanceListModel.Fetch.ViewModel.DisplayedDayMonthAttendanceListData] = []
       
        for data in resp.testObj {
        let displayedDayMonthAttendanceListDatas = DayMonthAttendanceListModel.Fetch.ViewModel.DisplayedDayMonthAttendanceListData(enroll_id: data.enroll_id!,sec_name: data.sec_name!,at_id: data.at_id!,a_status: data.a_status!,count: data.count!,class_id: data.class_id!,abs_date: data.abs_date!,name: data.name!,class_name: data.class_name!,attend_period: data.attend_period!)
            displayedDayMonthAttendanceListData.append(displayedDayMonthAttendanceListDatas)
        }
        let viewModel = DayMonthAttendanceListModel.Fetch.ViewModel(displayedDayMonthAttendanceListData: displayedDayMonthAttendanceListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
