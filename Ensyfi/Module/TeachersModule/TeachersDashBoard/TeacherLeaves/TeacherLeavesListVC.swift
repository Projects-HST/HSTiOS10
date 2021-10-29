//
//  TeacherLeavesListVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 27/10/21.
//

import UIKit
import MBProgressHUD

protocol TeacherLeavesListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: TeacherLeavesListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: TeacherLeavesListModel.Fetch.ViewModel)
}

class TeacherLeavesListVC: UIViewController,TeacherLeavesListDisplayLogic {
    
    @IBOutlet weak var tableView: UITableView!
    
    var interactor: TeacherLeavesListBusinessLogic?
    var displayedTeacherLeavesListData: [TeacherLeavesListModel.Fetch.ViewModel.DisplayedTeacherLeavesListData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: TeacherLeavesListModel.Fetch.Request(user_id :GlobalVariables.shared.user_id))
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
        let interactor = TeacherLeavesListInteractor()
        let presenter = TeacherLeavesListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    @IBAction func leaveApplyAction(_ sender: Any) {
        self.performSegue(withIdentifier: "to_requestLeave", sender: self)
    }
}

extension TeacherLeavesListVC {
    
    func successFetchedItems(viewModel: TeacherLeavesListModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedTeacherLeavesListData = viewModel.displayedTeacherLeavesListData
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: TeacherLeavesListModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
}

extension TeacherLeavesListVC : UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
        return displayedTeacherLeavesListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LeavesListCell
        
            let data = displayedTeacherLeavesListData[indexPath.row]
            cell.title.text = "\(data.name!) - \(data.leave_title!)"
            cell.date.text = "\(data.from_leave_date!) - \(data.to_leave_date!)"
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
}
