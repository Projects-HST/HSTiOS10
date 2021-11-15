//
//  TeacherGroupListVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/10/21.
//

import UIKit
import MBProgressHUD

protocol TeacherGroupListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: TeacherGroupListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: TeacherGroupListModel.Fetch.ViewModel)
}

class TeacherGroupListVC: UIViewController, TeacherGroupListDisplayLogic {
  
    @IBOutlet weak var tableView: UITableView!
    
    var interactor: TeacherGroupListBusinessLogic?
    var displayedTeacherGroupListData: [TeacherGroupListModel.Fetch.ViewModel.DisplayedTeacherGroupListData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: TeacherGroupListModel.Fetch.Request(user_id :GlobalVariables.shared.user_id,user_type:GlobalVariables.shared.user_type,dynamic_db: GlobalVariables.shared.dynamic_db))
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
        let interactor = TeacherGroupListInteractor()
        let presenter = TeacherGroupListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    @IBAction func sendNotification(_ sender: Any) {
        self.performSegue(withIdentifier: "to_sendGroupMsg", sender: self)
    }
}

extension TeacherGroupListVC {
    
    func successFetchedItems(viewModel:TeacherGroupListModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedTeacherGroupListData = viewModel.displayedTeacherGroupListData
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel:TeacherGroupListModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
}

extension TeacherGroupListVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedTeacherGroupListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TeacherGroupListCell
            
        let data = displayedTeacherGroupListData[indexPath.row]
        cell.titleLbl.text = data.group_title
        cell.date.text = data.created_at
        cell.msgLbl.text = data.notes
        cell.selectionStyle = .none
        
        return cell
    }
    
}
