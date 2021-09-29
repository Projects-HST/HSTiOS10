//
//  ODApprovalVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 08/09/21.
//

import UIKit
import MBProgressHUD

protocol ODApprovalDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: ODApprovalModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: ODApprovalModel.Fetch.ViewModel)
}

class ODApprovalVC: UIViewController, ODApprovalDisplayLogic {
  
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var reason: UILabel!
    
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
        self.date.text = "\(selectedFromDate) To : \(selectedToDate)"
        self.typeLbl.text = selectedTitle
        self.reason.text = selectedDescription
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
            self.img2.image = UIImage(named:"red click")
            self.img1.image = UIImage(named:"greenunselected")
            
        }
        else if segmentedControl.selectedSegmentIndex == 1{
            self.SelectedODStatus = "Approved"
            self.img2.image = UIImage(named:"red")
            self.img1.image = UIImage(named:"greenselected")
        }
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
        if self.SelectedODStatus == "" {
            
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Select OD Status", complition: {
            })
        }
        else {
            
        interactor?.fetchItems(request:ODApprovalModel.Fetch.Request(status:self.SelectedODStatus, od_id:self.selectedODId))
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
    }
}

extension ODApprovalVC {
    
//    ODApprovalDisplayLogic
    func successFetchedItems(viewModel: ODApprovalModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: viewModel.msg!, complition: {
            self.navigationController?.popViewController(animated: true)
        })
    }
    
    func errorFetchingItems(viewModel: ODApprovalModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
}
