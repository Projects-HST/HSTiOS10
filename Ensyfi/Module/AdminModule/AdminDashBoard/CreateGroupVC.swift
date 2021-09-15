//
//  CreateGroupVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 14/09/21.
//

import UIKit
import DropDown

protocol TeacherListIDDisplayLogic: class
{
    func successFetchedItems(viewModel: TeacherListIDModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: TeacherListIDModel.Fetch.ViewModel)
}

protocol CreateGroupDisplayLogic: class
{
    func successFetchedItems(viewModel:CreateGroupModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: CreateGroupModel.Fetch.ViewModel)
}

class CreateGroupVC: UIViewController, TeacherListIDDisplayLogic, CreateGroupDisplayLogic {
   
    @IBOutlet weak var titleTextfield: UITextField!
    @IBOutlet weak var grpAdminTextfield: UITextField!
    @IBOutlet weak var switchOutlet: UISwitch!
    
    var interactor: TeacherListIDBusinessLogic?
    var interactor1: CreateGroupBusinessLogic?
    var displayedTeacherListIDData: [TeacherListIDModel.Fetch.ViewModel.DisplayedTeacherListIDData] = []
    let dropDown = DropDown()
    
    var teacherNameArr = [String]()
    var teacherIdArr = [String]()
    var selectedTecherId = String()
    var selectedTecher = String()
    var switchStatus = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: TeacherListIDModel.Fetch.Request(user_id :GlobalVariables.shared.user_id, user_type :""))
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
        let interactor1 = CreateGroupInteractor()
        let presenter1 = CreateGroupPresenter()
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
    
    @IBAction func createAction(_ sender: Any) {
        
        guard CheckValuesAreEmpty () else {
            return
        }
        
        interactor1?.fetchItems(request: CreateGroupModel.Fetch.Request(user_id: "1", group_title: self.titleTextfield.text, group_lead_id: self.selectedTecherId, status: "Active"))
    }
    
    @IBAction func switchAction(_ sender: Any) {
        
        if switchOutlet.isOn {
            self.switchStatus = "Active"
            switchOutlet.setOn(false, animated:true)
        }
        else {
            self.switchStatus = "InActive"
            switchOutlet.setOn(true, animated:true)
        }
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

extension CreateGroupVC {
    
//    TeacherListIDDisplayLogic
    func successFetchedItems(viewModel: TeacherListIDModel.Fetch.ViewModel) {
        
        displayedTeacherListIDData = viewModel.displayedTeacherListIDData
        
        for data in displayedTeacherListIDData {
            
            let techerName = data.name
            let techerId = data.user_id
            
            self.teacherNameArr.append(techerName!)
            self.teacherIdArr.append(techerId!)
        }
    }
    
    func errorFetchingItems(viewModel: TeacherListIDModel.Fetch.ViewModel) {
        
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
    
//  CreateGroupDisplayLogic
    func successFetchedItems(viewModel: CreateGroupModel.Fetch.ViewModel) {
        
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:viewModel.msg!, complition: {
        })
    }
    
    func errorFetchingItems(viewModel: CreateGroupModel.Fetch.ViewModel) {
        
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
}
    
