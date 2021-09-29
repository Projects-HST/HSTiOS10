//
//  HomeWorkDetailsPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/09/21.
//

import Foundation

protocol HomeWorkDetailsPresentationLogic
{
  func presentFetchResults(resp: HomeWorkDetailsModel.Fetch.Response)
}

class HomeWorkDetailsPresenter: HomeWorkDetailsPresentationLogic
{
  weak var viewController: HomeWorkDetailsDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:HomeWorkDetailsModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedHomeWorkDetailsData: [HomeWorkDetailsModel.Fetch.ViewModel.DisplayedHomeWorkDetailsData] = []
       
        for data in resp.testObj {
        let displayedHomeWorkDetailsDatas = HomeWorkDetailsModel.Fetch.ViewModel.DisplayedHomeWorkDetailsData(due_date: data.due_date!,hw_details: data.hw_details!,hw_id: data.hw_id!,hw_type: data.hw_type!,mark_status: data.mark_status!,subject_name: data.subject_name!,test_date: data.test_date!,title: data.title!)
            displayedHomeWorkDetailsData.append(displayedHomeWorkDetailsDatas)
        }
        let viewModel = HomeWorkDetailsModel.Fetch.ViewModel(displayedHomeWorkDetailsData: displayedHomeWorkDetailsData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
