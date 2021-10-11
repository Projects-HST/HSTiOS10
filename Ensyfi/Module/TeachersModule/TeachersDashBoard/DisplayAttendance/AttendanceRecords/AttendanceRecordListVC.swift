//
//  AttendanceRecordListVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 11/10/21.
//

import UIKit
import MBProgressHUD

protocol AttendanceRecordListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: AttendanceRecordListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: AttendanceRecordListModel.Fetch.ViewModel)
}

class AttendanceRecordListVC: UIViewController, AttendanceRecordListDisplayLogic {

    @IBOutlet weak var tableView: UITableView!
    
    var selectedClassid = String()
    var selectedid = String()
    var interactor: AttendanceRecordListBusinessLogic?
    var displayedAttendanceRecordListData: [AttendanceRecordListModel.Fetch.ViewModel.DisplayedAttendanceRecordListData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: AttendanceRecordListModel.Fetch.Request(class_id :self.selectedClassid,attend_id:self.selectedid))
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
        let interactor = AttendanceRecordListInteractor()
        let presenter = AttendanceRecordListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}

extension AttendanceRecordListVC {
    
    func successFetchedItems(viewModel: AttendanceRecordListModel.Fetch.ViewModel) {
        displayedAttendanceRecordListData = viewModel.displayedAttendanceRecordListData
        MBProgressHUD.hide(for: self.view, animated: true)
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: AttendanceRecordListModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
}

extension AttendanceRecordListVC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedAttendanceRecordListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DisplayAttendanceCell
            
            let data = displayedAttendanceRecordListData[indexPath.row]
            cell.Atendate.text = data.created_at
            cell.classStrength.text = "Class strength : \(data.class_total!)"
            cell.noAbsent.text = "No.of absent : \(data.no_of_absent!)"
            cell.noPresent.text = "No.of present : \(data.no_of_present!)"
        
        return cell
    }
}
