//
//  TakeAttendanceVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 04/10/21.
//

import UIKit
import DropDown
import MBProgressHUD
import CoreData

class TakeAttendanceVC: UIViewController {

    @IBOutlet weak var classTextfield: UITextField!
    @IBOutlet weak var classBtnOutlet: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dateLbl: UILabel!
    
    let dropDown = DropDown()
    let date = Date()
    let formatter = DateFormatter()
    var className = [String]()
    var classId = [String]()
    var secName = [String]()
    var selectedClassName = [String]()
    var selectedstudentName = [String]()
    var selectedstudentStatus = [String]()
    var zipedArr = [String]()
    var attendanceStatusArr = [String]()
    var serialNoArr = [Int]()
    
//    syncDatas
    
    var ac_year = [String]()
    var class_id = [String]()
    var class_total = [Int]()
    var no_of_present = [Int]()
    var no_of_absent = [Int]()
    var attendence_period = [String]()
    var created_by = [String]()
    var created_at = [String]()
    var status = [String]()
  
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context : NSManagedObjectContext?
    var studentClassName = [String]()
    var studentClassId = [String]()
    var studentSecName = [String]()
    var dataArr = [StudentDetails]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        context = appDelegate.persistentContainer.viewContext
        self.fetchData()
        self.fetchStudentData()
        self.SetDate()
        self.attendanceStatusArr = ["Present","Leave","Absent","OD"]
        for i in 1...10000 {
            self.serialNoArr.append(i)
        }
        selectedstudentStatus = [String](repeating: "", count:20)
        // Do any additional setup after loading the view.
    }
   
    @IBAction func selectClass(_ sender: Any) {
        
        self.selectedClassName.removeAll()
        
        dropDown.show()
        dropDown.anchorView = classTextfield
        dropDown.dataSource = zipedArr
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            classTextfield.text = item
       
            for data in dataArr {
                
                let classsecName = data.class_section as! [String]
                let studentName  = data.name as! [String]
//                let studentStatus  = data.status as! [String]
//                self.class_total.insert(studentName.count, at: 0)
                let indexes = classsecName.enumerated().filter {
                    $0.element == classTextfield.text!
                    }.map{$0.offset}
                
                let name = studentName[indexes.indices]
                selectedstudentName = Array(name)
                print(selectedstudentName)
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func saveAttendance(_ sender: Any) {

        let presentIndexes = selectedstudentStatus.enumerated().filter {
            $0.element == "Present"
            }.map{$0.offset}
        let absentIndexes = selectedstudentStatus.enumerated().filter {
            $0.element == "Absent"
            }.map{$0.offset}

        self.ac_year.insert("1", at: 0)
        self.no_of_present.insert(presentIndexes.count, at: 0)
        self.no_of_absent.insert(absentIndexes.count, at: 0)
        self.class_total.insert(selectedstudentName.count, at: 0)
        self.attendence_period.insert("0", at: 0)
        self.created_by.insert(GlobalVariables.shared.user_id, at: 0)
        self.created_at.insert(self.dateLbl.text!, at: 0)
        self.status.insert("A", at: 0)
        self.class_id.insert(classId[0], at: 0)
        
        print(ac_year)
        print(no_of_present)
        print(no_of_absent)
        print(class_total)
        print(attendence_period)
        print(created_by)
        print(created_at)
        print(class_id)
        self.saveData()
    }
    
    func saveData() {
        
        saveAttendanceData(ac_year:self.ac_year,class_id:self.class_id,class_total:self.class_total,no_of_present:self.no_of_present,no_of_absent:self.no_of_absent,attendence_period:self.attendence_period,created_by:self.created_by,created_at:self.created_at,status:self.status)
    }
    
    func SetDate() {
        
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        dateLbl.text = result
    }
    
    func fetchData(){
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ClassSubjects")
    
        do {
            let results = try context.fetch(fetchRequest)
            let  datas = results as! [ClassSubjects]
    
            for data in datas {
                className = data.class_name as! [String]
                secName = data.sec_name as! [String]
                classId = data.class_master_id as! [String]
                print(className)
                let ziped = zip(className, secName)
                let result = ziped.map { $0.0 + " " + $0.1 }
                zipedArr = result
                print(zipedArr)
            }
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
      
    func fetchStudentData(){
        
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "StudentDetails")
        
            do {
                let results = try context.fetch(fetchRequest)
                self.dataArr = results as! [StudentDetails]
                
            } catch let err as NSError {
                print(err.debugDescription)
            }
      }
}

extension TakeAttendanceVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return selectedstudentName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AttendanceTakeCell
        
        cell.SerialNo.text = String(serialNoArr[indexPath.row])
        cell.status.text = selectedstudentStatus[indexPath.row]
        cell.studentName.text = selectedstudentName[indexPath.row]
        cell.selectStatus.tag = indexPath.row
        cell.selectStatus.addTarget(self, action: #selector(addBtnClicked(sender:)), for: .touchUpInside)
        cell.selectionStyle = .none
        
        return cell
    }
    
    @objc func addBtnClicked(sender: UIButton) {

        let section = 0
        let row = sender.tag
        let indexPath = IndexPath(row: row, section: section)
        let cell: AttendanceTakeCell = self.tableView.cellForRow(at: indexPath) as! AttendanceTakeCell
        dropDown.show()
        dropDown.anchorView = cell.status
        dropDown.dataSource = attendanceStatusArr
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
            self.selectedstudentStatus.insert(item, at: row)
            print(selectedstudentStatus)
        self.tableView.reloadData()
            
        }
    }
    
    func saveAttendanceData(ac_year:[String],class_id:[String],class_total:[Int],no_of_present:[Int],no_of_absent:[Int],attendence_period:[String],created_by:[String],created_at:[String],status:[String]){
        
        let teacherProfile = NSEntityDescription.insertNewObject(forEntityName: "ClassAttenadance", into: context!)
        
        teacherProfile.setValue(ac_year, forKey: "ac_year")
        teacherProfile.setValue(class_id, forKey: "class_id")
        teacherProfile.setValue(class_total, forKey: "class_total")
        teacherProfile.setValue(no_of_present, forKey: "no_of_present")
        teacherProfile.setValue(no_of_absent, forKey: "no_of_absent")
        teacherProfile.setValue(attendence_period, forKey: "attendence_period")
        teacherProfile.setValue(created_by, forKey: "created_by")
        teacherProfile.setValue(created_at, forKey: "created_at")
        teacherProfile.setValue(status, forKey: "status")
   
        do {
            try context?.save()
                print(" suucess")
            }
        catch {
            print("error")
        }
    }
}
//attend_id,class_id,student_id,abs_date,a_status,attend_period,a_val,a_taken_by,created_at,status
