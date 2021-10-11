//
//  OverViewAttendanceVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 11/10/21.
//

import UIKit

class OverViewAttendanceVC: UIViewController {

    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var classStrength: UILabel!
    @IBOutlet weak var noPresent: UILabel!
    @IBOutlet weak var noAbsent: UILabel!
    @IBOutlet weak var takenby: UILabel!
    @IBOutlet weak var smsOutlet: UIButton!
    @IBOutlet weak var mailOutlet: UIButton!
    @IBOutlet weak var notificationOutlet: UIButton!
    @IBOutlet weak var notificationView: UIView!
    
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
       
    }
    
    @IBAction func sendAttendance(_ sender: Any) {
        self.notificationView.alpha = 1
    }
    
    @IBAction func viewAttendance(_ sender: Any) {
       
        self.performSegue(withIdentifier: "to_attendanceRecord", sender: self)
    }
    
    @IBAction func sendNotification(_ sender: Any) {
        
    }
    
    @IBAction func selectedSMS(_ sender: Any) {
        
        let image1 = UIImage(named: "sms")
        let image2 = UIImage(named: "mail")
        let image3 = UIImage(named: "notification-1")
        
        self.smsOutlet.setImage(image1, for: .normal)
        self.mailOutlet.setImage(image2, for: .normal)
        self.notificationOutlet.setImage(image3, for: .normal)
    }
    
    @IBAction func selectedmail(_ sender: Any) {
        
        let image1 = UIImage(named: "sms-2")
        let image2 = UIImage(named: "mail1")
        let image3 = UIImage(named: "notification-1")
        
        self.smsOutlet.setImage(image1, for: .normal)
        self.mailOutlet.setImage(image2, for: .normal)
        self.notificationOutlet.setImage(image3, for: .normal)
    }
    
    @IBAction func selectednotification(_ sender: Any) {
        
        let image1 = UIImage(named: "sms-2")
        let image2 = UIImage(named: "mail")
        let image3 = UIImage(named: "notification1-1")
        
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

