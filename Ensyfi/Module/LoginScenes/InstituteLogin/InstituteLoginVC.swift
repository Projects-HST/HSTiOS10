//
//  InstituteLoginVC.swift
//  Ensyfi
//
//  Created by HappysanziMac on 19/08/21.
//

import UIKit

protocol InstituteLoginDisplayLogic: class
{
    func successFetchedItems(viewModel: InstituteLoginModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: InstituteLoginModel.Fetch.ViewModel)
}

class InstituteLoginVC: UIViewController, InstituteLoginDisplayLogic {
    
    var interactor: InstituteLoginBusinessLogic?
    var institute_code = String()
    var login_type = String()
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var logoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupView ()
        self.hideKeyboardWhenTappedAround()
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
        let interactor = InstituteLoginInteractor()
        let presenter = InstituteLoginPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    func setupView () {
        
        userName.attributedPlaceholder = NSAttributedString(string:NSLocalizedString("", comment: "Username"), attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray.withAlphaComponent(1)])
        password.attributedPlaceholder = NSAttributedString(string:NSLocalizedString("", comment: "Password"), attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray.withAlphaComponent(1)])
    }
    
    @IBAction func signInAction(_ sender: Any) {
        
        guard CheckValuesAreEmpty () else {
                   return
        }
        
        interactor?.fetchItems(request: InstituteLoginModel.Fetch.Request(institue_code :self.institute_code,userName:self.userName.text!,password:self.password.text!))
    }
  
    @IBAction func forgotPasswordAction(_ sender: Any) {
        
    }
    
    func CheckValuesAreEmpty () -> Bool{
        
        guard Reachability.isConnectedToNetwork() == true else {
              AlertController.shared.offlineAlert(targetVc: self, complition: {
                //Custom action code
             })
            return false
        }
        
        guard self.userName.text?.count != 0  else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: "username is empty", complition: {
                
              })
            return false
        }
        
        guard self.password.text?.count != 0  else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: "password is empty", complition: {
                    
              })
            return false
         }
          return true
     }
}

extension InstituteLoginVC {
    
    func successFetchedItems(viewModel: InstituteLoginModel.Fetch.ViewModel) {
        
        self.login_type = viewModel.user_type_name!
        UserDefaults.standard.set(login_type, forKey: UserDefaultsKey.user_login_type_Key.rawValue)
        GlobalVariables.shared.user_loginType = login_type
        
        if login_type == "Admin" {
            
        self.performSegue(withIdentifier: "to_AdminDashboard", sender: self)
            
        }
    }

    func errorFetchingItems(viewModel: InstituteLoginModel.Fetch.ViewModel) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "to_AdminDashboard")
        {
            _ = segue.destination as! UINavigationController
           
        }
    }
}

