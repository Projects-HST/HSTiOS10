//
//  StudentsVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 24/08/21.
//

import UIKit
import MBProgressHUD
import DropDown
import SideMenu

protocol ClassViewDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: ClassViewModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: ClassViewModel.Fetch.ViewModel)
}

protocol SectionListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: SectionListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: SectionListModel.Fetch.ViewModel)
}

protocol StudentsListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: StudentsListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: StudentsListModel.Fetch.ViewModel)
}

class StudentsVC: UIViewController,ClassViewDisplayLogic,SectionListDisplayLogic, StudentsListDisplayLogic,SideMenuNavigationControllerDelegate {
  
    @IBOutlet weak var classTextfield: UITextField!
    @IBOutlet weak var sectionTextfield: UITextField!
    @IBOutlet weak var classBtnOutlet: UIButton!
    @IBOutlet weak var sectionBtnOutlet: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bgView: UIView!
    
    let dropDown = DropDown()
    var interactor: ClassViewBusinessLogic?
    var interactor1: SectionListBusinessLogic?
    var interactor2: StudentsListBusinessLogic?
    
    var className = [String]()
    var classId = [String]()
    var secName = [String]()
    var secId = [String]()
    var studentIdArr = [String]()
    var serialNoArr = [Int]()
    var selectedClassId = String()
    var selectedSecId = String()
    var selectedStudentId = String()
    
    var displayedClassViewData: [ClassViewModel.Fetch.ViewModel.DisplayedClassViewData] = []
    var displayedSectionListData: [SectionListModel.Fetch.ViewModel.DisplayedSectionListData] = []
    var displayedStudentsListData: [StudentsListModel.Fetch.ViewModel.DisplayedStudentsListData] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.fetchItems(request: ClassViewModel.Fetch.Request(user_id :"",dynamic_db: GlobalVariables.shared.dynamic_db))
        MBProgressHUD.showAdded(to: self.view, animated: true)
        self.bgView.dropShadow()
    }
    
    func sideMenuWillAppear(menu: SideMenuNavigationController, animated: Bool) {
        view.alpha = 0.8
    }
    
    func sideMenuWillDisappear(menu: SideMenuNavigationController, animated: Bool) {
           view.alpha = 1
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
            interactor1?.fetchItems(request: SectionListModel.Fetch.Request(class_id :self.selectedClassId,dynamic_db: GlobalVariables.shared.dynamic_db))
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
    }
    
    @IBAction func selectSection(_ sender: Any) {
        
        if classTextfield.text!.count == 0 {
            
            sectionBtnOutlet.isEnabled = false
        }
        else {
//            sectionBtnOutlet.isEnabled = true
            dropDown.show()
            dropDown.anchorView = sectionTextfield
            dropDown.dataSource = secName
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              print("Selected item: \(item) at index: \(index)")
                sectionTextfield.text = item
                let slecteId = secId[index]
                self.selectedSecId = String(slecteId)
                print(selectedSecId)
                interactor2?.fetchItems(request: StudentsListModel.Fetch.Request(class_id :self.selectedClassId,section_id: self.selectedSecId,dynamic_db: GlobalVariables.shared.dynamic_db))
                MBProgressHUD.showAdded(to: self.view, animated: true)
            }
        }
    }
}

extension StudentsVC {
    
//    ClassViewDisplayLogic
    func successFetchedItems(viewModel: ClassViewModel.Fetch.ViewModel) {
        
        displayedClassViewData = viewModel.displayedClassViewData
        
        for data in displayedClassViewData {
            
            let class_name = data.class_name
            let class_id = data.class_id
            
            self.className.append(class_name!)
            self.classId.append(class_id!)
        }
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func errorFetchingItems(viewModel: ClassViewModel.Fetch.ViewModel) {
        
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"An error occured", complition: {
        })
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
//    SectionListDisplayLogic
    func successFetchedItems(viewModel: SectionListModel.Fetch.ViewModel) {
        displayedSectionListData = viewModel.displayedSectionListData
        
        for data in displayedSectionListData {
            
            let secName = data.sec_name
            let secId = data.sec_id
            
            self.secId.append(secId!)
            self.secName.append(secName!)
        }
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func errorFetchingItems(viewModel: SectionListModel.Fetch.ViewModel) {
        
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"An error occured", complition: {
        })
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
//    StudentsListDisplayLogic
    func successFetchedItems(viewModel: StudentsListModel.Fetch.ViewModel) {
        
        displayedStudentsListData = viewModel.displayedStudentsListData
        for i in 1...10000 {
            self.serialNoArr.append(i)
        }
        self.tableView.reloadData()
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func errorFetchingItems(viewModel: StudentsListModel.Fetch.ViewModel) {
        
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"An error occured", complition: {
        })
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}

extension StudentsVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedStudentsListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StudentsListCell
        
        let data = displayedStudentsListData[indexPath.row]
        
        cell.SerialNo.text = String(serialNoArr[indexPath.row])
        cell.admissionNo.text = data.admisn_no
        cell.studentName.text = data.name
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = displayedStudentsListData[indexPath.row]
        self.selectedStudentId = data.enroll_id!
        
        self.performSegue(withIdentifier: "student_detail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "student_detail")
        {
        let vc = segue.destination as! StudentsDetailsVC
            vc.studentEnroolId = self.selectedStudentId
            vc.selectedClassId = self.selectedClassId
        }
    }
}
