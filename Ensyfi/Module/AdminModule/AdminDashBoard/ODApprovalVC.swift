//
//  ODApprovalVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 08/09/21.
//

import UIKit

protocol ODApprovalDisplayLogic: class
{
    func successFetchedItems(viewModel: ODApprovalModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: ODApprovalModel.Fetch.ViewModel)
}

class ODApprovalVC: UIViewController, ODApprovalDisplayLogic {
  
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var interactor: ODApprovalBusinessLogic?
    
    var SelectedODStatus = String()
    var selectedODId = String()
    var selectedFromDate = String()
    var selectedToDate = String()
    var selectedTitle = String()
    var selectedDescription = String()
    
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
        let interactor = ODApprovalInteractor()
        let presenter = ODApprovalPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
   
    
    @IBAction func sementAction(_ sender: Any) {
        
        if segmentedControl.selectedSegmentIndex == 0 {
            
            self.SelectedODStatus = "Rejected"
        }
        else if segmentedControl.selectedSegmentIndex == 1{
            self.SelectedODStatus = "Approved"
        }
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
        if self.SelectedODStatus == "" {
            
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Select OD Status", complition: {
            })
        }
        else {
            
        interactor?.fetchItems(request:ODApprovalModel.Fetch.Request(status:self.SelectedODStatus, od_id:self.selectedODId))
        }
    }
}

extension ODApprovalVC {
    
//    ODApprovalDisplayLogic
    func successFetchedItems(viewModel: ODApprovalModel.Fetch.ViewModel) {
        
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: viewModel.msg!, complition: {
            self.navigationController?.popViewController(animated: true)
        })
    }
    
    func errorFetchingItems(viewModel: ODApprovalModel.Fetch.ViewModel) {
        
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
}
