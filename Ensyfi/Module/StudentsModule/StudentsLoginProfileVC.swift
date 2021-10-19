//
//  StudentsLoginProfileVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 27/09/21.
//

import UIKit

class StudentsLoginProfileVC: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var admissionNo: UILabel!
    @IBOutlet weak var className: UILabel!
    @IBOutlet weak var profilePic: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func continueAction(_ sender: Any) {
        
        self.performSegue(withIdentifier: "to_DashBoard", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "to_DashBoard")
        {
        let vc = segue.destination as! UINavigationController
        }
    }
}
 
