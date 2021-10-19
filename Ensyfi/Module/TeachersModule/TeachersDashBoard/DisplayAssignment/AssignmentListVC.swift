//
//  AssignmentListVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 12/10/21.
//

import UIKit
import MBProgressHUD

protocol AssignmentListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: AssignmentListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: AssignmentListModel.Fetch.ViewModel)
}

class AssignmentListVC: UIViewController, AssignmentListDisplayLogic {
  
    @IBOutlet weak var tableView: UITableView!
    
    var interactor: AssignmentListBusinessLogic?
    var displayedAssignmentListtData: [AssignmentListModel.Fetch.ViewModel.DisplayedAssignmentListData] = []
    var class_id = String()
    var hw_date = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: AssignmentListModel.Fetch.Request(class_id :"1"))
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
        let interactor = AssignmentListInteractor()
        let presenter = AssignmentListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}

extension AssignmentListVC {
    
    func successFetchedItems(viewModel: AssignmentListModel.Fetch.ViewModel) {
        displayedAssignmentListtData = viewModel.displayedAssignmentListData
        MBProgressHUD.hide(for: self.view, animated: true)
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: AssignmentListModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
}

extension AssignmentListVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedAssignmentListtData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AssignmentListCell
            
        let data = displayedAssignmentListtData[indexPath.row]
        cell.asignmentDate.text = data.hw_date
        cell.classTest.text = "Classtest \(data.ht_count!)"
        cell.homeWork.text = "Homework \(data.hw_count!)"
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = displayedAssignmentListtData[indexPath.row]
        self.hw_date = data.hw_date!
        self.performSegue(withIdentifier: "to_assignmentoverView", sender: self)
//        self.selectedClassTotale = data.class_total!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "to_assignmentoverView")
        {
        let vc = segue.destination as! AssignmentOverViewVC
            
            vc.class_id = self.class_id
            vc.hw_date = self.hw_date
        }
    }
}
