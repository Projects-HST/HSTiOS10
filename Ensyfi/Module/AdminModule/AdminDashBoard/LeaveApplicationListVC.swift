//
//  LeaveApplicationListVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 20/09/21.
//

import UIKit
import MBProgressHUD

protocol LeavesListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: LeavesListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: LeavesListModel.Fetch.ViewModel)
}

class LeaveApplicationListVC: UIViewController, LeavesListDisplayLogic {
   
    var interactor: LeavesListBusinessLogic?
    var displayedLeavesListData: [LeavesListModel.Fetch.ViewModel.DisplayedLeavesListData] = []
    
    var selectedLeaveType = String()
    var selectedfromDate = String()
    var selectedtoDate = String()
    var selectedStatus = String()
    var selectedId = String()
    var selectedDescription = String()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: LeavesListModel.Fetch.Request(user_id :GlobalVariables.shared.user_id))
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
        let interactor = LeavesListInteractor()
        let presenter = LeavesListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}

extension LeaveApplicationListVC {
    
    func successFetchedItems(viewModel: LeavesListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedLeavesListData = viewModel.displayedLeavesListData
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: LeavesListModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}

extension LeaveApplicationListVC : UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
        return displayedLeavesListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LeavesListCell
        
            let data = displayedLeavesListData[indexPath.row]
            cell.title.text = "\(data.name!) - \(data.leave_title!)"
            cell.date.text = "\(data.from_leave_date!) - \(data.from_leave_date!)"
            cell.status.text = data.status
            
            if data.status == "Approved" {
                cell.status.textColor = UIColor.systemGreen
                cell.statusView.backgroundColor = UIColor.systemGreen
                cell.statusImg.image = UIImage(named:"Completed ")
            }
            else if data.status == "Rejected" {
                cell.status.textColor = UIColor.systemRed
                cell.statusView.backgroundColor = UIColor.systemRed
                cell.statusImg.image = UIImage(named:"rejected")
            }
            else if data.status == "Pending" {
                cell.status.textColor = UIColor.systemYellow
                cell.statusView.backgroundColor = UIColor.systemYellow
                cell.statusImg.image = UIImage(named:"pending")
            }
            cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = displayedLeavesListData[indexPath.row]
            self.selectedLeaveType = data.leave_title!
            self.selectedfromDate = data.from_leave_date!
            self.selectedtoDate = data.from_leave_date!
            self.selectedStatus = data.status!
            self.selectedId = data.leave_id!
            self.selectedDescription = data.leave_description!
        
            self.performSegue(withIdentifier: "to_leaveAprroval", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "to_leaveAprroval")
        {
        let vc = segue.destination as! LeaveApprovalVC
            
            vc.selectedLeaveType = self.selectedLeaveType
            vc.selectedfromDate = self.selectedfromDate
            vc.selectedtoDate = self.selectedtoDate
            vc.selectedStatus = self.selectedStatus
            vc.selectedId = self.selectedId
            vc.selectedDescription = self.selectedDescription
        }
    }
}

