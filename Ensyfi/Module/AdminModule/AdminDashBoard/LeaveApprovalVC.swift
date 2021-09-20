//
//  LeaveApprovalVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 20/09/21.
//

import UIKit

protocol LeaveApprovalDisplayLogic: class
{
    func successFetchedItems(viewModel: LeaveApprovalModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: LeaveApprovalModel.Fetch.ViewModel)
}

class LeaveApprovalVC: UIViewController, LeaveApprovalDisplayLogic {
   
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
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
        }
        else if segmentedControl.selectedSegmentIndex == 1{
            self.selectedLeaveStatus = "Approved"
        }
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
        if self.selectedLeaveStatus == "" {
            
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Select Leave Status", complition: {
            })
        }
        else {
            
        interactor?.fetchItems(request:LeaveApprovalModel.Fetch.Request(status:self.selectedLeaveStatus, leave_id:self.selectedLeaveStatus))
        }
    }
}

extension  LeaveApprovalVC {
    
    func successFetchedItems(viewModel: LeaveApprovalModel.Fetch.ViewModel) {
        
    }
    
    func errorFetchingItems(viewModel: LeaveApprovalModel.Fetch.ViewModel) {
        
    }
}
