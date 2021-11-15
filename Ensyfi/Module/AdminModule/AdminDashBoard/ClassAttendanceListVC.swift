//
//  ClassAttendanceListVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 27/09/21.
//

import UIKit
import MBProgressHUD

protocol ClassAttendanceListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: ClassAttendanceListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: ClassAttendanceListModel.Fetch.ViewModel)
}

class ClassAttendanceListVC: UIViewController, ClassAttendanceListDisplayLogic {
   
    @IBOutlet weak var tableView: UITableView!
    
    var interactor: ClassAttendanceListBusinessLogic?
    var selectedDate = String()
    var selectedClassID = String()
    var displayedClassAttendanceListData: [ClassAttendanceListModel.Fetch.ViewModel.DisplayedClassAttendanceListData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: ClassAttendanceListModel.Fetch.Request(date:self.selectedDate, class_ids:self.selectedClassID,dynamic_db: GlobalVariables.shared.dynamic_db))
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
        let interactor = ClassAttendanceListInteractor()
        let presenter = ClassAttendanceListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}

extension ClassAttendanceListVC {
    
    func successFetchedItems(viewModel: ClassAttendanceListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedClassAttendanceListData = viewModel.displayedClassAttendanceListData
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: ClassAttendanceListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"An error occured", complition: {
        })
    }
}

extension ClassAttendanceListVC :UITableViewDelegate,UITableViewDataSource  {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedClassAttendanceListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ClassAttendanceListCell
    
          let data = displayedClassAttendanceListData[indexPath.row]
          cell.className.text = data.class_name
          cell.selectionStyle = .none
        
        if data.status == "No"{
            cell.status.text = "Attendance not taken"
        }
        return cell
     }
}


