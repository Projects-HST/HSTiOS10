//
//  TeachersHomeWorkVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 06/10/21.
//

import UIKit
import DropDown
import CoreData

class TeachersHomeWorkVC: UIViewController {

    @IBOutlet weak var classTextfield: UITextField!
    @IBOutlet weak var homeWorkType: UITextField!
    @IBOutlet weak var classBtnOutlet: UIButton!
    @IBOutlet weak var homeWorkOutlet: UIButton!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context : NSManagedObjectContext?
    let dropDown = DropDown()
    var className = [String]()
    var classId = [String]()
    var secName = [String]()
    var secId = [String]()
    var studentIdArr = [String]()
    var serialNoArr = [Int]()
    var selectedClassId = String()
    var selectedSecId = String()
    var selectedStudentId = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        context = appDelegate.persistentContainer.viewContext
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectClass(_ sender: Any) {
        
        dropDown.show()
        dropDown.anchorView = classTextfield
        dropDown.dataSource = className
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            classTextfield.text = item
            let slecteId = classId[index]
            self.selectedClassId = String(slecteId)
            print(selectedClassId)
        }
    }
    
    @IBAction func selectHWType(_ sender: Any) {
        
        if classTextfield.text!.count == 0 {
            
            homeWorkOutlet.isEnabled = false
        }
        else {
//            sectionBtnOutlet.isEnabled = true
            dropDown.show()
            dropDown.anchorView = homeWorkType
            dropDown.dataSource = secName
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              print("Selected item: \(item) at index: \(index)")
                homeWorkType.text = item
                let slecteId = secId[index]
                self.selectedSecId = String(slecteId)
                print(selectedSecId)
            }
        }
    }
}
