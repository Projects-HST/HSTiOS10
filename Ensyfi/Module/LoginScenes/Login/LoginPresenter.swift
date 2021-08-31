//
//  LoginPresenter.swift
//  Ensyfi
//
//  Created by HappysanziMac on 19/08/21.
//

import Foundation

protocol LoginPresentationLogic
{
  func presentFetchResults(resp: LoginModel.Fetch.Response)
}

class LoginPresenter: LoginPresentationLogic
{
  weak var viewController: LoginDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: LoginModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = LoginModel.Fetch.ViewModel(status: resp.testObj?.status, institute_id: resp.testObj?.institute_id,institute_logo: resp.testObj?.institute_logo,institute_code: resp.testObj?.institute_code, institute_name: resp.testObj?.institute_name, isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController?.successFetchedItems(viewModel: viewModel)
        }
    }
}

