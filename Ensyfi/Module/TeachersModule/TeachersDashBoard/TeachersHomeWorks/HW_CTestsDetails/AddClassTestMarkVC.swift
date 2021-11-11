//
//  AddClassTestMarkVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 27/10/21.
//

import UIKit
import CoreData

class AddClassTestMarkVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var selectedHwId = String()
    var selectedClassId = String()
    var selectedTopic = String()
    var selectedDate = String()
    var selectedExamId = String()
    var selectedsubId = String()
    var selectedInternalExternal = String()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context : NSManagedObjectContext?
    var dataArr = [StudentDetails]()
    var CollectionOfCell = [ExamMarkEntryCell]()
    var markEntryModelArr = [CTestMarkEntryDatas]()
    let date = Date()
    let formatter = DateFormatter()
    var dummy = [String]()
    var ArrayCount = Int()
    var todayDate = String()
    
    var studentName = [String]()
    var studentSubject = [String]()
    var studentId = [String]()
    var classSection = [String]()
    var classID = [String]()
    
    var Status = [String]()
    var localHWID = [String]()
    var serverHWID = [String]()
    var marks = [String]()
    var remarks = [String]()
    var createdBy = [String]()
    var createdAt = [String]()
    var updatedBy = [String]()
    var updatedAt = [String]()
    var syncStatus = [String]()
    var Id = [String]()
   
    var filteredStudentName = [String]()
    var filteredSubject = [String]()
    var filteredStudentID = [String]()
    var filteredClassSec = [String]()
    var filteredClassId = [String]()
    var serialNoArr = [Int]()
    var marksText = [String]()
    var enteredMarkText = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(selectedHwId)
        self.hideKeyboardWhenTappedAround()
        self.fetchStudentData()
        self.context = appDelegate.persistentContainer.viewContext
        self.marksText = [String](repeating: "", count:100)
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
        self.enteredMarkText.removeAll()
        CollectionOfCell.forEach { cell in
        self.enteredMarkText.append(cell.markField.text!)
            print(enteredMarkText)
            print(filteredStudentID)
            print(enteredMarkText.count)
            print(filteredStudentID.count)
        }
        
        if enteredMarkText.count == filteredStudentID.count {
            
            let datas = CTestMarkEntryDatas(Student_id: self.filteredStudentID, Local_hw_id: self.localHWID, Server_hw_id:  self.serverHWID, Marks: self.enteredMarkText, Remarks: self.remarks, Status: self.remarks, Created_by:self.createdBy, Created_at:self.createdAt, Updated_by: self.updatedBy, Updated_at:self.updatedAt, Sync_status: self.syncStatus, Id: self.Id)
            self.markEntryModelArr.append(datas)
            self.saveClassTestMarks()
        }
        else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Enter All Fields", complition: {
            })
        }
    }
    
    func SetDate() {
        
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        self.todayDate = result
    }
    
    func fetchStudentData() {
        
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "StudentDetails")
            do {
                let results = try context.fetch(fetchRequest)
                self.dataArr = results as! [StudentDetails]
                
                for data in dataArr {
                    
                    self.studentName = data.name as! [String]
                    self.studentId = data.enroll_id as! [String]
                    self.studentSubject = data.pref_language as! [String]
                    self.classSection = data.class_section as! [String]
                    self.classID = data.class_id as! [String]
                    }
                let examIndexes = classID.enumerated().filter {
                    $0.element == selectedClassId
                    }.map{$0.offset}
                
                self.filteredStudentName = examIndexes.map { studentName[$0] }
                self.filteredSubject = examIndexes.map { studentSubject[$0] }
                self.filteredStudentID = examIndexes.map { studentId[$0] }
                self.filteredClassSec = examIndexes.map { classSection[$0] }
                self.filteredClassId = examIndexes.map { classID[$0] }
                self.ArrayCount = filteredStudentID.count
                
                self.Status = [String](repeating: "A", count:ArrayCount)
                self.localHWID = [String](repeating: selectedHwId, count:ArrayCount)
                self.serverHWID = [String](repeating: "", count:ArrayCount)
                self.remarks = [String](repeating: "", count:ArrayCount)
                self.createdBy = [String](repeating: GlobalVariables.shared.user_id, count:ArrayCount)
                self.createdAt = [String](repeating: todayDate, count:ArrayCount)
                self.updatedBy = [String](repeating: "", count:ArrayCount)
                self.updatedAt = [String](repeating: "", count:ArrayCount)
                self.syncStatus = [String](repeating: "NS", count:ArrayCount)
                self.Id = [String](repeating: "1", count:ArrayCount)
                print(Status)
                
                for i in 1...ArrayCount {
                    self.serialNoArr.append(i)
                }
                self.tableView.reloadData()
                
            } catch let err as NSError {
                print(err.debugDescription)
            }
      }
}

extension AddClassTestMarkVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredSubject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExamMarkEntryCell
        CollectionOfCell.append(cell)
//        let name = zip(filteredStudentName,filteredSubject).map { "\($0)-\($1)" }
        cell.SerialNo.text = String(serialNoArr[indexPath.row])
        cell.name.text = filteredStudentName[indexPath.row]
//        cell.markField.text = marksText[indexPath.row]
        cell.markField.tag = indexPath.row
        cell.selectionStyle = .none
        return cell
        
        }
    
    func saveClassTestMarks(){
        
        let studentAttendance = NSEntityDescription.insertNewObject(forEntityName: "ClassTestMarkEntry", into: context!)
        
        for data in markEntryModelArr {
            
            studentAttendance.setValue(data.student_id, forKey: "student_id")
            studentAttendance.setValue(data.local_hw_id, forKey: "local_hw_id")
            studentAttendance.setValue(data.server_hw_id, forKey: "server_hw_id")
            studentAttendance.setValue(data.marks, forKey: "marks")
            studentAttendance.setValue(data.remarks, forKey: "remarks")
            studentAttendance.setValue(data.status, forKey: "status")
            studentAttendance.setValue(data.created_by, forKey: "created_by")
            studentAttendance.setValue(data.created_at, forKey: "created_at")
            studentAttendance.setValue(data.updated_by, forKey: "updated_by")
            studentAttendance.setValue(data.updated_at, forKey: "updated_at")
            studentAttendance.setValue(data.sync_status, forKey: "sync_status")
            studentAttendance.setValue(serialNoArr, forKey: "id")
        }
      
        do {
            try context?.save()
                print(" HomeWork_test Saved suucess")
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Saved success", complition: {
                self.navigationController?.popViewController(animated: true)
            })
            }
        catch {
            print("error")
        }
    }
}

struct CTestMarkEntryDatas {
    
    var student_id : [String]?
    var local_hw_id : [String]?
    var server_hw_id : [String]?
    var marks : [String]?
    var remarks : [String]?
    var status : [String]?
    var created_by : [String]?
    var created_at : [String]?
    var updated_by : [String]?
    var updated_at : [String]?
    var sync_status : [String]?
    var id : [String]?
   
    init(Student_id:[String],Local_hw_id:[String],Server_hw_id:[String],Marks:[String],Remarks:[String],Status:[String],Created_by:[String],Created_at:[String],Updated_by:[String],Updated_at:[String],Sync_status:[String],Id:[String]){
        
        self.student_id = Student_id
        self.local_hw_id = Local_hw_id
        self.server_hw_id = Server_hw_id
        self.marks = Marks
        self.remarks = Remarks
        self.status = Status
        self.created_by = Created_by
        self.created_at = Created_at
        self.updated_by = Updated_by
        self.updated_at = Updated_at
        self.sync_status = Sync_status
        self.id = Id
    }
}
//func saveClassTestMarks(student_id:String,local_hw_id:String,server_hw_id:String,marks:String,remarks:String,status:String,created_by:String,created_at:String,updated_by:String,updated_at:String,sync_status:String,id:String){
