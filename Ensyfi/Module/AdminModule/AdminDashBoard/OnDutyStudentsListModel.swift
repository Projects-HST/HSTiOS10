//
//  OnDutyListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 04/09/21.
//

import Foundation

protocol ODStudentsListPresentationLogic
{
  func presentFetchResults(resp: ODStudentsListModel.Fetch.Response)
}

class ODStudentsListPresenter: ODStudentsListPresentationLogic
{
  weak var viewController: ODStudentsListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: ODStudentsListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedODStudentsListData: [ODStudentsListModel.Fetch.ViewModel.DisplayedODStudentsListData] = []
       
        for data in resp.testObj {
        let displayedODStudentsListDatas = ODStudentsListModel.Fetch.ViewModel.DisplayedODStudentsListData(class_name: data.class_name!,from_date: data.from_date!,id: data.id!,name: data.name!,notes: data.notes!,od_for: data.od_for!,sec_name: data.sec_name!,status: data.status!,to_date: data.to_date!,user_id: data.user_id!,user_master_id: data.user_master_id!)
            displayedODStudentsListData.append(displayedODStudentsListDatas)
        }
        let viewModel = ODStudentsListModel.Fetch.ViewModel(displayedODStudentsListData: displayedODStudentsListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
