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
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bgView: UIView!
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
    
    var filteredTitle = [String]()
    var filteredSubject = [String]()
    var filteredDate = [String]()
    var filteredDetails = [String]()
    var filteredType = [String]()
    var filteredHwID = [String]()
    var filteredMarkStatus = [String]()
    
    var selectedTopic = String()
    var selectedTitle = String()
    var selectedDate = String()
    var selectedDescription = String()
    var selectedHwId = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.context = appDelegate.persistentContainer.viewContext
        self.hwhtType = ["Class Test","Home Work"]
        self.fetchHWData()
        self.fetchData()
        self.bgView.dropShadow()
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
                let classIDIndex = class_id.enumerated().filter {
                    $0.element == selectedClassId
                    }.map{$0.offset}
                
                let hwTypeIndex = hw_type.enumerated().filter {
                    $0.element == selectedHwType
                    }.map{$0.offset}
                
                let resultIndex = classIDIndex.filter () { hwTypeIndex.contains($0) }
                
                self.filteredTitle = resultIndex.map { titleArr[$0] }
                self.filteredSubject = resultIndex.map { subject_name[$0] }
                self.filteredDate = resultIndex.map { due_date[$0] }
                self.filteredDetails = resultIndex.map { hw_details[$0] }
                self.filteredType = resultIndex.map { hw_type[$0] }
                self.filteredHwID = resultIndex.map { hw_id[$0] }
                self.filteredMarkStatus = resultIndex.map { mark_status[$0] }
                self.tableView.reloadData()
          }
    }
    
    @IBAction func assignHW_CTest(_ sender: Any) {
        
        self.performSegue(withIdentifier: "to_assignHW/Test", sender: self)
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
               
                self.hw_id = data.hw_id as! [String]
                self.hw_type = data.hw_type as! [String]
                self.titleArr = data.title as! [String]
                self.test_date = data.test_date as! [String]
                self.due_date = data.due_date as! [String]
                self.teacher_id = data.times as! [String]
                self.hw_details = data.hw_details as! [String]
                self.mark_status = data.mark_status as! [String]
                self.subject_id = data.subject_id as! [String]
                self.subject_name = data.subject_name as! [String]
                self.sec_name = data.sec_name as! [String]
                self.class_id = data.class_id as! [String]
            }
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
}

extension TeachersHomeWorkVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeWorkListCell
                
        cell.title.text = filteredTitle[indexPath.row]
        cell.date.text = " Due Date : \(filteredDate[indexPath.row])"
        if filteredType[indexPath.row] == "HT" {
            cell.subName.text = "\(filteredSubject[indexPath.row]) - CLASS TEST"
        }
        else {
            cell.subName.text = "\(filteredSubject[indexPath.row]) - HOME WORK"
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if selectedHwType == "HW" {
            self.selectedTopic = filteredTitle[indexPath.row]
            self.selectedTitle = filteredSubject[indexPath.row]
            self.selectedDate = filteredDate[indexPath.row]
            self.selectedDescription = filteredDetails[indexPath.row]
            self.selectedHwId = filteredHwID[indexPath.row]
            self.performSegue(withIdentifier: "to_HWDetails", sender: self)
        }
        else {
            self.selectedTopic = filteredTitle[indexPath.row]
            self.selectedTitle = filteredSubject[indexPath.row]
            self.selectedDate = filteredDate[indexPath.row]
            self.selectedDescription = filteredDetails[indexPath.row]
            self.selectedHwId = filteredHwID[indexPath.row]
            if filteredMarkStatus[indexPath.row] == "0"{
                self.performSegue(withIdentifier: "to_ClassTestDetails", sender: self)
            }
            else {
                self.performSegue(withIdentifier: "to_updateMarkDetails", sender: self)
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if (segue.identifier == "to_HWDetails")
        {
        let vc = segue.destination as! TeachersHWDetailsVC
            vc.selectedTopic = self.selectedTopic
            vc.selectedTitle = self.selectedTitle
            vc.selectedDate = self.selectedDate
            vc.selectedDescription = self.selectedDescription
        }
        else if (segue.identifier == "to_ClassTestDetails")
        {
        let vc = segue.destination as! TeachersClassTestDetails
            vc.selectedTopic = self.selectedTopic
            vc.selectedTitle = self.selectedTitle
            vc.selectedDate = self.selectedDate
            vc.selectedDescription = self.selectedDescription
            vc.selectedClassId = self.selectedClassId
        }
        else if (segue.identifier == "to_updateMarkDetails")
        {
        let vc = segue.destination as! UpdateCTestDetailsVC
            vc.selectedTopic = self.selectedTopic
            vc.selectedTitle = self.selectedTitle
            vc.selectedDate = self.selectedDate
            vc.selectedDescription = self.selectedDescription
            vc.selectedClassId = self.selectedClassId
            vc.selectedHwId = self.selectedHwId
        }
    }
}
//to_ClassTestDetails
//UpdateCTestDetailsVC
