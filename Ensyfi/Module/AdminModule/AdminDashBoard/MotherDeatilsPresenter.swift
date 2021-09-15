//
//  MotherDeatilsPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 04/09/21.
//

import Foundation

protocol MotherDetailsPresentationLogic
{
  func presentFetchResults(resp: MotherDetailsModel.Fetch.Response)
}

class MotherDetailsPresenter: MotherDetailsPresentationLogic
{
  weak var viewController2: MotherDetailsDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: MotherDetailsModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = MotherDetailsModel.Fetch.ViewModel(email: resp.testObj?.email, id: resp.testObj?.id,relationship: resp.testObj?.relationship,office_phone: resp.testObj?.office_phone, mobile: resp.testObj?.mobile,home_phone: resp.testObj?.home_phone,home_address: resp.testObj?.home_address, name: resp.testObj?.name, occupation: resp.testObj?.occupation, income: resp.testObj?.income, status: resp.testObj?.status, user_pic: resp.testObj?.user_pic, msg: resp.testObj?.msg, isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController2?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController2?.successFetchedItems(viewModel: viewModel)
        }
    }
}
