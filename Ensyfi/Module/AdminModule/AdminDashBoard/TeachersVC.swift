//
//  TeachersVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/08/21.
//

import UIKit

protocol TeachersListDisplayLogic: class
{
    func successFetchedItems(viewModel: TeachersListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: TeachersListModel.Fetch.ViewModel)
}

class TeachersVC: UIViewController,TeachersListDisplayLogic {
   
    var interactor: TeachersListBusinessLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: TeachersListModel.Fetch.Request(user_id :""))
        print("1234")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup()
    {
        let viewController = self
        let interactor = TeachersListInteractor()
        let presenter = TeachersListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}
    
extension TeachersVC {
    
    func successFetchedItems(viewModel: TeachersListModel.Fetch.ViewModel) {
        
    }
    
    func errorFetchingItems(viewModel: TeachersListModel.Fetch.ViewModel) {
        
    }
}
