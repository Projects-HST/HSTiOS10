//
//  GroupListVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 14/09/21.
//

import UIKit

protocol GroupListDisplayLogic: class
{
    func successFetchedItems(viewModel: GroupListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: GroupListModel.Fetch.ViewModel)
}

class GroupListVC: UIViewController, GroupListDisplayLogic {
  
    @IBOutlet weak var tableView: UITableView!
    
    var interactor: GroupListBusinessLogic?
    var displayedGroupListData: [GroupListModel.Fetch.ViewModel.DisplayedGroupListData] = []
    
    var selectedTitle = String()
    var selectedGrpAdmin = String()
    var selectedStatus = String()
    var selectedID = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: GroupListModel.Fetch.Request(user_id :GlobalVariables.shared.user_id, user_type :"1"))
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
        let interactor = GroupListInteractor()
        let presenter = GroupListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    @IBAction func addMemAction(_ sender: Any) {
        
        self.performSegue(withIdentifier: "toAddGroup", sender: self)
    }
}

extension GroupListVC {
    
    func successFetchedItems(viewModel: GroupListModel.Fetch.ViewModel) {
        
        displayedGroupListData = viewModel.displayedGroupListData
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: GroupListModel.Fetch.ViewModel) {
        
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
}

extension GroupListVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedGroupListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GroupListCell
        
        let data = displayedGroupListData[indexPath.row]
        
        cell.group.text = data.group_title
        cell.lead.text = data.lead_name
        cell.statusView.backgroundColor = UIColor.systemGreen
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = displayedGroupListData[indexPath.row]
        
        self.selectedTitle = data.group_title!
        self.selectedGrpAdmin = data.lead_name!
        self.selectedStatus = data.status!
        self.selectedID = data.id!
        self.performSegue(withIdentifier: "groupDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "groupDetails")
        {
        let vc = segue.destination as! GroupDetailsVC
            
            vc.selectedTitle = self.selectedTitle
            vc.selectedGrpAdmin = self.selectedGrpAdmin
            vc.selectedStatus = self.selectedStatus
            vc.selectedID = self.selectedID
            
        }
    }
}
