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
    let date = Date()
    let formatter = DateFormatter()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
        self.fetchStudentData()
        self.context = appDelegate.persistentContainer.viewContext
        self.marksText = [String](repeating: "", count:100)
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
        self.enteredMarkText.removeAll()
        CollectionOfCell.forEach { cell in
        self.enteredMarkText.append(cell.markField.text!)
        }
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
        cell.markField.text = marksText[indexPath.row]
        cell.markField.tag = indexPath.row
        cell.selectionStyle = .none
        return cell
        
        }
}

