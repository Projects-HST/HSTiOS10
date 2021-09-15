//
//  ODTeachersListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 08/09/21.
//

import Foundation

protocol ODTeachersListPresentationLogic
{
  func presentFetchResults(resp:ODTeachersListModel.Fetch.Response)
}

class ODTeachersListPresenter:ODTeachersListPresentationLogic
{
  weak var viewController1: ODTeachersListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: ODTeachersListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedODTeachersListData: [ODTeachersListModel.Fetch.ViewModel.DisplayedODTeachersListData] = []
       
        for data in resp.testObj {
        let displayedODTeachersListDatas = ODTeachersListModel.Fetch.ViewModel.DisplayedODTeachersListData(from_date: data.from_date!,id: data.id!,name: data.name!,notes: data.notes!,od_for: data.od_for!,status: data.status!,to_date: data.to_date!,user_master_id: data.user_master_id!)
            displayedODTeachersListData.append(displayedODTeachersListDatas)
        }
        let viewModel = ODTeachersListModel.Fetch.ViewModel(displayedODTeachersListData: displayedODTeachersListData)
        viewController1?.successFetchedItems(viewModel: viewModel)
    }
}
