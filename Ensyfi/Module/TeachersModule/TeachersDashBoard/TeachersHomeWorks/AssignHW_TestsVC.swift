//
//  AssignHW_TestsVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 06/10/21.
//

import UIKit
import DropDown
import MBProgressHUD
import CoreData

class AssignHW_TestsVC: UIViewController {

    @IBOutlet weak var classTextfield: UITextField!
    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var classBtnOutlet: UIButton!
    @IBOutlet weak var subjectOutlet: UIButton!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context : NSManagedObjectContext?
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        context = appDelegate.persistentContainer.viewContext
    }
    
    @IBAction func selectClass(_ sender: Any) {
        
        dropDown.show()
        dropDown.anchorView = classTextfield
//        dropDown.dataSource = zipedArr
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            classTextfield.text = item
//            let slecteId = classId[index]
//            self.selectedClassId = String(slecteId)
//            print(selectedClassId)
        }
    }
}
