//
//  TeacherAttendanceVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 04/10/21.
//

import UIKit
import DropDown
import MBProgressHUD
import CoreData

class TeacherAttendanceVC: UIViewController {

    @IBOutlet weak var classTextfield: UITextField!
    @IBOutlet weak var classBtnOutlet: UIButton!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var date_month: UITextField!
    
    let datePicker = UIDatePicker()
    var dateFormatted = String()
    var className = [String]()
    var classId = [String]()
    var secName = [String]()
    var secId = [String]()
    var zipedArr = [String]()
    var academicMonthArr = [String]()
    var selectedClassId = String()
    var selectedType = String()
    var selectedSecId = String()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context : NSManagedObjectContext?
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        context = appDelegate.persistentContainer.viewContext
        self.fetchData()
        self.classBtnOutlet.isEnabled = false
        self.fetchMonthData()
        self.showDatePicker()
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
    
    @IBAction func selectDataMonth(_ sender: Any) {
        
        dropDown.anchorView = date_month
        dropDown.dataSource = academicMonthArr
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
        self.date_month.text = item
        }
    }
    
    @IBAction func sementAction(_ sender: Any) {
        
        if segmentedControl.selectedSegmentIndex == 0 {
            
            self.selectedType = "Dview"
            self.img2.image = UIImage(named:"unselected1")
            self.img1.image = UIImage(named:"selected")
            self.date_month.text = "Select Date"
        }
        else {
         
            self.selectedType = "Mview"
            self.img2.image = UIImage(named:"selected")
            self.img1.image = UIImage(named:"unselected1")
            self.date_month.text = "Select Month"
        }
    }
    
    func showDatePicker() {
       //Formate Date
       datePicker.datePickerMode = .date
       datePicker.backgroundColor = UIColor.white
       datePicker.setValue(UIColor.black, forKeyPath: "textColor")
       datePicker.preferredDatePickerStyle = UIDatePickerStyle.wheels
       //ToolBar
       let toolbar = UIToolbar();
       toolbar.sizeToFit()
       toolbar.backgroundColor = UIColor.white
       toolbar.tintColor = UIColor(red: 45/255.0, green: 148/255.0, blue: 235/255.0, alpha: 1.0)
       let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
       let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
       let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
       toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        date_month.inputAccessoryView = toolbar
        date_month.inputView = datePicker
    }
    
    func formattedDateFromString(dateString: String, withFormat format: String) -> String? {

        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"

        if let date = inputFormatter.date(from: dateString) {

            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = format

            return outputFormatter.string(from: date)
        }
        return nil
    }
    
     @objc func donedatePicker(){
        if date_month.isFirstResponder
        {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            dateFormatted = formatter.string(from: datePicker.date)
//            dateFormatted = datePicker.date
            let formatted = self.formattedDateFromString(dateString: dateFormatted, withFormat: "dd-MM-YYYY")
            date_month.text = formatted
            self.view.endEditing(true)
        }
    }
        
    @objc func cancelDatePicker() {
       self.view.endEditing(true)
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

    func fetchMonthData(){
    
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AcademicMonths")
    
        do {
            let results = try context.fetch(fetchRequest)
            let  classSubData = results as! [AcademicMonths]
    
            for data in classSubData {
                academicMonthArr = data.academic_month as! [String]
                print(academicMonthArr)
            }
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
}
