//
//  InstituteLoginPresenter.swift
//  Ensyfi
//
//  Created by HappysanziMac on 19/08/21.
//

import Foundation

protocol InstituteLoginPresentationLogic
{
  func presentFetchResults(resp: InstituteLoginModel.Fetch.Response)
}

class InstituteLoginPresenter: InstituteLoginPresentationLogic
{
  weak var viewController: InstituteLoginDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: InstituteLoginModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = InstituteLoginModel.Fetch.ViewModel(name: resp.testObj?.name, status: resp.testObj?.status,user_id: resp.testObj?.user_id,user_name: resp.testObj?.user_name, user_pic: resp.testObj?.user_pic,user_type: resp.testObj?.user_type,year_id: resp.testObj?.year_id, msg: resp.testObj?.msg, user_type_name: resp.testObj?.user_type_name, isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController?.successFetchedItems(viewModel: viewModel)
        }
    }
}
