//
//  FeesStatusListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/09/21.
//

import Foundation

protocol FeesStatusListPresentationLogic
{
  func presentFetchResults(resp: FeesStatusListModel.Fetch.Response)
}

class FeesStatusListPresenter: FeesStatusListPresentationLogic
{
  weak var viewController: FeesStatusListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:FeesStatusListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedFeesStatusListData: [FeesStatusListModel.Fetch.ViewModel.DisplayedFeesStatusListData] = []
       
        for data in resp.testObj {
        let displayedFeesStatusListDatas = FeesStatusListModel.Fetch.ViewModel.DisplayedFeesStatusListData(student_id: data.student_id!,name: data.name!,id: data.id!,quota_name: data.quota_name!,status: data.status!,quota_id: data.quota_id!,updated_at: data.updated_at!,paid_by: data.paid_by!)
            displayedFeesStatusListData.append(displayedFeesStatusListDatas)
        }
        let viewModel = FeesStatusListModel.Fetch.ViewModel(displayedFeesStatusListData: displayedFeesStatusListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}

