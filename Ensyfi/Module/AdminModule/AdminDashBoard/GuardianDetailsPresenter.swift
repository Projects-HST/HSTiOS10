//
//  GuardianDetailsPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 04/09/21.
//

import Foundation

protocol GuardianDetailsPresentationLogic
{
  func presentFetchResults(resp: GuardianDetailsModel.Fetch.Response)
}

class GuardianDetailsPresenter: GuardianDetailsPresentationLogic
{
  weak var viewController3: GuardianDetailsDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: GuardianDetailsModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = GuardianDetailsModel.Fetch.ViewModel(email: resp.testObj?.email, id: resp.testObj?.id,relationship: resp.testObj?.relationship,office_phone: resp.testObj?.office_phone, mobile: resp.testObj?.mobile,home_phone: resp.testObj?.home_phone,home_address: resp.testObj?.home_address, name: resp.testObj?.name, occupation: resp.testObj?.occupation, income: resp.testObj?.income, status: resp.testObj?.status, user_pic: resp.testObj?.user_pic, msg: resp.testObj?.msg, isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController3?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController3?.successFetchedItems(viewModel: viewModel)
        }
    }
}
