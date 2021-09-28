//
//  ClassAttendancePresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 27/09/21.
//

import Foundation

protocol ClassAttendanceListPresentationLogic
{
  func presentFetchResults(resp: ClassAttendanceListModel.Fetch.Response)
}

class ClassAttendanceListPresenter:ClassAttendanceListPresentationLogic
{
  weak var viewController: ClassAttendanceListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: ClassAttendanceListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedClassAttendanceListData: [ClassAttendanceListModel.Fetch.ViewModel.DisplayedClassAttendanceListData] = []
       
        for data in resp.testObj {
        let displayedClassAttendanceListDatas = ClassAttendanceListModel.Fetch.ViewModel.DisplayedClassAttendanceListData(status: data.status!,class_total: data.class_total!,class_name: data.class_name!,no_of_present: data.no_of_present!,no_of_absent: data.no_of_absent!,class_id: data.class_id!)
            displayedClassAttendanceListData.append(displayedClassAttendanceListDatas)
        }
        let viewModel = ClassAttendanceListModel.Fetch.ViewModel(displayedClassAttendanceListData: displayedClassAttendanceListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
