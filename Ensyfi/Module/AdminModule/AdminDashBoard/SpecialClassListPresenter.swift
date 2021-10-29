//
//  SpecialClassListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/10/21.
//


import Foundation

protocol SpecialClassListPresentationLogic
{
  func presentFetchResults(resp: SpecialClassListModel.Fetch.Response)
}

class SpecialClassListPresenter: SpecialClassListPresentationLogic
{
  weak var viewController: SpecialClassListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: SpecialClassListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedSpecialClassListData: [SpecialClassListModel.Fetch.ViewModel.DisplayedSpecialClassListData] = []
       
        for data in resp.testObj {
        let displayedSpecialClassListtDatas = SpecialClassListModel.Fetch.ViewModel.DisplayedSpecialClassListData(special_class_date: data.special_class_date!,status: data.status!,end_time: data.end_time!,subject_name: data.subject_name!,class_sec_id: data.class_sec_id!,start_time: data.start_time!,class_sec_name: data.class_sec_name!,subject_topic: data.subject_topic!)
            displayedSpecialClassListData.append(displayedSpecialClassListtDatas)
        }
        let viewModel = SpecialClassListModel.Fetch.ViewModel(displayedSpecialClassListData: displayedSpecialClassListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
