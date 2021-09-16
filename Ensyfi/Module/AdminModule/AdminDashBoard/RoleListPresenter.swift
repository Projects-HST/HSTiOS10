//
//  RoleListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 16/09/21.
//

import Foundation

protocol RoleListPresentationLogic
{
  func presentFetchResults(resp: RoleListModel.Fetch.Response)
}

class RoleListPresenter: RoleListPresentationLogic
{
  weak var viewController: RoleListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:RoleListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedRoleListData: [RoleListModel.Fetch.ViewModel.DisplayedRoleListData] = []
       
        for data in resp.testObj {
            let displayedRoleListDatas = RoleListModel.Fetch.ViewModel.DisplayedRoleListData(role_id: data.role_id!, staff_status: data.staff_status!,user_type_name: data.user_type_name!,status: data.status!)
            displayedRoleListData.append(displayedRoleListDatas)
        }
        let viewModel = RoleListModel.Fetch.ViewModel(displayedRoleListData: displayedRoleListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
