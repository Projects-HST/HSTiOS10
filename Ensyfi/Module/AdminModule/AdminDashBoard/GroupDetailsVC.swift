//
//  GroupDetailsVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 14/09/21.
//

import UIKit

class GroupDetailsVC: UIViewController {

    @IBOutlet weak var grptitle: UILabel!
    @IBOutlet weak var grpAdmin: UILabel!
    @IBOutlet weak var status: UILabel!
    
    var selectedTitle = String()
    var selectedGrpAdmin = String()
    var selectedStatus = String()
    var selectedID = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.grptitle.text = self.selectedTitle
        self.grpAdmin.text = self.selectedGrpAdmin
        self.status.text = self.selectedStatus
    }

    @IBAction func viewMemAction(_ sender: Any) {
        
        self.performSegue(withIdentifier: "view_members", sender: self)
        
    }
    
    @IBAction func updateAction(_ sender: Any) {
        
        self.performSegue(withIdentifier: "toUpdateGroup", sender: self)
        
    }
    
    @IBAction func addAction(_ sender: Any) {
        
        
    }
    
    @IBAction func notificationAction(_ sender: Any) {
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
       if (segue.identifier == "view_members")
       {
            let vc = segue.destination as! ViewGroupMemVC
        
             vc.selectedID = self.selectedID
       }
       else if (segue.identifier == "toUpdateGroup")
       {
        let vc = segue.destination as! GroupUpdateVC
            
            vc.selectedTitle = self.selectedTitle
            vc.selectedGrpAdmin = self.selectedGrpAdmin
            vc.selectedStatus = self.selectedStatus
            vc.selectedID = self.selectedID
            
        }
    }
}
