//
//  LoginVC.swift
//  Ensyfi
//
//  Created by HappysanziMac on 19/08/21.
//

import UIKit
import MBProgressHUD

protocol LoginDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: LoginModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: LoginModel.Fetch.ViewModel)
}

class LoginVC: UIViewController,LoginDisplayLogic {
    
    var interactor: LoginBusinessLogic?
    var institute_code = String()
    
    @IBOutlet weak var InstituteIdTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.setupView ()
        self.hideKeyboardWhenTappedAround()
        view.bindToKeyboard()
        print("1234")
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
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    func setupView () {
        
        InstituteIdTextfield.attributedPlaceholder = NSAttributedString(string:NSLocalizedString("", comment: "Username"), attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(1)])
    }
    
    @IBAction func continueAction(_ sender: Any) {
        
        guard CheckValuesAreEmpty () else {
                   return
        }
        interactor?.fetchItems(request: LoginModel.Fetch.Request(institue_id :self.InstituteIdTextfield.text,dynamic_db: GlobalVariables.shared.dynamic_db))
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func CheckValuesAreEmpty () -> Bool{
        
        guard Reachability.isConnectedToNetwork() == true else {
              AlertController.shared.offlineAlert(targetVc: self, complition: {
                //Custom action code
             })
             return false
        }
        
        guard self.InstituteIdTextfield.text?.count != 0  else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: Globals.LoginAlertMessage, complition: {
                
              })
             return false
         }
          return true
    }
}

extension LoginVC {
    
    func successFetchedItems(viewModel: LoginModel.Fetch.ViewModel) {
        
//        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:viewModel.msg!, complition: {
//        })
//        
        MBProgressHUD.hide(for: self.view, animated: true)
        self.institute_code = viewModel.institute_code!
        UserDefaults.standard.set(institute_code, forKey: UserDefaultsKey.institude_Code_Key.rawValue)
        GlobalVariables.shared.Institute_Code = institute_code
        self.performSegue(withIdentifier: "to_instituteLogin", sender: self)
    }
    
    func errorFetchingItems(viewModel: LoginModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Invalid Institute code", complition: {
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "to_instituteLogin")
        {
        let vc = segue.destination as! InstituteLoginVC
            vc.institute_code = self.institute_code
        }
    }
}
