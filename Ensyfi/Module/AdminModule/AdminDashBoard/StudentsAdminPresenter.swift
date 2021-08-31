//
//  StudentsAdminPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 24/08/21.
//

import Foundation

protocol ClassViewPresentationLogic
{
  func presentFetchResults(resp: ClassViewModel.Fetch.Response)
}

class ClassViewPresenter: ClassViewPresentationLogic
{
  weak var viewController: ClassViewDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: ClassViewModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedClassViewData: [ClassViewModel.Fetch.ViewModel.DisplayedClassViewData] = []
       
        for data in resp.testObj {
        let displayedClassViewDatas = ClassViewModel.Fetch.ViewModel.DisplayedClassViewData(class_id: data.class_id!,class_name: data.class_name!)
            displayedClassViewData.append(displayedClassViewDatas)
        }
        let viewModel = ClassViewModel.Fetch.ViewModel(displayedClassViewData: displayedClassViewData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
