//
//  TeacherGroupAddVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/10/21.
//

import UIKit
import MBProgressHUD
import DropDown

protocol TeacherGroupTypleListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: TeacherGroupTypleListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: TeacherGroupTypleListModel.Fetch.ViewModel)
}

protocol SendTecherGroupDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel:SendTecherGroupModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: SendTecherGroupModel.Fetch.ViewModel)
}

class TeacherGroupAddVC: UIViewController,TeacherGroupTypleListDisplayLogic,SendTecherGroupDisplayLogic {
   
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var selectType: UITextField!
    @IBOutlet weak var slectBtn: UIButton!
    @IBOutlet weak var smsOutlet: UIButton!
    @IBOutlet weak var mailOutlet: UIButton!
    @IBOutlet weak var notificationOutlet: UIButton!
    @IBOutlet weak var detailsField: UITextField!
    
    let dropDown = DropDown()
    var interactor: TeacherGroupTypleListBusinessLogic?
    var interactor1: SendTecherGroupBusinessLogic?
    var displayedTeacherGroupTypleListData: [TeacherGroupTypleListModel.Fetch.ViewModel.DisplayedTeacherGroupTypleListData] = []
   
    var titleArr = [String]()
    var titleId = [String]()
    var selectedId = String()
    var selectedType = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        hideKeyboardWhenTappedAround()
        self.bgView.dropShadow()
        interactor?.fetchItems(request: TeacherGroupTypleListModel.Fetch.Request(user_id :GlobalVariables.shared.user_id,user_type:GlobalVariables.shared.user_type))
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
        let interactor = TeacherGroupTypleListInteractor()
        let presenter = TeacherGroupTypleListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        let viewController1 = self
        let interactor1 = SendTecherGroupInteractor()
        let presenter1 = SendTecherGroupPresenter()
        viewController1.interactor1 = interactor1
        interactor1.presenter1 = presenter1
        presenter1.viewController1 = viewController1
    }
    
    @IBAction func selectTypeAction(_ sender: Any) {
        
        dropDown.show()
        dropDown.anchorView = selectType
        dropDown.dataSource = titleArr
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            selectType.text = item
            let slecteId = titleId[index]
            self.selectedId = String(slecteId)
        }
    }
    
    @IBAction func selectedSMS(_ sender: Any) {
        
        let image1 = UIImage(named: "sms")
        let image2 = UIImage(named: "mail")
        let image3 = UIImage(named: "notification-1")
        self.selectedType = "SMS"
        
        self.smsOutlet.setImage(image1, for: .normal)
        self.mailOutlet.setImage(image2, for: .normal)
        self.notificationOutlet.setImage(image3, for: .normal)
    }
    
    @IBAction func selectedmail(_ sender: Any) {
        
        let image1 = UIImage(named: "sms-2")
        let image2 = UIImage(named: "mail1")
        let image3 = UIImage(named: "notification-1")
        self.selectedType = "Mail"
        
        self.smsOutlet.setImage(image1, for: .normal)
        self.mailOutlet.setImage(image2, for: .normal)
        self.notificationOutlet.setImage(image3, for: .normal)
    }
    
    @IBAction func selectednotification(_ sender: Any) {
        
        let image1 = UIImage(named: "sms-2")
        let image2 = UIImage(named: "mail")
        let image3 = UIImage(named: "notification1-1")
        self.selectedType = "Notification"
        
        self.smsOutlet.setImage(image1, for: .normal)
        self.mailOutlet.setImage(image2, for: .normal)
        self.notificationOutlet.setImage(image3, for: .normal)
    }
    
    @IBAction func sendAction(_ sender: Any) {
        
        if selectedType == "" {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Enter valid Type", complition: {
            })
        }
        else {
            interactor1?.fetchItems(request: SendTecherGroupModel.Fetch.Request(group_title_id:self.selectedId,messagetype_sms:self.selectedType,messagetype_mail:self.selectedType,messagetype_notification:self.selectedType,message_details:self.detailsField.text!,created_by:GlobalVariables.shared.user_id))
        }
    }
}


extension TeacherGroupAddVC {
    
    func successFetchedItems(viewModel: TeacherGroupTypleListModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedTeacherGroupTypleListData = viewModel.displayedTeacherGroupTypleListData
        
        for dats in displayedTeacherGroupTypleListData {
            
            let titleArr = dats.group_title
            let titleid = dats.id
            
            self.titleArr.append(titleArr!)
            self.titleId.append(titleid!)
        }
    }
    
    func errorFetchingItems(viewModel: TeacherGroupTypleListModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
    
    func successFetchedItems(viewModel: SendTecherGroupModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title:viewModel.msg!, message:Globals.errorAlertMsg, complition: {
            self.navigationController?.popViewController(animated: true)
        })
    }
    
    func errorFetchingItems(viewModel: SendTecherGroupModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
}
