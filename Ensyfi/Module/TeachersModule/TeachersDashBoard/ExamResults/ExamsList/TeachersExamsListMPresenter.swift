//
//  TeachersExamsListMPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 19/10/21.
//

import Foundation

protocol TeachersExamsListPresentationLogic
{
  func presentFetchResults(resp: TeachersExamsListModel.Fetch.Response)
}

class TeachersExamsListPresenter: TeachersExamsListPresentationLogic
{
  weak var viewController: TeachersExamsListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: TeachersExamsListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedTeachersExamsListData: [TeachersExamsListModel.Fetch.ViewModel.DisplayedTeachersExamsListData] = []
       
        for data in resp.testObj {
        let displayedTeachersExamsListDatas = TeachersExamsListModel.Fetch.ViewModel.DisplayedTeachersExamsListData(exam_id: data.exam_id!,exam_name: data.exam_name!,subject_name: data.subject_name!,subject_id: data.subject_id!,exam_date: data.exam_date!,times: data.times!,is_internal_external: data.is_internal_external!,subject_total: data.subject_total!,internal_mark: data.internal_mark!,external_mark: data.external_mark!,classmaster_id: data.classmaster_id!,class_name: data.class_name!,sec_name: data.sec_name!)
            displayedTeachersExamsListData.append(displayedTeachersExamsListDatas)
        }
        let viewModel = TeachersExamsListModel.Fetch.ViewModel(displayedTeachersExamsListData: displayedTeachersExamsListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
