//
//  AddGroupMemberVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 16/09/21.
//

import UIKit
import DropDown

protocol RoleListDisplayLogic: class
{
    func successFetchedItems(viewModel: RoleListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: RoleListModel.Fetch.ViewModel)
}

protocol GroupSectionListDisplayLogic: class
{
    func successFetchedItems(viewModel: GroupSectionListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: GroupSectionListModel.Fetch.ViewModel)
}

protocol StudentGroupAddListDisplayLogic: class
{
    func successFetchedItems(viewModel: StudentGroupAddListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: StudentGroupAddListModel.Fetch.ViewModel)
}

class AddGroupMemberVC: UIViewController, RoleListDisplayLogic,GroupSectionListDisplayLogic, StudentGroupAddListDisplayLogic {
   
  
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupAdmin: UILabel!
    @IBOutlet weak var selectTypeTextfield: UITextField!
    @IBOutlet weak var selectSecTextfield: UITextField!
    @IBOutlet weak var secTextView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var interactor: RoleListBusinessLogic?
    var displayedRoleListData: [RoleListModel.Fetch.ViewModel.DisplayedRoleListData] = []
    
    var interactor1: GroupSectionListBusinessLogic?
    var displayedGroupSectionListData: [GroupSectionListModel.Fetch.ViewModel.DisplayedGroupSectionListData] = []
    
    var interactor2: StudentGroupAddListBusinessLogic?
    var displayedStudentGroupAddListData: [StudentGroupAddListModel.Fetch.ViewModel.DisplayedStudentGroupAddListData] = []
    
    let dropDown = DropDown()
    var roleTypeArr = [String]()
    var roleIdArr = [String]()
    var sectionArr = [String]()
    var sectionIdArr = [String]()
    
    var selectedRoleId = String()
    var selectedSectionId = String()
    
    var selectedTitle = String()
    var selectedGrpAdmin = String()
    var selectedStatus = String()
    var selectedID = String()
    var selectedleadId = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: RoleListModel.Fetch.Request(user_id :GlobalVariables.shared.user_id))
        interactor1?.fetchItems(request: GroupSectionListModel.Fetch.Request(user_id :GlobalVariables.shared.user_id))
        
        self.groupName.text = self.selectedTitle
        self.groupAdmin.text = self.selectedGrpAdmin
        print("\(selectedTitle)")
        print("\(selectedID)")
        print("\(selectedleadId)")
        print("\(selectedGrpAdmin)")
        self.secTextView.alpha = 0
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
        let interactor = RoleListInteractor()
        let presenter = RoleListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        let viewController1 = self
        let interactor1 = GroupSectionListInteractor()
        let presenter1 = GroupSectionListPresenter()
        viewController1.interactor1 = interactor1
        interactor1.presenter1 = presenter1
        presenter1.viewController1 = viewController1
        
        let viewController2 = self
        let interactor2 = StudentGroupAddListInteractor()
        let presenter2 = StudentGroupAddListPresenter()
        viewController2.interactor2 = interactor2
        interactor2.presenter2 = presenter2
        presenter2.viewController2 = viewController2

    }
    
    @IBAction func selectTypeAction(_ sender: Any) {
        
        dropDown.show()
        dropDown.anchorView = selectTypeTextfield
        dropDown.dataSource = self.roleTypeArr
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            selectTypeTextfield.text = item
            let slectedId = self.roleIdArr[index]
            self.selectedRoleId = String(slectedId)
            print(selectedRoleId)
            
            if selectTypeTextfield.text == "Teachers" || selectTypeTextfield.text == "Board Members" {
                self.secTextView.alpha = 0
            }
            else {
                self.secTextView.alpha = 1
            }
        }
    }
    
    @IBAction func selectSecAction(_ sender: Any) {
        
        dropDown.show()
        dropDown.anchorView = selectSecTextfield
        dropDown.dataSource = self.sectionArr
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            selectSecTextfield.text = item
            let slectedId = self.sectionIdArr[index]
            self.selectedSectionId = String(slectedId)
            print(selectedSectionId)
            
            interactor2?.fetchItems(request: StudentGroupAddListModel.Fetch.Request(group_id:self.selectedID,group_user_type:self.selectedRoleId,class_id:self.selectedSectionId))
        }
    }
   
    @IBAction func addAction(_ sender: Any) {
        
    }
}

extension AddGroupMemberVC{
    
//    RoleListDisplayLogic
    func successFetchedItems(viewModel: RoleListModel.Fetch.ViewModel) {
        
        displayedRoleListData = viewModel.displayedRoleListData
        
        for data in displayedRoleListData {
            
            let roleName = data.user_type_name
            let roleId = data.role_id
            
            self.roleTypeArr.append(roleName!)
            self.roleIdArr.append(roleId!)
        }
    }
    
    func errorFetchingItems(viewModel: RoleListModel.Fetch.ViewModel) {
        
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
    
//  GroupSectionListDisplayLogic
    func successFetchedItems(viewModel: GroupSectionListModel.Fetch.ViewModel) {
        
        displayedGroupSectionListData = viewModel.displayedGroupSectionListData
        
        for data in displayedGroupSectionListData {
            
            let secName = data.class_section
            let secId = data.class_sec_id
            
            self.sectionArr.append(secName!)
            self.sectionIdArr.append(secId!)
        }
    }
    
    func errorFetchingItems(viewModel: GroupSectionListModel.Fetch.ViewModel) {
        
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
    
//  StudentGroupAddListDisplayLogic
    func successFetchedItems(viewModel: StudentGroupAddListModel.Fetch.ViewModel) {
        
        displayedStudentGroupAddListData = viewModel.displayedStudentGroupAddListData
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: StudentGroupAddListModel.Fetch.ViewModel) {
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
}

extension AddGroupMemberVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedStudentGroupAddListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GroupAddMemberListCell
        
        let data = displayedStudentGroupAddListData[indexPath.row]
        
        cell.name.text = data.name
        cell.id.text = data.user_id
        cell.status.backgroundColor = UIColor.systemGreen
        cell.selectionStyle = .none
        
        return cell
    }
}
