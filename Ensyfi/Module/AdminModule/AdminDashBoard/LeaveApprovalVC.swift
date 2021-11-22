//
//  LeaveApprovalVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 20/09/21.
//

import UIKit
import MBProgressHUD

protocol LeaveApprovalDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: LeaveApprovalModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: LeaveApprovalModel.Fetch.ViewModel)
}

class LeaveApprovalVC: UIViewController, LeaveApprovalDisplayLogic {
   
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var reason: UILabel!
    
    var interactor: LeaveApprovalBusinessLogic?
    var selectedLeaveType = String()
    var selectedfromDate = String()
    var selectedtoDate = String()
    var selectedStatus = String()
    var selectedId = String()
    var selectedDescription = String()
    var selectedLeaveStatus = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.date.text = "\(selectedfromDate) To : \(selectedtoDate)"
        self.typeLbl.text = selectedLeaveType
        self.reason.text = selectedDescription
        self.bgView.dropShadow()
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
        let interactor = LeaveApprovalInteractor()
        let presenter = LeaveApprovalPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    @IBAction func sementAction(_ sender: Any) {
        
        if segmentedControl.selectedSegmentIndex == 0 {
            self.selectedLeaveStatus = "Rejected"
            self.img2.image = UIImage(named:"red click")
            self.img1.image = UIImage(named:"greenunselected")
        }
        else if segmentedControl.selectedSegmentIndex == 1{
            self.selectedLeaveStatus = "Approved"
            self.img2.image = UIImage(named:"red")
            self.img1.image = UIImage(named:"greenselected")
        }
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
        if self.selectedLeaveStatus == "" {
            
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Select Leave Status", complition: {
            })
        }
        else {
            
        interactor?.fetchItems(request:LeaveApprovalModel.Fetch.Request(status:self.selectedLeaveStatus, leave_id:self.selectedId,dynamic_db: GlobalVariables.shared.dynamic_db))
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
    }
}

extension  LeaveApprovalVC {
    
    func successFetchedItems(viewModel: LeaveApprovalModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Changes Saved", complition: {
            self.navigationController?.popViewController(animated: true)
        })
    }
    
    func errorFetchingItems(viewModel: LeaveApprovalModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}
