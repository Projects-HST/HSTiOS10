//
//  GuardianProfileDetailsVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 23/10/21.
//

import UIKit
import CoreData
import MBProgressHUD

class GuardianProfileDetailsVC: UIViewController, GuardianDetailsDisplayLogic {

    @IBOutlet weak var guardian: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var addres: UILabel!
    @IBOutlet weak var emailId: UILabel!
    @IBOutlet weak var occupation: UILabel!
    @IBOutlet weak var income: UILabel!
    @IBOutlet weak var mobile: UILabel!
    @IBOutlet weak var telephone: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var officePhone: UILabel!
 
    var interactor3: GuardianDetailsBusinessLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        interactor3?.fetchItems(request: GuardianDetailsModel.Fetch.Request(admission_id:GlobalVariables.shared.admission_id,dynamic_db: GlobalVariables.shared.dynamic_db))
        MBProgressHUD.showAdded(to: self.view, animated: true)
        bgView.dropShadow()
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
        let viewController3 = self
        let interactor3 = GuardianDetailsInteractor()
        let presenter3 = GuardianDetailsPresenter()
        viewController3.interactor3 = interactor3
        interactor3.presenter3 = presenter3
        presenter3.viewController3 = viewController3
    }
}

extension GuardianProfileDetailsVC {
    
    func successFetchedItems(viewModel: GuardianDetailsModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        self.name.text = viewModel.name
        self.addres.text = viewModel.home_address
        self.emailId.text = viewModel.email
        self.occupation.text = viewModel.occupation
        self.income.text = viewModel.income
        self.mobile.text = viewModel.mobile
        self.telephone.text = viewModel.home_phone
        self.officePhone.text = viewModel.office_phone
    }
    
    func errorFetchingItems(viewModel: GuardianDetailsModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}
