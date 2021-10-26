//
//  ExamMarkEntryVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 19/10/21.
//

import UIKit
import CoreData
import MBProgressHUD

class ExamMarkEntryVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var selectedClassId = String()
    var selectedExamId = String()
    var selectedsubId = String()
    var selectedInternalExternal = String()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context : NSManagedObjectContext?
    var dataArr = [StudentDetails]()
    let date = Date()
    let formatter = DateFormatter()
    var selectedDate = String()
    var dummy = [String]()
    var dummy1 = [String]()
    
    var studentName = [String]()
    var studentSubject = [String]()
    var studentId = [String]()
    var classSection = [String]()
    var classID = [String]()
    
    var filteredStudentName = [String]()
    var filteredSubject = [String]()
    var filteredStudentID = [String]()
    var filteredClassSec = [String]()
    var filteredClassId = [String]()
    var serialNoArr = [Int]()
    var marksText = [String]()
    var enteredMarkText = [String]()
    var CollectionOfCell = [ExamMarkEntryCell]()
    var examMarkEntryData = [ExamMarksEntryData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchStudentData()
        self.context = appDelegate.persistentContainer.viewContext
        // Do any additional setup after loading the view.
        self.marksText = [String](repeating: "", count:100)
        self.hideKeyboardWhenTappedAround()
    }
    
    func SetDate() {
        
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        self.selectedDate = String(result)
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
                
                for i in 1...10000 {
                    self.serialNoArr.append(i)
                }
                self.tableView.reloadData()
                
            } catch let err as NSError {
                print(err.debugDescription)
            }
      }
}

extension ExamMarkEntryVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredSubject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExamMarkEntryCell
        CollectionOfCell.append(cell)
        let name = zip(filteredStudentName,filteredSubject).map { "\($0)-\($1)" }
        cell.SerialNo.text = String(serialNoArr[indexPath.row])
        cell.name.text = name[indexPath.row]
        cell.markField.text = marksText[indexPath.row]
        cell.markField.addTarget(self, action: #selector(textChanged(textField:)), for: .editingChanged)
        cell.markField.tag = indexPath.row
        cell.selectionStyle = .none
        return cell
        }

    @objc func textChanged(textField: UITextField) {
            
    }
    
    @IBAction func save(_ sender: Any) {
        
    }
    
    @IBAction func save_Marks(_ sender: Any) {
        
        self.enteredMarkText.removeAll()
        CollectionOfCell.forEach { cell in
        self.enteredMarkText.append(cell.markField.text!)
        }
        
        let sequence = zip(enteredMarkText, filteredStudentID)
        
        for datas in sequence {
            let dataas = ExamMarksEntryData(Exam_id:self.selectedExamId, Teacher_id: GlobalVariables.shared.user_id, Subject_id: "", Stu_id:datas.1,Internal_mark: "", External_grade: "", Total_marks:datas.0, Total_grade:"", Created_by:GlobalVariables.shared.user_id,Created_at: self.selectedDate,Updated_by: "",Updated_at: "",Sync_status: "NS")
                self.examMarkEntryData.append(dataas)
           }
        
        for data in examMarkEntryData {

            saveStudentsMark(exam_id:data.exam_id!,teacher_id:data.teacher_id!,subject_id:data.subject_id!,stu_id:data.stu_id!,internal_mark:data.internal_mark!,external_grade:data.external_grade!,total_marks:data.total_marks!,total_grade:data.total_grade!,created_by:data.created_by!,created_at:data.created_at!,updated_by:data.updated_at!,updated_at:data.updated_at!,sync_status:data.sync_status!,id:data.id!)
        }
    }
    
    func saveStudentsMark(exam_id:String,teacher_id:String,subject_id:String,stu_id:String,internal_mark:String,external_grade:String,total_marks:String,total_grade:String,created_by:String,created_at:String,updated_by:String,updated_at:String,sync_status:String,id:String) {
        
        let studentAttendance = NSEntityDescription.insertNewObject(forEntityName: "ExamMarkEntry", into: context!)
      
        studentAttendance.setValue(exam_id, forKey: "exam_id")
        studentAttendance.setValue(teacher_id, forKey: "teacher_id")
        studentAttendance.setValue(subject_id, forKey: "subject_id")
        studentAttendance.setValue(stu_id, forKey: "stu_id")
        studentAttendance.setValue(internal_mark, forKey: "internal_mark")
        studentAttendance.setValue(external_grade, forKey: "external_grade")
        studentAttendance.setValue(total_marks, forKey: "total_marks")
        studentAttendance.setValue(total_grade, forKey: "total_grade")
        studentAttendance.setValue(created_by, forKey: "created_by")
        studentAttendance.setValue(created_at, forKey: "created_at")
        studentAttendance.setValue(updated_by, forKey: "updated_by")
        studentAttendance.setValue(updated_at, forKey: "updated_at")
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

  
struct ExamMarksEntryData {
    
    var exam_id : String?
    var teacher_id : String?
    var subject_id : String?
    var stu_id : String?
    var internal_mark : String?
    var external_grade : String?
    var total_marks : String?
    var total_grade : String?
    var created_by : String?
    var created_at : String?
    var updated_by : String?
    var updated_at : String?
    var sync_status : String?
    var id : String?
    
    init(Exam_id:String,Teacher_id:String,Subject_id:String,Stu_id:String,Internal_mark:String,External_grade:String,Total_marks:String,Total_grade:String,Created_by:String,Created_at:String,Updated_by:String,Updated_at:String,Sync_status:String){
        
        self.exam_id = Exam_id
        self.teacher_id = Exam_id
        self.subject_id = Subject_id
        self.stu_id = Stu_id
        self.internal_mark = Internal_mark
        self.external_grade = External_grade
        self.total_marks = Total_marks
        self.total_grade = Total_grade
        self.created_by = Created_by
        self.created_at = Created_at
        self.updated_by = Updated_by
        self.updated_at = Updated_at
        self.sync_status = Sync_status
    }
}
