//
//  SendAttendanceVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 13/10/21.
//

import UIKit
import MBProgressHUD

protocol SendAssignmentDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel:SendAssignmentModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: SendAssignmentModel.Fetch.ViewModel)
}

protocol SendAssignmentDelegate
{
    func saveText(strText : String)
}

class SendAttendanceVC: UIViewController, SendAssignmentDisplayLogic {

    @IBOutlet weak var smsOutlet: UIButton!
    @IBOutlet weak var mailOutlet: UIButton!
    @IBOutlet weak var notificationOutlet: UIButton!
    @IBOutlet weak var notificationView: UIView!
    
    var interactor: SendAssignmentBusinessLogic?
    var selectedType = String()
    var selectedClassid = String()
    var delegate : ClassSectionListDelegate?
    var strSaveText : NSString!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        let interactor = SendAssignmentInteractor()
        let presenter = SendAssignmentPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }

    @IBAction func selectedSMS(_ sender: Any) {
        
        let image1 = UIImage(named: "sms")
        let image2 = UIImage(named: "mail")
        let image3 = UIImage(named: "notification-1")
        self.selectedType = "SMS"
        
        self.smsOutlet.setImage(image1, for: .normal)
        self.mailOutlet.setImage(image2, for: .normal)
        self.notificationOutlet.setImage(image3, for: .normal)
        delegate?.saveText(strText: (selectedType as NSString) as String)
    }
    
    @IBAction func selectedmail(_ sender: Any) {
        
        let image1 = UIImage(named: "sms-2")
        let image2 = UIImage(named: "mail1")
        let image3 = UIImage(named: "notification-1")
        self.selectedType = "Mail"
        
        self.smsOutlet.setImage(image1, for: .normal)
        self.mailOutlet.setImage(image2, for: .normal)
        self.notificationOutlet.setImage(image3, for: .normal)
        delegate?.saveText(strText: (selectedType as NSString) as String)
    }
    
    @IBAction func selectednotification(_ sender: Any) {
        
        let image1 = UIImage(named: "sms-2")
        let image2 = UIImage(named: "mail")
        let image3 = UIImage(named: "notification1-1")
        self.selectedType = "Notification"
        
        self.smsOutlet.setImage(image1, for: .normal)
        self.mailOutlet.setImage(image2, for: .normal)
        self.notificationOutlet.setImage(image3, for: .normal)
        delegate?.saveText(strText: (selectedType as NSString) as String)
    }
    
    @IBAction func sendAction(_ sender: Any) {
        
        if selectedType == "" {
            
        }
        else {
            interactor?.fetchItems(request: SendAssignmentModel.Fetch.Request(attend_id :self.selectedClassid,msg_type:self.selectedType))
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
    }
}

extension SendAttendanceVC {
    
    func successFetchedItems(viewModel: SendAssignmentModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:viewModel.msg!, complition: {
        })
    }
    
    func errorFetchingItems(viewModel: SendAssignmentModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
}
