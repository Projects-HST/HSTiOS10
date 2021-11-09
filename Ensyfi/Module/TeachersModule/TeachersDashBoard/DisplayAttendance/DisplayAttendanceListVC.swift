//
//  DisplayAttendanceListVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 11/10/21.
//

import UIKit
import MBProgressHUD

protocol DisplayAttenddanceListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: DisplayAttenddanceListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: DisplayAttenddanceListModel.Fetch.ViewModel)
}


class DisplayAttendanceListVC: UIViewController, DisplayAttenddanceListDisplayLogic {
   
    @IBOutlet weak var tableView: UITableView!
   
    
    var interactor: DisplayAttenddanceListBusinessLogic?
    var displayedDisplayAttenddanceListData: [DisplayAttenddanceListModel.Fetch.ViewModel.DisplayedDisplayAttenddanceListData] = []
    
    var selectedDate = String()
    var selectedClassTotale = String()
    var selectednoOfPresent = String()
    var selectednoOfAbsent = String()
    var selectedTakenby = String()
    var selectedid = String()
    var selectedClassid = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: DisplayAttenddanceListModel.Fetch.Request(class_id :"1"))
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
        let interactor = DisplayAttenddanceListInteractor()
        let presenter = DisplayAttenddanceListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}

extension DisplayAttendanceListVC {
    
    func successFetchedItems(viewModel: DisplayAttenddanceListModel.Fetch.ViewModel) {
        displayedDisplayAttenddanceListData = viewModel.displayedDisplayAttenddanceListData
        MBProgressHUD.hide(for: self.view, animated: true)
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: DisplayAttenddanceListModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
}

extension DisplayAttendanceListVC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedDisplayAttenddanceListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DisplayAttendanceCell
            
            let data = displayedDisplayAttenddanceListData[indexPath.row]
            cell.Atendate.text = data.created_at
            cell.classStrength.text = "Class strength : \(data.class_total!)"
            cell.noAbsent.text = "No.of absent : \(data.no_of_absent!)"
            cell.noPresent.text = "No.of present : \(data.no_of_present!)"
            if data.sent_status == "0" {
                cell.sentImg.alpha = 0
                cell.sentStatus.text = ""
            }
            else{
                cell.sentImg.alpha = 1
                cell.sentStatus.text = "Sent"
            }
            return cell
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = displayedDisplayAttenddanceListData[indexPath.row]
        
        self.selectedDate = data.created_at!
        self.selectedClassTotale = data.class_total!
        self.selectednoOfPresent = data.no_of_present!
        self.selectednoOfAbsent = data.no_of_absent!
        self.selectedTakenby = data.created_by!
        self.selectedid = data.at_id!
        self.selectedClassid = data.class_id!
        self.performSegue(withIdentifier: "to_overViewAttendance", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "to_overViewAttendance")
        {
        let vc = segue.destination as! OverViewAttendanceVC
            
            vc.selectedDate = self.selectedDate
            vc.selectedClassTotale = self.selectedClassTotale
            vc.selectednoOfPresent = self.selectednoOfPresent
            vc.selectednoOfAbsent = self.selectednoOfAbsent
            vc.selectedTakenby = self.selectedTakenby
            vc.selectedid = self.selectedid
            vc.selectedClassid = self.selectedClassid
        }
    }
}
