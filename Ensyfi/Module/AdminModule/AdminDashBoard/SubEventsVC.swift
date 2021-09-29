//
//  SubEventsVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//

import UIKit
import MBProgressHUD

protocol SubEventsDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: SubEventsModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: SubEventsModel.Fetch.ViewModel)
}

class SubEventsVC: UIViewController, SubEventsDisplayLogic {
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedEventId = String()
    var interactor: SubEventsBusinessLogic?
    var displayedSubEventsData: [SubEventsModel.Fetch.ViewModel.DisplayedSubEventsData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: SubEventsModel.Fetch.Request(event_id :self.selectedEventId))
        MBProgressHUD.showAdded(to: self.view, animated: true)
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
        
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedSubEventsData = viewModel.displayedSubEventsData
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: SubEventsModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
}
extension SubEventsVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedSubEventsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SubEventListCell
        
        let data = displayedSubEventsData[indexPath.row]
         
        cell.title.text = data.sub_event_name
        cell.name.text = data.name
        cell.selectionStyle = .none
        
        return cell
    }
}
