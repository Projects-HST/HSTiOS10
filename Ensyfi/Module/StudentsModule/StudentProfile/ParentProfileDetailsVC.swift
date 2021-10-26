//
//  ParentProfileDetailsVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 23/10/21.
//

import UIKit
import CoreData
import MBProgressHUD

class ParentProfileDetailsVC: UIViewController, FatherDeatilsDisplayLogic, MotherDetailsDisplayLogic {

    @IBOutlet weak var motherImg: UIImageView!
    @IBOutlet weak var fatherImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var addres: UILabel!
    @IBOutlet weak var emailId: UILabel!
    @IBOutlet weak var occupation: UILabel!
    @IBOutlet weak var income: UILabel!
    @IBOutlet weak var mobile: UILabel!
    @IBOutlet weak var telephone: UILabel!
    @IBOutlet weak var officePhone: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    var interactor: FatherDeatilsBusinessLogic?
    var interactor2: MotherDetailsBusinessLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        interactor?.fetchItems(request: FatherDeatilsModel.Fetch.Request(admission_id:GlobalVariables.shared.admission_id))
        MBProgressHUD.showAdded(to: self.view, animated: true)
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
        let interactor = FatherDeatilsInteractor()
        let presenter = FatherDeatilsPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        let viewController2 = self
        let interactor2 = MotherDetailsInteractor()
        let presenter2 = MotherDetailsPresenter()
        viewController2.interactor2 = interactor2
        interactor2.presenter2 = presenter2
        presenter2.viewController2 = viewController2
        
    }
    
    @IBAction func motherDetails(_ sender: Any){
    
        interactor2?.fetchItems(request: MotherDetailsModel.Fetch.Request(admission_id:GlobalVariables.shared.admission_id))
        MBProgressHUD.showAdded(to: self.view, animated: true)
        self.fatherImg.image = UIImage(named:"Father light")
        self.motherImg.image = UIImage(named:"Mother")
    }
    
    @IBAction func fatherDetails(_ sender: Any) {
        interactor?.fetchItems(request: FatherDeatilsModel.Fetch.Request(admission_id:GlobalVariables.shared.admission_id))
        self.motherImg.image = UIImage(named:"Mother light")
        self.fatherImg.image = UIImage(named:"Father")
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
    }
}

extension ParentProfileDetailsVC {
    
//    FatherDeatilsDisplayLogic
    func successFetchedItems(viewModel: FatherDeatilsModel.Fetch.ViewModel) {
        
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
    
    func errorFetchingItems(viewModel: FatherDeatilsModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
//    MotherDetailsDisplayLogic
    func successFetchedItems(viewModel: MotherDetailsModel.Fetch.ViewModel) {
        
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
    
    func errorFetchingItems(viewModel: MotherDetailsModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}

