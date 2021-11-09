//
//  TeacherSubstPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/10/21.
//

import Foundation

protocol TeacherSubstutionListPresentationLogic
{
  func presentFetchResults(resp: TeacherSubstutionListModel.Fetch.Response)
}

class TeacherSubstutionListPresenter:TeacherSubstutionListPresentationLogic
{
  weak var viewController:TeacherSubstutionListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: TeacherSubstutionListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedTeacherSubstutionListData: [TeacherSubstutionListModel.Fetch.ViewModel.DisplayedTeacherSubstutionListData] = []
       
        for data in resp.testObj {
        let displayedTeacherSubstutionListDatas = TeacherSubstutionListModel.Fetch.ViewModel.DisplayedTeacherSubstutionListData(class_sec_name: data.class_sec_name!,class_sec_id: data.class_sec_id!,sub_date: data.sub_date!,period: data.period!)
            displayedTeacherSubstutionListData.append(displayedTeacherSubstutionListDatas)
        }
        let viewModel = TeacherSubstutionListModel.Fetch.ViewModel(displayedTeacherSubstutionListData: displayedTeacherSubstutionListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
