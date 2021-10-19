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
    var homeWorkTestArr = [HomeWorkDetails]()
    var className = [String]()
    var classId = [String]()
    var secName = [String]()
    var secId = [String]()
    var studentIdArr = [String]()
    var serialNoArr = [Int]()
    var selectedClassId = String()
    var selectedSecId = String()
    var selectedStudentId = String()
    var selectedHwType = String()
    var zipedArr = [String]()
    var hwhtType = [String]()
    
    var hw_id = [String]()
    var hw_type = [String]()
    var titleArr = [String]()
    var test_date = [String]()
    var due_date = [String]()
    var teacher_id = [String]()
    var hw_details = [String]()
    var mark_status = [String]()
    var subject_id = [String]()
    var subject_name = [String]()
    var class_name = [String]()
    var sec_name = [String]()
    var class_id = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.context = appDelegate.persistentContainer.viewContext
        self.hwhtType = ["Class Test","Home Work"]
        self.fetchHWData()
        self.fetchData()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectClass(_ sender: Any) {
        
        dropDown.show()
        dropDown.anchorView = classTextfield
        dropDown.dataSource = zipedArr
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            classTextfield.text = item
            let slecteId = classId[index]
            self.selectedClassId = String(slecteId)
            print(selectedClassId)
        }
    }
    
    @IBAction func selectHWType(_ sender: Any) {
        
            dropDown.show()
            dropDown.anchorView = homeWorkType
            dropDown.dataSource = hwhtType
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              print("Selected item: \(item) at index: \(index)")
                homeWorkType.text = item
                
                if homeWorkType.text == "Class Test" {
                    selectedHwType = "HT"
                }
                else {
                    selectedHwType = "HW"
                }
          }
        
        for data in homeWorkTestArr {
            
            
        }
    }
    
    func fetchData() {
    
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ClassSubjects")
    
        do {
            let results = try context.fetch(fetchRequest)
            let  classSubData = results as! [ClassSubjects]
    
            for data in classSubData {
                className = data.class_name as! [String]
                secName = data.sec_name as! [String]
                classId = data.class_master_id as! [String]
                print(className)
                let ziped = zip(className, secName)
                let result = ziped.map { $0.0 + " " + $0.1 }
                zipedArr = result
            }
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func fetchHWData() {
    
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "HomeWorkDetails")
    
        do {
            let results = try context.fetch(fetchRequest)
            self.homeWorkTestArr = results as! [HomeWorkDetails]
    
            for data in homeWorkTestArr {
               
                hw_id = data.hw_id as! [String]
                hw_type = data.hw_type as! [String]
                titleArr = data.title as! [String]
                test_date = data.test_date as! [String]
                due_date = data.due_date as! [String]
                teacher_id = data.times as! [String]
                hw_details = data.hw_details as! [String]
                mark_status = data.mark_status as! [String]
                subject_id = data.subject_id as! [String]
                subject_name = data.subject_name as! [String]
                sec_name = data.sec_name as! [String]
                class_id = data.class_id as! [String]
                
            }
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
}
          
  
    
