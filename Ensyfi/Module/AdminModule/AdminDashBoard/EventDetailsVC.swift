//
//  EventDetailsVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//

import UIKit
import MBProgressHUD

class EventDetailsVC: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var decription: UILabel!
    @IBOutlet weak var viewOrgBtn: UIButton!
    @IBOutlet weak var bgView: UIView!
    
    var selectedEventId = String()
    var selectedEventName = String()
    var selectedEventDetails = String()
    var selectedEventDate = String()
    var selectedSubEventStatus = String()
    var selectedYearId = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.bgView.dropShadow()
        self.titleLbl.text = selectedEventName
        self.date.text = selectedEventDate
        self.decription.text = selectedEventDetails
    }
    
    @IBAction func viewOrgBtn(_ sender: Any) {
        
        self.performSegue(withIdentifier: "to_subEvent", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "to_subEvent")
        {
        let vc = segue.destination as! SubEventsVC
            
            vc.selectedEventId = self.selectedEventId
        }
    }
}
