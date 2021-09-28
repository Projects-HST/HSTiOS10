//
//  FeesListVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 08/09/21.
//

import UIKit
import DropDown
import MBProgressHUD

protocol FeesListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: FeesListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: FeesListModel.Fetch.ViewModel)
}

protocol FeesSectionListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: FeesSectionListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: FeesSectionListModel.Fetch.ViewModel)
}

class FeesListVC: UIViewController, FeesListDisplayLogic,ClassViewDisplayLogic,FeesSectionListDisplayLogic {
   
 
    let dropDown = DropDown()
    var interactor2: FeesListBusinessLogic?
    var interactor1: FeesSectionListBusinessLogic?
    var interactor: ClassViewBusinessLogic?
    var displayedClassViewData: [ClassViewModel.Fetch.ViewModel.DisplayedClassViewData] = []
    var displayedFeesListData: [FeesListModel.Fetch.ViewModel.DisplayedFeesListData] = []
    var displayedFeesSectionListData: [FeesSectionListModel.Fetch.ViewModel.DisplayedFeesSectionListData] = []
    
    var className = [String]()
    var classId = [String]()
    var secName = [String]()
    var secId = [String]()
    var studentIdArr = [String]()
    var serialNoArr = [Int]()
    var selectedClassId = String()
    var selectedSecId = String()
    var selectedStudentId = String()
    
    @IBOutlet weak var classTextfield: UITextField!
    @IBOutlet weak var sectionTextfield: UITextField!
    @IBOutlet weak var classBtnOutlet: UIButton!
    @IBOutlet weak var sectionBtnOutlet: UIButton!
//    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: ClassViewModel.Fetch.Request(user_id :GlobalVariables.shared.user_id))
       
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
        let interactor1 = FeesSectionListInteractor()
        let presenter1 = FeesSectionListPresenter()
        viewController1.interactor1 = interactor1
        interactor1.presenter1 = presenter1
        presenter1.viewController1 = viewController1
        
        let viewController2 = self
        let interactor2 = FeesListInteractor()
        let presenter2 = FeesListPresenter()
        viewController2.interactor2 = interactor2
        interactor2.presenter2 = presenter2
        presenter2.viewController2 = viewController2
    }
    
    @IBAction func cllasListrAction(_ sender: Any) {
        
        dropDown.show()
        dropDown.anchorView = classTextfield
        dropDown.dataSource = className
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            classTextfield.text = item
            let slecteId = classId[index]
            self.selectedClassId = String(slecteId)
            print(selectedClassId)
            interactor1?.fetchItems(request: FeesSectionListModel.Fetch.Request(class_id :self.selectedClassId))
        }
    }
    
    @IBAction func selectSection(_ sender: Any) {
        
            dropDown.show()
            dropDown.anchorView = sectionTextfield
            dropDown.dataSource = secName
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              print("Selected item: \(item) at index: \(index)")
                sectionTextfield.text = item
                let slecteId = secId[index]
                self.selectedSecId = String(slecteId)
                print(selectedSecId)
                interactor2?.fetchItems(request: FeesListModel.Fetch.Request(class_id:self.selectedClassId , section_id: self.selectedSecId))
        }
    }
}

extension FeesListVC {
    
// ClassViewDisplayLogic
    func successFetchedItems(viewModel: ClassViewModel.Fetch.ViewModel) {
        
        displayedClassViewData = viewModel.displayedClassViewData
        
        for data in displayedClassViewData {
            
            let class_name = data.class_name
            let class_id = data.class_id
            
            self.className.append(class_name!)
            self.classId.append(class_id!)
        }
    }
    
    func errorFetchingItems(viewModel: ClassViewModel.Fetch.ViewModel) {
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"An error occured", complition: {
        })
    }
    
//  SectionListDisplayLogic
    func successFetchedItems(viewModel: FeesSectionListModel.Fetch.ViewModel) {
        displayedFeesSectionListData = viewModel.displayedFeesSectionListData
        
        for data in displayedFeesSectionListData {
            
            let secName = data.sec_name
            let secId = data.sec_id
            
            self.secId.append(secId!)
            self.secName.append(secName!)
        }
    }
    
    func errorFetchingItems(viewModel: FeesSectionListModel.Fetch.ViewModel) {
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"An error occured", complition: {
        })
    }
    
//   FeesListDisplayLogic
    func successFetchedItems(viewModel: FeesListModel.Fetch.ViewModel) {
        
    }
    
    func errorFetchingItems(viewModel: FeesListModel.Fetch.ViewModel) {
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"An error occured", complition: {
        })
    }
}
