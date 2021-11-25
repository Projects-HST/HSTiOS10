//
//  GroupNotificationListVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 20/11/21.
//

import UIKit
import MBProgressHUD

protocol GroupNotificationListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: GroupNotificationListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: GroupNotificationListModel.Fetch.ViewModel)
}

class GroupNotificationListVC: UIViewController, GroupNotificationListDisplayLogic {
   
    @IBOutlet weak var tableView: UITableView!
    
    var groupId = String()
    var interactor: GroupNotificationListBusinessLogic?
    var displayedGroupNotificationListData: [GroupNotificationListModel.Fetch.ViewModel.DisplayedGroupNotificationListData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: GroupNotificationListModel.Fetch.Request(group_id :GlobalVariables.shared.user_id,dynamic_db:GlobalVariables.shared.dynamic_db))
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
        let interactor = GroupNotificationListInteractor()
        let presenter = GroupNotificationListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    @IBAction func sendAction(_ sender: Any) {
        self.performSegue(withIdentifier: "to_sendNotification", sender: self)
    }
}

extension GroupNotificationListVC {
    
    func successFetchedItems(viewModel: GroupNotificationListModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedGroupNotificationListData = viewModel.displayedGroupNotificationListData
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: GroupNotificationListModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
}

extension GroupNotificationListVC:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedGroupNotificationListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GroupNotificationListCell
        let data = displayedGroupNotificationListData[indexPath.row]
        
        cell.titleLbl.text = data.group_title
        cell.date.text = data.created_at
        cell.msgType.text = data.notification_type
        cell.desc.text = data.notes
        
        cell.selectionStyle = .none
        return cell
    }
}
