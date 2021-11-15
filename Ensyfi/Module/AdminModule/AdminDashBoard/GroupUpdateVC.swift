//
//  GroupUpdateVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 14/09/21.
//
import UIKit
import DropDown
import MBProgressHUD

protocol UpdateGroupDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel:UpdateGroupModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: UpdateGroupModel.Fetch.ViewModel)
}

class GroupUpdateVC: UIViewController, TeacherListIDDisplayLogic, UpdateGroupDisplayLogic {
    
    @IBOutlet weak var titleTextfield: UITextField!
    @IBOutlet weak var grpAdminTextfield: UITextField!
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var bgView: UIView!
    
    var interactor: TeacherListIDBusinessLogic?
    var interactor1: UpdateGroupBusinessLogic?
    var displayedTeacherListIDData: [TeacherListIDModel.Fetch.ViewModel.DisplayedTeacherListIDData] = []
    let dropDown = DropDown()
    
    var selectedTitle = String()
    var selectedGrpAdmin = String()
    var selectedStatus = String()
    var selectedID = String()
    
    var teacherNameArr = [String]()
    var teacherIdArr = [String]()
    var selectedTecherId = String()
    var selectedTecher = String()
    var switchStatus = String()
    var selectedGroupId = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: TeacherListIDModel.Fetch.Request(user_id :"1", user_type :"",dynamic_db: GlobalVariables.shared.dynamic_db))
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        self.titleTextfield.text = selectedTitle
        self.grpAdminTextfield.text = selectedGrpAdmin
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
        let interactor = TeacherListIDInteractor()
        let presenter = TeacherListIDPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        let viewController1 = self
        let interactor1 = UpdateGroupInteractor()
        let presenter1 = UpdateGroupPresenter()
        viewController1.interactor1 = interactor1
        interactor1.presenter1 = presenter1
        presenter1.viewController1 = viewController1
    }
    
    @IBAction func selectClass(_ sender: Any) {
        
        dropDown.show()
        dropDown.anchorView = grpAdminTextfield
        dropDown.dataSource = teacherNameArr
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            grpAdminTextfield.text = item
            let slectedId = teacherIdArr[index]
            self.selectedTecherId = String(slectedId)
            print(selectedTecherId)
        }
    }
    
    @IBAction func updateAction(_ sender: Any) {
    
        interactor1?.fetchItems(request: UpdateGroupModel.Fetch.Request(user_id: GlobalVariables.shared.user_id, group_title: self.titleTextfield.text, group_lead_id: self.selectedTecherId, status: "Active",group_id:self.selectedID,dynamic_db: GlobalVariables.shared.dynamic_db))
    }
    
    func CheckValuesAreEmpty () -> Bool{
        
        guard Reachability.isConnectedToNetwork() == true else {
              AlertController.shared.offlineAlert(targetVc: self, complition: {
                //Custom action code
             })
             return false
        }
        
        guard self.titleTextfield.text?.count != 0  else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Title is empty", complition: {
                
              })
             return false
         }
         
        guard self.grpAdminTextfield.text?.count != 0  else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Grp Admin is Empty", complition: {
                
              })
             return false
         }
          return true
     }
}

extension GroupUpdateVC {
    
//    TeacherListIDDisplayLogic
    func successFetchedItems(viewModel: TeacherListIDModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedTeacherListIDData = viewModel.displayedTeacherListIDData
        
        for data in displayedTeacherListIDData {
            
            let techerName = data.name
            let techerId = data.user_id
            
            self.teacherNameArr.append(techerName!)
            self.teacherIdArr.append(techerId!)
        }
    }
    
    func errorFetchingItems(viewModel: TeacherListIDModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
            
        })
    }
    
    func successFetchedItems(viewModel: UpdateGroupModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:viewModel.msg!, complition: {
            self.navigationController?.popViewController(animated: true)
        })
    }

    func errorFetchingItems(viewModel: UpdateGroupModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
}
