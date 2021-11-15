//
//  ExamsVc.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//

import UIKit
import DropDown
import MBProgressHUD
import SideMenu

protocol ExamListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: ExamListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: ExamListModel.Fetch.ViewModel)
}

class ExamsVc: UIViewController,ClassViewDisplayLogic,SectionListDisplayLogic, ExamListDisplayLogic,SideMenuNavigationControllerDelegate {

    @IBOutlet weak var classTextfield: UITextField!
    @IBOutlet weak var sectionTextfield: UITextField!
    @IBOutlet weak var classBtnOutlet: UIButton!
    @IBOutlet weak var sectionBtnOutlet: UIButton!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    let dropDown = DropDown()
    var interactor: ClassViewBusinessLogic?
    var interactor1: SectionListBusinessLogic?
    var interactor2: ExamListBusinessLogic?
    
    var className = [String]()
    var classId = [String]()
    var secName = [String]()
    var secId = [String]()
    var studentIdArr = [String]()
    var serialNoArr = [Int]()
    
    var selectedClassId = String()
    var selectedSecId = String()
    var selectedStudentId = String()
    var selectedExamId = String()
    
    
    var displayedClassViewData: [ClassViewModel.Fetch.ViewModel.DisplayedClassViewData] = []
    var displayedSectionListData: [SectionListModel.Fetch.ViewModel.DisplayedSectionListData] = []
    var displayedExamListData: [ExamListModel.Fetch.ViewModel.DisplayedExamListData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        let interactor2 = ExamListInteractor()
        let presenter2 = ExamListPresenter()
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
                interactor2?.fetchItems(request: ExamListModel.Fetch.Request(class_id :self.selectedClassId,section_id: self.selectedSecId,dynamic_db: GlobalVariables.shared.dynamic_db))
            }
        }
    }
}

extension ExamsVc {
    
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
    
//    ExamsListDisplayLogic
    func successFetchedItems(viewModel: ExamListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedExamListData = viewModel.displayedExamListData
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: ExamListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
}

extension ExamsVc : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedExamListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExamsCell
        
        let data = displayedExamListData[indexPath.row]
         
        cell.title.text = data.exam_name
        cell.date.text = "\(data.Fromdate!) - \(data.Todate!) "
        cell.status.text = data.MarkStatus
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = displayedExamListData[indexPath.row]
        
        self.selectedExamId = data.exam_id!
        
        self.performSegue(withIdentifier: "toExamTimeTable", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "toExamTimeTable")
        {
        let vc = segue.destination as! ExamTimeTableVC
            
            vc.selectedClassId = self.selectedClassId
            vc.selectedExamId = self.selectedExamId
        }
    }
}
