//
//  OverViewAttendanceVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 11/10/21.
//

import UIKit
import MBProgressHUD

protocol SendAttendanceDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel:SendAttendanceModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: SendAttendanceModel.Fetch.ViewModel)
}

class OverViewAttendanceVC: UIViewController, SendAttendanceDisplayLogic {
   
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var classStrength: UILabel!
    @IBOutlet weak var noPresent: UILabel!
    @IBOutlet weak var noAbsent: UILabel!
    @IBOutlet weak var takenby: UILabel!
    @IBOutlet weak var smsOutlet: UIButton!
    @IBOutlet weak var mailOutlet: UIButton!
    @IBOutlet weak var notificationOutlet: UIButton!
    @IBOutlet weak var notificationView: UIView!
    @IBOutlet weak var bgView: UIView!
    
    var interactor: SendAttendanceBusinessLogic?
    
    var selectedDate = String()
    var selectedClassTotale = String()
    var selectednoOfPresent = String()
    var selectednoOfAbsent = String()
    var selectedTakenby = String()
    var selectedid = String()
    var selectedType = String()
    var selectedClassid = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.notificationView.alpha = 0
        self.classStrength.text = self.selectedClassTotale
        self.noPresent.text = self.selectednoOfPresent
        self.noAbsent.text = self.selectednoOfAbsent
        self.takenby.text = self.selectedTakenby
        self.dateLbl.text = self.selectedDate
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
        let interactor = SendAttendanceInteractor()
        let presenter = SendAttendancePresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    @IBAction func sendAttendance(_ sender: Any) {
        self.notificationView.alpha = 1
    }
    
    @IBAction func viewAttendance(_ sender: Any) {
       
        self.performSegue(withIdentifier: "to_attendanceRecord", sender: self)
    }
    
    @IBAction func sendNotification(_ sender: Any) {
        
        if selectedType == "" {
            
        }
        else {
            interactor?.fetchItems(request: SendAttendanceModel.Fetch.Request(attend_id :self.selectedid,msg_type:self.selectedType))
            MBProgressHUD.showAdded(to: self.view, animated: true)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "to_attendanceRecord")
        {
        let vc = segue.destination as! AttendanceRecordListVC
            vc.selectedid = self.selectedid
            vc.selectedClassid = self.selectedClassid
        }
    }
}

extension OverViewAttendanceVC {
    
    func successFetchedItems(viewModel: SendAttendanceModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:viewModel.msg!, complition: {
        })
    }
    
    func errorFetchingItems(viewModel: SendAttendanceModel.Fetch.ViewModel) {
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Error Occured", complition: {
        })
    }
}
