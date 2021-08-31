//
//  StudentsDetailsPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/08/21.
//

import Foundation

protocol StudentDetailsPresentationLogic
{
  func presentFetchResults(resp: StudentDetailsModel.Fetch.Response)
}

class StudentDetailsPresenter: StudentDetailsPresentationLogic
{
  weak var viewController: StudentDetailsDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: StudentDetailsModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedStudentDetailsData: [StudentDetailsModel.Fetch.ViewModel.DisplayedStudentDetailsData] = []
       
        for data in resp.testObj {
            let displayedStudentDetailsDatas = StudentDetailsModel.Fetch.ViewModel.DisplayedStudentDetailsData(admisn_no: data.admisn_no!,parnt_guardn_id: data.parnt_guardn_id!,emsi_num: data.emsi_num!,parnt_guardn: data.parnt_guardn!,community: data.community!,community_class: data.community_class!,parents_status: data.parents_status!,last_studied: data.last_studied!,sec_mobile: data.sec_mobile!,transfer_certificate: data.transfer_certificate!,admisn_date: data.admisn_date!,nationality: data.nationality!,sex: data.sex!,updated_by: data.updated_by!,updated_at: data.updated_at!,last_sch_name: data.last_sch_name!,status: data.status!,enrollment: data.enrollment!,admission_id: data.admission_id!,dob: data.dob!,email: data.email!,mother_tongue: data.mother_tongue!,tccopy: data.tccopy!,blood_group: data.blood_group!,sec_email: data.sec_email!,student_pic: data.student_pic!,religion: data.religion!,language: data.language!, name: data.name!,age: data.age!,record_sheet: data.record_sheet!,qualified_promotion: data.qualified_promotion!,admisn_year: data.admisn_year!,mobile: data.mobile!)
            displayedStudentDetailsData.append(displayedStudentDetailsDatas)
        }
        
        let viewModel = StudentDetailsModel.Fetch.ViewModel(displayedStudentDetailsData: displayedStudentDetailsData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
