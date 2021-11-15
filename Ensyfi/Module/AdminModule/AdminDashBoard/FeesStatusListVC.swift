//
//  FeesStatusListVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/09/21.
//

import UIKit
import MBProgressHUD

protocol FeesStatusListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: FeesStatusListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: FeesStatusListModel.Fetch.ViewModel)
}

class FeesStatusListVC: UIViewController, FeesStatusListDisplayLogic {
   
    @IBOutlet weak var tableView: UITableView!
    
    var interactor: FeesStatusListBusinessLogic?
    var displayedFeesStatusListData: [FeesStatusListModel.Fetch.ViewModel.DisplayedFeesStatusListData] = []
    
    var selectedClassId = String()
    var selectedSecId = String()
    var selectedFeesId = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: FeesStatusListModel.Fetch.Request(class_id:self.selectedClassId , section_id: self.selectedSecId,fees_id:self.selectedFeesId,dynamic_db: GlobalVariables.shared.dynamic_db))
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
        let interactor = FeesStatusListInteractor()
        let presenter = FeesStatusListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}

extension FeesStatusListVC {
    
    func successFetchedItems(viewModel: FeesStatusListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedFeesStatusListData = viewModel.displayedFeesStatusListData
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: FeesStatusListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"An error occured", complition: {
        })
    }
}

extension FeesStatusListVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedFeesStatusListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeesStatusListCell
        
        let data = displayedFeesStatusListData[indexPath.row]
        
        cell.name.text = data.name
        cell.quota.text = "Quota :\(data.quota_name!)"
        
        if data.status == "Unpaid"{
            cell.status.textColor = UIColor.systemRed
            cell.statusView.backgroundColor = UIColor.systemRed
        }
        else {
            cell.status.textColor = UIColor.systemGreen
            cell.statusView.backgroundColor = UIColor.systemGreen
        }
        cell.status.text = data.status
        cell.selectionStyle = .none
        return cell
    }
}
