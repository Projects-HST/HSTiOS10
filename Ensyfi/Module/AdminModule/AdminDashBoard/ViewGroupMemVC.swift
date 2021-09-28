//
//  ViewGroupMemVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 15/09/21.
//

import UIKit

protocol GroupMembersListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: GroupMembersListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: GroupMembersListModel.Fetch.ViewModel)
}

class ViewGroupMemVC: UIViewController, GroupMembersListDisplayLogic {
 
    @IBOutlet weak var tableView: UITableView!
    
    var selectedID = String()
    var interactor: GroupMembersListBusinessLogic?
    var displayedGroupMembersListData: [GroupMembersListModel.Fetch.ViewModel.DisplayedGroupMembersListData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: GroupMembersListModel.Fetch.Request(group_id :self.selectedID))
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
        let interactor = GroupMembersListInteractor()
        let presenter = GroupMembersListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}

extension ViewGroupMemVC {
    
    func successFetchedItems(viewModel: GroupMembersListModel.Fetch.ViewModel) {
        
        displayedGroupMembersListData = viewModel.displayedGroupMembersListData
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: GroupMembersListModel.Fetch.ViewModel) {
        
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
}

extension ViewGroupMemVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedGroupMembersListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GroupMembersListCell
        
        let data = displayedGroupMembersListData[indexPath.row]
       
        cell.member.text = data.user_type_name
        cell.role.text = data.name
        cell.selectionStyle = .none
        
        return cell
    }
}
