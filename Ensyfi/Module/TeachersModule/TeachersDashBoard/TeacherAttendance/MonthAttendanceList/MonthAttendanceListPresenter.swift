//
//  MonthAttendanceListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 19/11/21.
//


import Foundation

protocol MonthAttendanceListPresentationLogic
{
  func presentFetchResults(resp: MonthAttendanceListModel.Fetch.Response)
}

class MonthAttendanceListPresenter:MonthAttendanceListPresentationLogic
{
  weak var viewController1:MonthAttendanceListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: MonthAttendanceListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedMonthAttendanceListData: [MonthAttendanceListModel.Fetch.ViewModel.DisplayedMonthAttendanceListData] = []
       
        for data in resp.testObj {
        let displayedMonthAttendanceListDatas = MonthAttendanceListModel.Fetch.ViewModel.DisplayedMonthAttendanceListData(abs_date: data.abs_date!,enroll_id: data.enroll_id!,sec_name: data.sec_name!,a_status: data.a_status!,attend_period: data.attend_period!,class_name: data.class_name!,class_id: data.class_id!,at_id: data.at_id!,leaves: data.leaves!,name: data.name!)
            displayedMonthAttendanceListData.append(displayedMonthAttendanceListDatas)
        }
        let viewModel = MonthAttendanceListModel.Fetch.ViewModel(displayedMonthAttendanceListData: displayedMonthAttendanceListData)
        viewController1?.successFetchedItems(viewModel: viewModel)
    }
}
