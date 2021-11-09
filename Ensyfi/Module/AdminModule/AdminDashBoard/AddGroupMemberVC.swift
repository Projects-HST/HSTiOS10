//
//  AddGroupMemberVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 16/09/21.
//

import UIKit
import DropDown
import MBProgressHUD

protocol RoleListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: RoleListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: RoleListModel.Fetch.ViewModel)
}

protocol GroupSectionListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: GroupSectionListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: GroupSectionListModel.Fetch.ViewModel)
}

protocol StudentGroupAddListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: StudentGroupAddListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: StudentGroupAddListModel.Fetch.ViewModel)
}

protocol StaffGroupAddListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: StaffGroupAddListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: StaffGroupAddListModel.Fetch.ViewModel)
}

protocol AddGroupMemberDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: AddGroupMemberModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: AddGroupMemberModel.Fetch.ViewModel)
}

class AddGroupMemberVC: UIViewController, RoleListDisplayLogic,GroupSectionListDisplayLogic, StudentGroupAddListDisplayLogic, StaffGroupAddListDisplayLogic, AddGroupMemberDisplayLogic {
   
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupAdmin: UILabel!
    @IBOutlet weak var selectTypeTextfield: UITextField!
    @IBOutlet weak var selectSecTextfield: UITextField!
    @IBOutlet weak var secTextView: UIView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var interactor: RoleListBusinessLogic?
    var displayedRoleListData: [RoleListModel.Fetch.ViewModel.DisplayedRoleListData] = []
    
    var interactor1: GroupSectionListBusinessLogic?
    var displayedGroupSectionListData: [GroupSectionListModel.Fetch.ViewModel.DisplayedGroupSectionListData] = []
    
    var interactor2: StudentGroupAddListBusinessLogic?
    var displayedStudentGroupAddListData: [StudentGroupAddListModel.Fetch.ViewModel.DisplayedStudentGroupAddListData] = []
    
    var interactor3: StaffGroupAddListBusinessLogic?
    var displayedStaffGroupAddListData: [StaffGroupAddListModel.Fetch.ViewModel.DisplayedStaffGroupAddListData] = []
    
    var interactor4: AddGroupMemberBusinessLogic?
    
    let dropDown = DropDown()
    var roleTypeArr = [String]()
    var roleIdArr = [String]()
    var sectionArr = [String]()
    var sectionIdArr = [String]()
    var selectedIdArr = [String]()
    var staffUserIdArr = [String]()
    var selectedRows:[IndexPath] = []
    
    var slectedIDforAdd = String()
    var selectedRoleId = String()
    var selectedSectionId = String()
    var selectedRoleType = String()
    
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
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        self.groupName.text = self.selectedTitle
        self.groupAdmin.text = self.selectedGrpAdmin
        print("\(selectedTitle)")
        print("\(selectedID)")
        print("\(selectedleadId)")
        print("\(selectedGrpAdmin)")
        self.secTextView.alpha = 0
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
        
        let viewController3 = self
        let interactor3 = StaffGroupAddListInteractor()
        let presenter3 = StaffGroupAddListPresenter()
        viewController3.interactor3 = interactor3
        interactor3.presenter3 = presenter3
        presenter3.viewController3 = viewController3
        
        let viewController4 = self
        let interactor4 = AddGroupMemberInteractor()
        let presenter4 = AddGroupMemberPresenter()
        viewController4.interactor4 = interactor4
        interactor4.presenter4 = presenter4
        presenter4.viewController4 = viewController4
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
                interactor3?.fetchItems(request: StaffGroupAddListModel.Fetch.Request(group_id:self.selectedID,group_user_type:self.selectedRoleId,class_id:self.selectedSectionId))
                selectedRoleType = "Staffs"
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
            selectedRoleType = "Students"
        }
    }
   
    @IBAction func addAction(_ sender: Any) {
        
        interactor4?.fetchItems(request: AddGroupMemberModel.Fetch.Request(user_id: GlobalVariables.shared.user_id, group_member_id: slectedIDforAdd, group_user_type: selectedRoleId, status: selectedStatus, group_id: selectedID))
    }
}

extension AddGroupMemberVC {
    
//    RoleListDisplayLogic
    func successFetchedItems(viewModel: RoleListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedRoleListData = viewModel.displayedRoleListData
        
        for data in displayedRoleListData {
            
            let roleName = data.user_type_name
            let roleId = data.role_id
            
            self.roleTypeArr.append(roleName!)
            self.roleIdArr.append(roleId!)
        }
    }
    
    func errorFetchingItems(viewModel: RoleListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
    
//  GroupSectionListDisplayLogic
    func successFetchedItems(viewModel: GroupSectionListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedGroupSectionListData = viewModel.displayedGroupSectionListData
        
        for data in displayedGroupSectionListData {
            
            let secName = data.class_section
            let secId = data.class_sec_id
            
            self.sectionArr.append(secName!)
            self.sectionIdArr.append(secId!)
        }
    }
    
    func errorFetchingItems(viewModel: GroupSectionListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
    
//  StudentGroupAddListDisplayLogic
    func successFetchedItems(viewModel: StudentGroupAddListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedStudentGroupAddListData = viewModel.displayedStudentGroupAddListData
        
        self.staffUserIdArr.removeAll()
        self.selectedIdArr.removeAll()
        self.slectedIDforAdd = ""
        
        for data in displayedStudentGroupAddListData {
            let id = data.user_id

            self.staffUserIdArr.append(id!)
        }
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: StudentGroupAddListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
    
//    StaffGroupAddListDisplayLogic
    func successFetchedItems(viewModel: StaffGroupAddListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedStaffGroupAddListData = viewModel.displayedStaffGroupAddListData
        
        self.staffUserIdArr.removeAll()
        self.selectedIdArr.removeAll()
        self.slectedIDforAdd = ""
        
        for data in displayedStaffGroupAddListData {
            let id = data.user_id

            self.staffUserIdArr.append(id!)
        }
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: StaffGroupAddListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
    
//     AddGroupMemberDisplayLogic
    func successFetchedItems(viewModel: AddGroupMemberModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:viewModel.msg!, complition: {
            self.navigationController?.popViewController(animated: true)
        })
    }
    
    func errorFetchingItems(viewModel: AddGroupMemberModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
}


extension AddGroupMemberVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if selectedRoleType == "Students"{
            return displayedStudentGroupAddListData.count
        }
        else {
            return displayedStaffGroupAddListData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GroupAddMemberListCell
        
         if selectedRoleType == "Students"{
            let data = displayedStudentGroupAddListData[indexPath.row]
        
            cell.name.text = data.name
            cell.id.text = data.user_id
            cell.addBtn.tag = indexPath.row
            cell.addBtn.addTarget(self, action: #selector(addBtnClicked(sender:)), for: .touchUpInside)
            if selectedRows.contains(indexPath){
                 cell.addBtn.setImage(UIImage(named:"tick"), for: .normal)
            }
            else{
                 cell.addBtn.setImage(UIImage(named:"unselected1"), for: .normal)
            }
            cell.addBtn.tag = indexPath.row
            cell.addBtn.addTarget(self, action: #selector(addBtnClicked(sender:)), for: .touchUpInside)
            cell.selectionStyle = .none
        }
        else {
            let data = displayedStaffGroupAddListData[indexPath.row]
            
            cell.name.text = data.name
            cell.id.text = data.user_id
            cell.addBtn.tag = indexPath.row
            cell.addBtn.addTarget(self, action: #selector(addBtnClicked(sender:)), for: .touchUpInside)
            cell.selectionStyle = .none
        }
        return cell
    }
    
    @objc func addBtnClicked(sender: UIButton){
        
        let selectedIndexPath = IndexPath(row: sender.tag, section: 0)
       
       if self.selectedRows.contains(selectedIndexPath){
        self.selectedRows.remove(at: self.selectedRows.firstIndex(of: selectedIndexPath)!)
       }
       else{
         self.selectedRows.append(selectedIndexPath)
       }
      let buttonClicked = sender.tag
        print(buttonClicked)
        let selectedIndex = Int(buttonClicked)
        let sel = self.staffUserIdArr[selectedIndex]
        self.selectedIdArr.append(sel)
        slectedIDforAdd = selectedIdArr.joined(separator:",")
        print(slectedIDforAdd)
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
    }
    
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//
//        tableView.cellForRow(at: indexPath)?.accessoryType = .none
//    }
    
}
