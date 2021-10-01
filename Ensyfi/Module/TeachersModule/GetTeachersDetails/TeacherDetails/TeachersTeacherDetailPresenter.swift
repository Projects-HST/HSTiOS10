//
//  TeachersTeacherDetailPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/09/21.
//

import Foundation

protocol GetTeacherDetailsPresentationLogic
{
  func presentFetchResults(resp: GetTeacherDetailsModel.Fetch.Response)
}

class GetTeacherDetailsPresenter: GetTeacherDetailsPresentationLogic
{
  weak var viewController1: GetTeacherDetailsDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: GetTeacherDetailsModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedGetTeacherDetailsData: [GetTeacherDetailsModel.Fetch.ViewModel.DisplayedGetTeacherDetailsData] = []
       
        for data in resp.testObj {
            let displayedGetTeacherDetailsDatas = GetTeacherDetailsModel.Fetch.ViewModel.DisplayedGetTeacherDetailsData(teacher_id: data.teacher_id!,name: data.name!,sex: data.sex!,age: data.age!,nationality: data.nationality!,religion: data.religion!,community_class: data.community_class!,community: data.community!,address: data.address!,email: data.email!,phone: data.phone!,sec_email: data.sec_email!,sec_phone: data.sec_phone!,profile_pic: data.profile_pic!,update_at: data.update_at!,subject: data.subject!,class_taken: data.class_taken!,class_teacher: data.class_teacher!)
            displayedGetTeacherDetailsData.append(displayedGetTeacherDetailsDatas)
        }
        
        let viewModel = GetTeacherDetailsModel.Fetch.ViewModel(displayedGetTeacherDetailsData: displayedGetTeacherDetailsData)
        viewController1?.successFetchedItems(viewModel: viewModel)
    }
}
