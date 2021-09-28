//
//  ClassSectionListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 27/09/21.
//

import Foundation

protocol Class_SectionPresentationLogic
{
  func presentFetchResults(resp: Class_SectionModel.Fetch.Response)
}

class Class_SectionPresenter: Class_SectionPresentationLogic
{
  weak var viewController: Class_SectionDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: Class_SectionModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedClass_SectionData: [Class_SectionModel.Fetch.ViewModel.DisplayedClass_SectionData] = []
       
        for data in resp.testObj {
        let displayedClass_SectionDatas = Class_SectionModel.Fetch.ViewModel.DisplayedClass_SectionData(class_sec_id: data.class_sec_id!,class_name: data.class_name!)
            displayedClass_SectionData.append(displayedClass_SectionDatas)
        }
        let viewModel = Class_SectionModel.Fetch.ViewModel(displayedClass_SectionData: displayedClass_SectionData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
