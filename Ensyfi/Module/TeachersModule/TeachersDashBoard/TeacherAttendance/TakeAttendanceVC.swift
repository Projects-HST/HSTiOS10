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
    var selectedstudentId = [String]()
    var selectedstudentStatus = [String]()
    var zipedArr = [String]()
    var attendanceStatusArr = [String]()
    var serialNoArr = [Int]()
    
//    syncDatas
    var selectedattendance = Bool()
    var ac_year = String()
    var class_id = String()
    var class_total = String()
    var no_of_present = String()
    var no_of_absent = String()
    var attendence_period = String()
    var created_by = String()
    var created_at = String()
    var status = String()
    var atendanceIdCount = String()
    var attendanceTakeid = String()
    var sync_status = String()
    var server_at_id = String()
    var updated_at = String()
    var updated_by = String()
    var studentCount = [String]()
    var studentIncrementID = String()
    var studentaddId = String()
    var studentID = [String]()
    var atendanceCountId = [String]()
    var AttendanceStatus = String()
    var dumy1 = [String]()
    var dumy2 = [String]()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context : NSManagedObjectContext?
    var studentClassName = [String]()
    var studentClassId = [String]()
    var studentSecName = [String]()
    
    var atendHistory = [AttendanceHistory]()
    var dataArr = [StudentDetails]()
    var attendanceData = [ClassAttendances]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        context = appDelegate.persistentContainer.viewContext
        self.fetchData()
        self.fetchStudentData()
        self.SetDate()
        self.fetchAttendancetaken()
        self.fethStudenttendHistory ()
        self.attendanceStatusArr = ["Present","Leave","Absent","OD"]
        for i in 1...10000 {
            self.serialNoArr.append(i)
        }
        self.selectedattendance = false
        selectedstudentStatus = [String](repeating: "", count:100)
    }
   
    @IBAction func selectClass(_ sender: Any) {
        
        self.selectedClassName.removeAll()
        
        dropDown.show()
        dropDown.anchorView = classTextfield
        dropDown.dataSource = zipedArr
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            classTextfield.text = item
            self.class_id = classId[index]
            print("selected \(class_id)")
            for data in dataArr {
                
                let classsecName = data.class_section as! [String]
                let studentName  = data.name as! [String]
                let studentID  = data.enroll_id as! [String]
                let indexes = classsecName.enumerated().filter {
                    $0.element == classTextfield.text!
                    }.map{$0.offset}
                
                let name = studentName[indexes.indices]
                let id = studentID[indexes.indices]
                selectedstudentName = Array(name)
                selectedstudentId = Array(id)
                print("selected \(selectedstudentId)")
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

        self.ac_year = "1"
        self.no_of_present = String(presentIndexes.count)
        self.no_of_absent = String(absentIndexes.count)
        self.class_total = String(selectedstudentName.count)
        self.attendence_period = "0"
        self.created_at = self.dateLbl.text!
        self.created_by = GlobalVariables.shared.user_id
        self.status = "A"
        self.sync_status = "NS"
        self.server_at_id = ""
        self.updated_by = ""
        self.updated_at = ""
        
        if self.selectedattendance == true {
            self.saveDataClassAttendance()
            self.saveStudentAttendance()
        }
        else {
            print("Not_Selected")
        }
    }
    
    func saveDataClassAttendance() {
        
        saveAttendanceData(ac_year:self.ac_year,class_id:self.class_id,class_total:self.class_total,no_of_present:self.no_of_present,no_of_absent:self.no_of_absent,attendence_period:self.attendence_period,created_by:self.created_by,created_at:self.created_at,status:self.status,id:self.attendanceTakeid,sync_status:self.sync_status,server_at_id:self.server_at_id,updated_at:self.updated_at, updated_by:self.updated_by)
    }
    
    func saveStudentAttendance() {
  
        for datas in atendHistory {
            
            let attend_id = datas.attendId
            let server_attend_id = datas.serverAtendId
            let class_id = datas.classId
            let student_id = datas.studentId
            let abs_date = datas.absDate
            let a_status = datas.Atendstatus
            let attend_period = datas.attendPeriod
            let a_val = datas.aVal
            let a_taken_by = datas.takenBy
            let created_at = datas.createdAt
            let updated_by = datas.updatedBy
            let updated_at = datas.updatedAt
            let status = datas.status
            let sync_status = datas.syncStatus
            let id = datas.iD
            self.saveStudentAttendance(attend_id:attend_id!,server_attend_id:server_attend_id!,class_id:class_id!,student_id:student_id!,abs_date:abs_date!,a_status:a_status!,attend_period:attend_period!,a_val:a_val!,a_taken_by:a_taken_by!,created_at:created_at!,updated_by:updated_by!,updated_at:updated_at!,status:status!,sync_status:sync_status!,id:id!)
            }
    }
    
    func SetDate() {
        
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        dateLbl.text = result
    }
}
    

extension TakeAttendanceVC {
    
    func fetchData() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ClassSubjects")
    
        do {
            let results = try context.fetch(fetchRequest)
            let  datas = results as! [ClassSubjects]
    
            for data in datas {
                className = data.class_name as! [String]
                secName = data.sec_name as! [String]
                classId = data.class_master_id as! [String]
                let ziped = zip(className, secName)
                let result = ziped.map { $0.0 + " " + $0.1 }
                zipedArr = result
            }
            print(classId)
            print(className)
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
    
    func fetchAttendancetaken(){
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ClassAttendances")
        do {
            let results = try context.fetch(fetchRequest)
            let  datas = results as! [ClassAttendances]
    
            for data in datas {
                let crted = data.created_by
                atendanceCountId.append(crted!)
            }
            attendanceTakeid = String(atendanceCountId.count)
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func fethStudenttendHistory() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ClassAttendanceHistory")
        do {
            let results = try context.fetch(fetchRequest)
            let data = results as! [ClassAttendanceHistory]
            
            for dataa in data {
                let idCount = dataa.a_taken_by
                studentCount.append(idCount!)
            }
            studentaddId = String(studentCount.count)
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
        let selectedIndex = Int(row)
        let indexPath = IndexPath(row: row, section: section)
        let cell: AttendanceTakeCell = self.tableView.cellForRow(at: indexPath) as! AttendanceTakeCell
        dropDown.show()
        dropDown.anchorView = cell.status
        dropDown.dataSource = attendanceStatusArr
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            if index == 0 {
                self.AttendanceStatus = "P"
            }
            else if index == 1 {
                self.AttendanceStatus = "L"
            }
            else if index == 2 {
                self.AttendanceStatus = "Ab"
            }
            else if index == 3 {
                self.AttendanceStatus = "OD"
            }
        self.selectedstudentStatus[row] = item
        print(selectedstudentStatus)
        let sel = self.selectedstudentId[selectedIndex]
        if studentID.contains(sel){
                print("Already exists")
        }
        else {
            let res = Int(studentaddId)! + studentID.count
            studentID.append(sel)
            studentIncrementID = String(res)
            let dataas = AttendanceHistory(atendStatus:self.AttendanceStatus, TakeBy: GlobalVariables.shared.user_id, A_val: "", AbsentDate: self.dateLbl.text!, AtendId: self.attendanceTakeid, AtendPeriod: "", ClasID:self.class_id, CretedAt:self.dateLbl.text!, ID: self.studentIncrementID, ServerAtendID: "", Status: "A", SyncStatus: "NS", UpdatedAT:"", UpdatedBY: "", StudentID:self.studentID.first! )
            self.atendHistory.append(dataas)
            self.selectedattendance = true
        }
        print(studentID)
        print(studentIncrementID)
        self.tableView.reloadData()
        }
    }
    
    func saveAttendanceData(ac_year:String,class_id:String,class_total:String,no_of_present:String,no_of_absent:String,attendence_period:String,created_by:String,created_at:String,status:String,id:String,sync_status:String,server_at_id:String,updated_at:String,updated_by:String){
        
        let teacherProfile = NSEntityDescription.insertNewObject(forEntityName: "ClassAttendances", into: context!)
        
        teacherProfile.setValue(ac_year, forKey: "ac_year")
        teacherProfile.setValue(class_id, forKey: "class_id")
        teacherProfile.setValue(class_total, forKey: "class_total")
        teacherProfile.setValue(no_of_present, forKey: "no_of_present")
        teacherProfile.setValue(no_of_absent, forKey: "no_of_absent")
        teacherProfile.setValue(attendence_period, forKey: "attendence_period")
        teacherProfile.setValue(created_by, forKey: "created_by")
        teacherProfile.setValue(created_at, forKey: "created_at")
        teacherProfile.setValue(status, forKey: "status")
        teacherProfile.setValue(id, forKey: "id")
        teacherProfile.setValue(sync_status, forKey: "sync_status")
        teacherProfile.setValue(server_at_id, forKey: "server_at_id")
        teacherProfile.setValue(updated_at, forKey: "updated_at")
        teacherProfile.setValue(updated_by, forKey: "updated_by")
        do {
            try context?.save()
                print(" Attendance Saved sucess")
            }
        catch {
            print("error")
        }
    }
    
    func saveStudentAttendance(attend_id:String,server_attend_id:String,class_id:String,student_id:String,abs_date:String,a_status:String,attend_period:String,a_val:String,a_taken_by:String,created_at:String,updated_by:String,updated_at:String,status:String,sync_status:String,id:String){
        
        let studentAttendance = NSEntityDescription.insertNewObject(forEntityName: "ClassAttendanceHistory", into: context!)
      
        studentAttendance.setValue(attend_id, forKey: "attend_id")
        studentAttendance.setValue(server_attend_id, forKey: "server_attend_id")
        studentAttendance.setValue(class_id, forKey: "class_id")
        studentAttendance.setValue(student_id, forKey: "student_id")
        studentAttendance.setValue(abs_date, forKey: "abs_date")
        studentAttendance.setValue(a_status, forKey: "a_status")
        studentAttendance.setValue(attend_period, forKey: "attend_period")
        studentAttendance.setValue(a_val, forKey: "a_val")
        studentAttendance.setValue(a_taken_by, forKey: "a_taken_by")
        studentAttendance.setValue(created_at, forKey: "created_at")
        studentAttendance.setValue(updated_by, forKey: "updated_by")
        studentAttendance.setValue(updated_at, forKey: "updated_at")
        studentAttendance.setValue(status, forKey: "status")
        studentAttendance.setValue(sync_status, forKey: "sync_status")
        studentAttendance.setValue(id, forKey: "id")
        
        do {
            try context?.save()
                print(" Attendance Saved suucess")
//                self.fetchAttendancetaken()
//                self.fethStudenttendHistory()
            }
        catch {
            print("error")
        }
    }
}
