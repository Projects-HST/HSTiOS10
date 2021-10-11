//
//  TecaherAttendanceListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 11/10/21.
//

import Foundation

protocol DisplayAttenddanceListPresentationLogic
{
  func presentFetchResults(resp: DisplayAttenddanceListModel.Fetch.Response)
}

class DisplayAttenddanceListPresenter: DisplayAttenddanceListPresentationLogic
{
  weak var viewController: DisplayAttenddanceListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: DisplayAttenddanceListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedDisplayAttenddanceListData: [DisplayAttenddanceListModel.Fetch.ViewModel.DisplayedDisplayAttenddanceListData] = []
       
        for data in resp.testObj {
        let displayedDisplayAttenddanceListDatas = DisplayAttenddanceListModel.Fetch.ViewModel.DisplayedDisplayAttenddanceListData(ac_year: data.ac_year!,at_id: data.at_id!,attendence_period: data.attendence_period!,class_id: data.class_id!,class_total: data.class_total!,created_at: data.created_at!,created_by: data.created_by!,name: data.name!,no_of_absent: data.no_of_absent!,no_of_present: data.no_of_present!,sent_status: data.sent_status!,status: data.status!,updated_at: data.updated_at!,updated_by: data.updated_by!)
            displayedDisplayAttenddanceListData.append(displayedDisplayAttenddanceListDatas)
        }
        let viewModel = DisplayAttenddanceListModel.Fetch.ViewModel(displayedDisplayAttenddanceListData: displayedDisplayAttenddanceListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
