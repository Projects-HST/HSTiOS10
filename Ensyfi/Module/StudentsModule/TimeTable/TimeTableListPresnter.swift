//
//  TimeTableListPresnter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/10/21.
//

import Foundation

protocol TimeTableListPresentationLogic
{
  func presentFetchResults(resp:TimeTableListModel.Fetch.Response)
}

class TimeTableListPresenter:TimeTableListPresentationLogic
{
  weak var viewController1: TimeTableListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: TimeTableListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedTimeTableListData: [TimeTableListModel.Fetch.ViewModel.DisplayedTimeTableListData] = []
       
        for data in resp.testObj {
            let displayedTimeTableListDatas = TimeTableListModel.Fetch.ViewModel.DisplayedTimeTableListData(to_time: data.to_time!, day_id: data.day_id!,teacher_id: data.teacher_id!, class_name: data.class_name!,name: data.name!, break_name: data.break_name!,from_time: data.from_time!,subject_name: data.subject_name!, subject_id: data.subject_id!,is_break: data.is_break!, table_id: data.table_id!,period: data.period!, class_id: data.class_id!,sec_name: data.sec_name!)
            displayedTimeTableListData.append(displayedTimeTableListDatas)
        }
        let viewModel = TimeTableListModel.Fetch.ViewModel(displayedTimeTableListData: displayedTimeTableListData)
        viewController1?.successFetchedItems(viewModel: viewModel)
    }
}
