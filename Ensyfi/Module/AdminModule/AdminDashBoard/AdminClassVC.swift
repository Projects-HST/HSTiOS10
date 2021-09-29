//
//  AdminClassVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//

import UIKit
import DropDown
import MBProgressHUD

protocol ClassForTeacherListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: ClassForTeacherListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: ClassForTeacherListModel.Fetch.ViewModel)
}

class AdminClassVC: UIViewController,ClassViewDisplayLogic,SectionListDisplayLogic, StudentsListDisplayLogic, ClassForTeacherListDisplayLogic {
    
    @IBOutlet weak var classTextfield: UITextField!
    @IBOutlet weak var sectionTextfield: UITextField!
    @IBOutlet weak var categoryTextfield: UITextField!
    @IBOutlet weak var classBtnOutlet: UIButton!
    @IBOutlet weak var sectionBtnOutlet: UIButton!
    @IBOutlet weak var categoryBtnOutlet: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerTitle1: UILabel!
    @IBOutlet weak var headerTitle2: UILabel!
    @IBOutlet weak var DetailAlertLabel: UILabel!
    
    let dropDown = DropDown()
    var interactor: ClassViewBusinessLogic?
    var interactor1: SectionListBusinessLogic?
    var interactor2: StudentsListBusinessLogic?
    var interactor3: ClassForTeacherListBusinessLogic?
    
    var className = [String]()
    var classId = [String]()
    var secName = [String]()
    var secId = [String]()
    var studentIdArr = [String]()
    var serialNoArr = [Int]()
    var categoryArr = [String]()
    
    var selectedClassId = String()
    var selectedSecId = String()
    var selectedStudentId = String()
    var selectedStffId = String()
    var categoryType = String()
    
    var displayedClassViewData: [ClassViewModel.Fetch.ViewModel.DisplayedClassViewData] = []
    var displayedSectionListData: [SectionListModel.Fetch.ViewModel.DisplayedSectionListData] = []
    var displayedStudentsListData: [StudentsListModel.Fetch.ViewModel.DisplayedStudentsListData] = []
    var displayedClassForTeacherListData: [ClassForTeacherListModel.Fetch.ViewModel.DisplayedClassForTeacherListData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor?.fetchItems(request: ClassViewModel.Fetch.Request(user_id :""))
        self.categoryArr = ["Student","Teacher"]
        MBProgressHUD.showAdded(to: self.view, animated: true)
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
        let interactor = ClassViewInteractor()
        let presenter = ClassViewPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        let viewController1 = self
        let interactor1 = SectionListInteractor()
        let presenter1 = SectionListPresenter()
        viewController1.interactor1 = interactor1
        interactor1.presenter1 = presenter1
        presenter1.viewController1 = viewController1
        
        let viewController2 = self
        let interactor2 = StudentsListInteractor()
        let presenter2 = StudentsListPresenter()
        viewController2.interactor2 = interactor2
        interactor2.presenter2 = presenter2
        presenter2.viewController2 = viewController2
        
        let viewController3 = self
        let interactor3 = ClassForTeacherListInteractor()
        let presenter3 = ClassForTeacherListPresenter()
        viewController3.interactor3 = interactor3
        interactor3.presenter3 = presenter3
        presenter3.viewController3 = viewController3
    }
    
    @IBAction func selectClass(_ sender: Any) {
        
        dropDown.show()
        dropDown.anchorView = classTextfield
        dropDown.dataSource = className
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            classTextfield.text = item
            let slecteId = classId[index]
            self.selectedClassId = String(slecteId)
            print(selectedClassId)
            interactor1?.fetchItems(request: SectionListModel.Fetch.Request(class_id :self.selectedClassId))
        }
    }
    
    @IBAction func selectSection(_ sender: Any) {
        
        if classTextfield.text!.count == 0 {
            
            sectionBtnOutlet.isEnabled = false
        }
        else {
            sectionBtnOutlet.isEnabled = true
            dropDown.show()
            dropDown.anchorView = sectionTextfield
            dropDown.dataSource = secName
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              print("Selected item: \(item) at index: \(index)")
                sectionTextfield.text = item
                let slecteId = secId[index]
                self.selectedSecId = String(slecteId)
                print(selectedSecId)
                self.categoryType = "student"
                interactor2?.fetchItems(request: StudentsListModel.Fetch.Request(class_id :self.selectedClassId,section_id: self.selectedSecId))
            }
        }
    }
    
    @IBAction func selectcategory(_ sender: Any) {
        
        if classTextfield.text!.count == 0 || sectionTextfield.text!.count == 0 {
            
            sectionBtnOutlet.isEnabled = false
            categoryBtnOutlet.isEnabled = false
        }
        else {
            dropDown.show()
            dropDown.anchorView = categoryTextfield
            dropDown.dataSource = categoryArr
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              print("Selected item: \(item) at index: \(index)")
                categoryTextfield.text = item
                
                if dropDown.indexForSelectedRow == 0 {
                    self.categoryType = "student"
                    
                    interactor2?.fetchItems(request: StudentsListModel.Fetch.Request(class_id :self.selectedClassId,section_id: self.selectedSecId))
                }
                else if dropDown.indexForSelectedRow == 1 {
                    self.categoryType = "teacher"
                    
                    interactor3?.fetchItems(request: ClassForTeacherListModel.Fetch.Request(class_id :self.selectedClassId,section_id :self.selectedSecId))
                }
            }
        }
    }
}

extension AdminClassVC {
    
//    ClassViewDisplayLogic
    func successFetchedItems(viewModel: ClassViewModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedClassViewData = viewModel.displayedClassViewData
        
        for data in displayedClassViewData {
            
            let class_name = data.class_name
            let class_id = data.class_id
            
            self.className.append(class_name!)
            self.classId.append(class_id!)
        }
    }
    
    func errorFetchingItems(viewModel: ClassViewModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
    
//    SectionListDisplayLogic
    func successFetchedItems(viewModel: SectionListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedSectionListData = viewModel.displayedSectionListData
        
        for data in displayedSectionListData {
            
            let secName = data.sec_name
            let secId = data.sec_id
            
            self.secId.append(secId!)
            self.secName.append(secName!)
        }
    }
    
    func errorFetchingItems(viewModel: SectionListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
        
    }
    
//    StudentsListDisplayLogic
    func successFetchedItems(viewModel: StudentsListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedStudentsListData = viewModel.displayedStudentsListData
        
        self.headerTitle1.text = "Student Name"
        self.headerTitle2.text = "Admission No"
        
        for i in 1...10000 {
            self.serialNoArr.append(i)
        }
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: StudentsListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
    
//    ClassForStaffListDisplayLogic
    func successFetchedItems(viewModel: ClassForTeacherListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedClassForTeacherListData = viewModel.displayedClassForTeacherListData
        
        self.headerTitle1.text = "Teacher"
        self.headerTitle2.text = "Handling Subject"
        
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: ClassForTeacherListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
}

extension AdminClassVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.categoryType == "student"{
            
            return displayedStudentsListData.count
        }
        else {
            
            return displayedClassForTeacherListData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StudentsListCell
        
        if self.categoryType == "student"{
            
            let data = displayedStudentsListData[indexPath.row]
            cell.SerialNo.text = String(serialNoArr[indexPath.row])
            cell.admissionNo.text = data.admisn_no
            cell.studentName.text = data.name
            cell.selectionStyle = .none
        }
        else {
            
            let data = displayedClassForTeacherListData[indexPath.row]
            cell.SerialNo.text = String(serialNoArr[indexPath.row])
            cell.admissionNo.text = data.subject_name
            cell.studentName.text = data.name
            cell.selectionStyle = .none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if self.categoryType == "student" {
            
        let data = displayedStudentsListData[indexPath.row]
        self.selectedStudentId = data.enroll_id!
        self.performSegue(withIdentifier: "to_students", sender: self)
        }
        else {
            let data = displayedClassForTeacherListData[indexPath.row]
            self.selectedStffId = data.teacher_id!
            self.performSegue(withIdentifier: "to_staffs", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "to_students")
        {
        let vc = segue.destination as! StudentsDetailsVC
            vc.studentEnroolId = self.selectedStudentId
            vc.selectedClassId = self.selectedClassId
        }
        else if (segue.identifier == "to_staffs")
        {
        let vc = segue.destination as! TeacherDetailsVC
            vc.teacher_ID = self.selectedStffId
        }
    }
}

    
