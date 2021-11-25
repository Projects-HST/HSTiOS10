//
//  SendGroupNotificationVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 22/11/21.
//

import UIKit
import DropDown
import MBProgressHUD

protocol GroupTitleListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: GroupTitleListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: GroupTitleListModel.Fetch.ViewModel)
}

protocol SendGroupNotificationDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel:SendGroupNotificationModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: SendGroupNotificationModel.Fetch.ViewModel)
}

class SendGroupNotificationVC: UIViewController, GroupTitleListDisplayLogic, SendGroupNotificationDisplayLogic {
   
    @IBOutlet weak var selectType: UITextField!
    @IBOutlet weak var selectBtnOutlet: UIButton!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var smsOutlet: UIButton!
    @IBOutlet weak var mailOutlet: UIButton!
    @IBOutlet weak var notificationOutlet: UIButton!
    
    let dropDown = DropDown()
    var interactor: GroupTitleListBusinessLogic?
    var interactor1:SendGroupNotificationBusinessLogic?
    var displayedGroupTitleListData: [GroupTitleListModel.Fetch.ViewModel.DisplayedGroupTitleListData] = []
    
    var groptitles = [String]()
    var groptitleId = [String]()
    var selectedgroptitleId = String()
    var selectedType = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
        self.bgView.dropShadow()
        interactor?.fetchItems(request:GroupTitleListModel.Fetch.Request(user_type:GlobalVariables.shared.user_type, dynamic_db: GlobalVariables.shared.dynamic_db, user_id :GlobalVariables.shared.user_id))
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
        let interactor = GroupTitleListInteractor()
        let presenter = GroupTitleListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        let viewController1 = self
        let interactor1 = SendGroupNotificationInteractor()
        let presenter1 = SendGroupNotificationPresenter()
        viewController1.interactor1 = interactor1
        interactor1.presenter1 = presenter1
        presenter1.viewController1 = viewController1
    }
    
    @IBAction func selectSection(_ sender: Any) {
        
        dropDown.show()
        dropDown.anchorView = selectType
        dropDown.dataSource = groptitles
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        selectType.text = item
            let slecteId = groptitleId[index]
            self.selectedgroptitleId = String(slecteId)
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
        
        guard CheckValuesAreEmpty () else {
                   return
        }
        interactor1?.fetchItems(request: SendGroupNotificationModel.Fetch.Request(group_id: self.selectedgroptitleId, notification_type: self.selectedType, notes: self.descField.text!, user_id: GlobalVariables.shared.user_id, dynamic_db: GlobalVariables.shared.dynamic_db))
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func CheckValuesAreEmpty () -> Bool{
    
        guard Reachability.isConnectedToNetwork() == true else {
            AlertController.shared.offlineAlert(targetVc: self, complition: {
            
          })
         return false
       }
    
        guard self.selectType.text?.count != 0  else {
             AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Select Group", complition: {
            
           })
         return false
       }
        
        guard self.descField.text?.count != 0  else {
             AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Enter message", complition: {
            
           })
         return false
       }
        
        guard self.selectedType != ""  else {
             AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Select notification type", complition: {
           })
         return false
      }
       return true
    }
}

extension SendGroupNotificationVC {
    
    func successFetchedItems(viewModel: GroupTitleListModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedGroupTitleListData = viewModel.displayedGroupTitleListData
        
        for datas in displayedGroupTitleListData {
            
            let grpTitle = datas.group_title
            let grpTitleId = datas.id
            
            self.groptitles.append(grpTitle!)
            self.groptitleId.append(grpTitleId!)
        }
    }
    
    func errorFetchingItems(viewModel: GroupTitleListModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
    
    func successFetchedItems(viewModel: SendGroupNotificationModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:viewModel.msg!, complition: {
       })
    }
    
    func errorFetchingItems(viewModel: SendGroupNotificationModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Error Occured", complition: {
       })
    }
}
