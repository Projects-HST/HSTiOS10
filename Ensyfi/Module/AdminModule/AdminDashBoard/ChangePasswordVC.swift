//
//  ChangePasswordVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/09/21.
//

import UIKit

protocol ChangePasswordDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel:ChangePasswordModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: ChangePasswordModel.Fetch.ViewModel)
}

class ChangePasswordVC: UIViewController, ChangePasswordDisplayLogic {
    
    @IBOutlet weak var currentPassword: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    var interactor: ChangePasswordBusinessLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveAction(_ sender: Any) {
        
        guard CheckValuesAreEmpty () else {
                   return
        }
        
        interactor?.fetchItems(request: ChangePasswordModel.Fetch.Request(user_id: GlobalVariables.shared.user_id, old_password: self.currentPassword.text, password: self.confirmPassword.text))
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
        let interactor = ChangePasswordInteractor()
        let presenter = ChangePasswordPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    func CheckValuesAreEmpty () -> Bool{
        
        guard Reachability.isConnectedToNetwork() == true else {
              AlertController.shared.offlineAlert(targetVc: self, complition: {
                //Custom action code
             })
             return false
        }
        
        guard self.currentPassword.text?.count != 0  else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: "Paasword Cannot be empty", complition: {
                
              })
             return false
         }
        guard self.newPassword.text?.count != 0  else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: "Paasword Cannot be empty", complition: {
                
              })
             return false
         }
        guard self.confirmPassword.text?.count != 0  else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: "Paasword Cannot be empty", complition: {
                
              })
             return false
         }
        guard self.confirmPassword.text != newPassword.text else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: " New Password error", complition: {
                
              })
             return false
         }
          return true
    }
}

extension ChangePasswordVC {
    
    func successFetchedItems(viewModel: ChangePasswordModel.Fetch.ViewModel) {
        
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:viewModel.msg!, complition: {
            self.navigationController?.popViewController(animated: true)
        })
    }
    
    func errorFetchingItems(viewModel: ChangePasswordModel.Fetch.ViewModel) {
        
        AlertController.shared.showAlert(targetVc: self, title: Globals.errorAlertMsg, message:viewModel.msg!, complition: {
        })
    }
}
