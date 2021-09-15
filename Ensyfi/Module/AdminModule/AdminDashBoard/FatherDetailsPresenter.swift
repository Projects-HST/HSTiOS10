//
//  ParentDetailsPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//

import Foundation

protocol FatherDeatilsPresentationLogic
{
  func presentFetchResults(resp: FatherDeatilsModel.Fetch.Response)
}

class FatherDeatilsPresenter: FatherDeatilsPresentationLogic
{
  weak var viewController: FatherDeatilsDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: FatherDeatilsModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = FatherDeatilsModel.Fetch.ViewModel(email: resp.testObj?.email, id: resp.testObj?.id,relationship: resp.testObj?.relationship,office_phone: resp.testObj?.office_phone, mobile: resp.testObj?.mobile,home_phone: resp.testObj?.home_phone,home_address: resp.testObj?.home_address, name: resp.testObj?.name, occupation: resp.testObj?.occupation, income: resp.testObj?.income, status: resp.testObj?.status, user_pic: resp.testObj?.user_pic, msg: resp.testObj?.msg, isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController?.successFetchedItems(viewModel: viewModel)
        }
    }
}
