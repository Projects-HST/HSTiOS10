//
//  TeacherDetailsPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 02/09/21.
//

import Foundation

protocol TeacherDetailsPresentationLogic
{
  func presentFetchResults(resp: TeacherDetailsModel.Fetch.Response)
}

class TeacherDetailsPresenter: TeacherDetailsPresentationLogic
{
  weak var viewController: TeacherDetailsDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: TeacherDetailsModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedTeacherDetailsData: [TeacherDetailsModel.Fetch.ViewModel.DisplayedTeacherDetailsData] = []
       
        for data in resp.testObj {
            let displayedTeacherDetailsDatas = TeacherDetailsModel.Fetch.ViewModel.DisplayedTeacherDetailsData(teacher_id: data.teacher_id!,name: data.name!,sex: data.sex!,age: data.age!,nationality: data.nationality!,religion: data.religion!,community_class: data.community_class!,community: data.community!,address: data.address!,email: data.email!,phone: data.phone!,sec_email: data.sec_email!,sec_phone: data.sec_phone!,profile_pic: data.profile_pic!,update_at: data.update_at!,subject: data.subject!,class_taken: data.class_taken!,class_teacher: data.class_teacher!)
            displayedTeacherDetailsData.append(displayedTeacherDetailsDatas)
        }
        
        let viewModel = TeacherDetailsModel.Fetch.ViewModel(displayedTeacherDetailsData: displayedTeacherDetailsData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
