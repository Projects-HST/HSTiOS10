//
//  SubEventsVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//

import UIKit

protocol SubEventsDisplayLogic: class
{
    func successFetchedItems(viewModel: SubEventsModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: SubEventsModel.Fetch.ViewModel)
}

class SubEventsVC: UIViewController, SubEventsDisplayLogic {
    
    var selectedEventId = String()
    var interactor: SubEventsBusinessLogic?
    var displayedEventsListData: [SubEventsModel.Fetch.ViewModel.DisplayedSubEventsData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: SubEventsModel.Fetch.Request(event_id :self.selectedEventId))
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
        let interactor = SubEventsInteractor()
        let presenter = SubEventsPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}

extension SubEventsVC{
    
    func successFetchedItems(viewModel: SubEventsModel.Fetch.ViewModel) {
        
    }
    
    func errorFetchingItems(viewModel: SubEventsModel.Fetch.ViewModel) {
        
    }
    
}
