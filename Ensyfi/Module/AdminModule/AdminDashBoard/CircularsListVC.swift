//
//  CircularsListVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 04/09/21.
//

import UIKit
import MBProgressHUD
import SideMenu

protocol CircularsListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: CircularsListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: CircularsListModel.Fetch.ViewModel)
}

class CircularsListVC: UIViewController, CircularsListDisplayLogic,SideMenuNavigationControllerDelegate {
  
    @IBOutlet weak var tableView: UITableView!
    
    var interactor: CircularsListBusinessLogic?
    var displayedCircularsListData: [CircularsListModel.Fetch.ViewModel.DisplayedCircularsListData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: CircularsListModel.Fetch.Request(user_id :"",dynamic_db: GlobalVariables.shared.dynamic_db))
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func sideMenuWillAppear(menu: SideMenuNavigationController, animated: Bool) {
        view.alpha = 0.8
    }
    
    func sideMenuWillDisappear(menu: SideMenuNavigationController, animated: Bool) {
           view.alpha = 1
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
        let interactor = CircularsListInteractor()
        let presenter = CircularsListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}

extension CircularsListVC {
    
    func successFetchedItems(viewModel: CircularsListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedCircularsListData = viewModel.displayedCircularsListData
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: CircularsListModel.Fetch.ViewModel) {
       
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
}

extension CircularsListVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedCircularsListData.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CircularsListCell
        
        let data = displayedCircularsListData[indexPath.row]
         
        cell.title.text = data.circular_title
        cell.details.text = data.circular_description
        cell.date.text = data.circular_date
        cell.type.text = data.circular_type
        cell.selectionStyle = .none
        
        return cell
    }
}
