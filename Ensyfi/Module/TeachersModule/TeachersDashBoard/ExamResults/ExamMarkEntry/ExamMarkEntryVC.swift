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
    var ArrayCount = Int()
    var todayDate = String()
    
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
    
    var exam_id = [String]()
    var teacher_id = [String]()
    var subject_id = [String]()
    var class_id = [String]()
    var stu_id = [String]()
    var internal_mark = [String]()
    var external_grade = [String]()
    var total_grade = [String]()
    var created_by = [String]()
    var created_at = [String]()
    var updated_by = [String]()
    var updated_at = [String]()
    var sync_status = [String]()
    var id = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchStudentData()
        self.context = appDelegate.persistentContainer.viewContext
        self.marksText = [String](repeating: "", count:100)
        self.hideKeyboardWhenTappedAround()
    }
    
    func SetDate() {
        
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        self.selectedDate = String(result)
    }
    
    @IBAction func save_Marks(_ sender: Any) {
        
        self.enteredMarkText.removeAll()
        CollectionOfCell.forEach { cell in
        self.enteredMarkText.append(cell.markField.text!)
        }
        
        if enteredMarkText.contains(""){
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Enter all student marks", complition: {
            })
        }
        else {
            let datas = ExamMarksEntryData(Exam_id: self.exam_id, Teacher_id: self.teacher_id, Class_id: class_id, TotalMarks:self.enteredMarkText, Subject_id:  self.subject_id, Stu_id: self.filteredStudentID, Internal_mark: self.internal_mark, External_grade: self.external_grade, Total_grade:self.total_grade, Created_by:self.created_by, Created_at: self.created_at, Updated_by:self.updated_by, Updated_at: self.updated_at, Sync_status: self.sync_status,ID:self.id)
            self.examMarkEntryData.append(datas)
            self.saveStudentsMark()
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
//        cell.markField.text = marksText[indexPath.row]
        cell.markField.addTarget(self, action: #selector(textChanged(textField:)), for: .editingChanged)
        cell.markField.tag = indexPath.row
        cell.selectionStyle = .none
        return cell
        }

    @objc func textChanged(textField: UITextField) {
            
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
                
                self.exam_id = [String](repeating: selectedExamId, count:ArrayCount)
                self.teacher_id = [String](repeating: GlobalVariables.shared.user_id, count:ArrayCount)
                self.class_id = [String](repeating: selectedClassId, count:ArrayCount)
                self.subject_id = [String](repeating: selectedsubId, count:ArrayCount)
                self.internal_mark = [String](repeating: "", count:ArrayCount)
                self.external_grade = [String](repeating: "", count:ArrayCount)
                self.total_grade = [String](repeating: "", count:ArrayCount)
                self.created_by = [String](repeating: GlobalVariables.shared.user_id, count:ArrayCount)
                self.created_at = [String](repeating: selectedDate, count:ArrayCount)
                self.updated_by = [String](repeating: "", count:ArrayCount)
                self.sync_status = [String](repeating: "NS", count:ArrayCount)
                self.updated_at = [String](repeating: "", count:ArrayCount)
//                self.id = [String](repeating: serialNoArr, count:ArrayCount)
                
                print(exam_id)
                print(class_id)
                print(subject_id)
                print(created_at)
               
                for i in 1...10000 {
                    self.serialNoArr.append(i)
                }
                self.tableView.reloadData()
                
            } catch let err as NSError {
                print(err.debugDescription)
            }
      }
    
    func saveStudentsMark() {
        
        let studentAttendance = NSEntityDescription.insertNewObject(forEntityName: "ExamMarkEntry", into: context!)
      
        for data in examMarkEntryData {
            
            studentAttendance.setValue(data.exam_id, forKey: "exam_id")
            studentAttendance.setValue(data.teacher_id, forKey: "teacher_id")
            studentAttendance.setValue(data.subject_id, forKey: "subject_id")
            studentAttendance.setValue(data.stu_id, forKey: "stu_id")
            studentAttendance.setValue(data.internal_mark, forKey: "internal_mark")
            studentAttendance.setValue(data.external_grade, forKey: "external_grade")
            studentAttendance.setValue(data.totalMarks, forKey: "total_marks")
            studentAttendance.setValue(data.total_grade, forKey: "total_grade")
            studentAttendance.setValue(data.created_by, forKey: "created_by")
            studentAttendance.setValue(data.created_at, forKey: "created_at")
            studentAttendance.setValue(data.updated_by, forKey: "updated_by")
            studentAttendance.setValue(data.updated_at, forKey: "updated_at")
            studentAttendance.setValue(data.sync_status, forKey: "sync_status")
            studentAttendance.setValue(data.id, forKey: "id")
            studentAttendance.setValue(data.class_id, forKey: "classmaster_id")
        }
        do {
            try context?.save()
                print("Exam Marks Saved suucess")
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Saved success", complition: {
                self.navigationController?.popViewController(animated: true)
            })
            }
        catch {
            print("error")
        }
    }
}

  
struct ExamMarksEntryData {
    
    var exam_id : [String]?
    var teacher_id : [String]?
    var subject_id : [String]?
    var stu_id : [String]?
    var internal_mark : [String]?
    var totalMarks : [String]?
    var external_grade : [String]?
    var total_grade : [String]?
    var created_by : [String]?
    var created_at : [String]?
    var updated_by : [String]?
    var updated_at : [String]?
    var sync_status : [String]?
    var id : [String]?
    var class_id : [String]?
    
    
    init(Exam_id:[String],Teacher_id:[String],Class_id:[String],TotalMarks:[String],Subject_id:[String],Stu_id:[String],Internal_mark:[String],External_grade:[String],Total_grade:[String],Created_by:[String],Created_at:[String],Updated_by:[String],Updated_at:[String],Sync_status:[String],ID:[String]){
        
        self.exam_id = Exam_id
        self.teacher_id = Exam_id
        self.subject_id = Subject_id
        self.stu_id = Stu_id
        self.internal_mark = Internal_mark
        self.external_grade = External_grade
        self.total_grade = Total_grade
        self.created_by = Created_by
        self.created_at = Created_at
        self.updated_by = Updated_by
        self.updated_at = Updated_at
        self.sync_status = Sync_status
        self.id = Sync_status
        self.totalMarks = TotalMarks
        self.class_id = Class_id
        
    }
}
