//
//  Exams&ResultsVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 09/10/21.
//

import UIKit
import CoreData
import DropDown
import MBProgressHUD

protocol TeachersExamsListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: TeachersExamsListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: TeachersExamsListModel.Fetch.ViewModel)
}

class Exams_ResultsVC: UIViewController, TeachersExamsListDisplayLogic {
    
    @IBOutlet weak var classTextfield: UITextField!
    @IBOutlet weak var subTextField: UITextField!
    @IBOutlet weak var classBtnOutlet: UIButton!
    @IBOutlet weak var subBtnOutlet: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var className = [String]()
    var classId = [String]()
    var secName = [String]()
    var secId = [String]()
    var zipedArr = [String]()
    var subName = [String]()
    var seleSubID = [String]()
    var seleSubName = [String]()
    var subID = [String]()
    var examiddd = Int()
   
    var selectedClassId = String()
    var selectedSubId = String()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context : NSManagedObjectContext?
    let dropDown = DropDown()
    var classSubjectArr = [ClassSubjects]()
    var examsArr = [ExamsDatas]()
    var interactor: TeachersExamsListBusinessLogic?
    var displayedTeachersExamsListData: [TeachersExamsListModel.Fetch.ViewModel.DisplayedTeachersExamsListData] = []
    
    var examName = [String]()
    var examID = [String]()
    var examSubName = [String]()
    var examSubId = [String]()
    var examDate = [String]()
    var examClassId = [String]()
    var examFromdate = [String]()
    var examTodate = [String]()
    var markStatus = [String]()
    var isInternalExternalStatus = [String]()
    
    var filteredExamName = [String]()
    var filteredExamId = [String]()
    var filteredMarkStatus = [String]()
    var filteredTodate = [String]()
    var filteredFromdate = [String]()
    var filteredExamClassId = [String]()
    var filteredInternalExternal = [String]()
    
    var selectednternalExternal = String()
    var selectedExamName = String()
    var selectedExamId = String()
    var selectedStatus = String()
    var selectedTodate = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.fetchDataClassSubject()
        self.fetchExamDetails()
        self.context = appDelegate.persistentContainer.viewContext
        interactor?.fetchItems(request: TeachersExamsListModel.Fetch.Request(teacher_id :"1"))
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup()
    {
        let viewController = self
        let interactor = TeachersExamsListInteractor()
        let presenter = TeachersExamsListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    @IBAction func selectClass(_ sender: Any) {
        
        self.seleSubName.removeAll()
        self.seleSubID.removeAll()
        dropDown.show()
        dropDown.anchorView = classTextfield
        dropDown.dataSource = zipedArr
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            classTextfield.text = item
            let slecteId = classId[index]
            self.selectedClassId = String(slecteId)
            let subjectName = subName[index]
            let subId = subID[index]
            seleSubName.append(subjectName)
            seleSubID.append(subId)
        }
    }
    
    @IBAction func selectSubject(_ sender: Any) {
        
        dropDown.show()
        dropDown.anchorView = subTextField
        dropDown.dataSource = seleSubName
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            subTextField.text = item
            let slecteId = seleSubID[index]
            self.selectedSubId = slecteId
            print(selectedSubId)
            
            for data in examsArr {
                
                self.examName = data.exam_name as! [String]
                self.examID = data.exam_id as! [String]
                self.markStatus = data.markStatus as! [String]
                self.examTodate = data.todate as! [String]
                self.examFromdate = data.fromdate as! [String]
                self.examClassId = data.classmaster_id as! [String]
                self.examClassId = data.classmaster_id as! [String]
                self.isInternalExternalStatus = data.is_internal_external as! [String]
               
            }
            let examIndexes = examClassId.enumerated().filter {
                $0.element == selectedClassId
                }.map{$0.offset}
            
            self.filteredExamName = examIndexes.map { examName[$0] }
            self.filteredExamId = examIndexes.map { examID[$0] }
            self.filteredFromdate = examIndexes.map { examFromdate[$0] }
            self.filteredTodate = examIndexes.map { examTodate[$0] }
            self.filteredExamClassId = examIndexes.map { examClassId[$0] }
            self.filteredMarkStatus = examIndexes.map { markStatus[$0] }
            self.filteredInternalExternal = examIndexes.map { isInternalExternalStatus[$0] }
            print(filteredMarkStatus)
            self.tableView.reloadData()
        }
    }
    
    func fetchDataClassSubject() {
    
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ClassSubjects")
    
        do {
            let results = try context.fetch(fetchRequest)
            self.classSubjectArr = results as! [ClassSubjects]
    
            for data in classSubjectArr {
                self.className = data.class_name as! [String]
                self.secName = data.sec_name as! [String]
                self.classId = data.class_master_id as! [String]
                self.subName = data.subject_name as! [String]
                self.subID = data.subject_id as! [String]
                print(className)
                let ziped = zip(className, secName)
                let result = ziped.map { $0.0 + " " + $0.1 }
                self.zipedArr = result
            }
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func fetchExamDetails() {
    
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ExamsDatas")
    
        do {
            let results = try context.fetch(fetchRequest)
            self.examsArr = results as! [ExamsDatas]
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
}

extension Exams_ResultsVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredExamName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExamsCell
      
        let dates = filteredFromdate + filteredTodate
        cell.title.text = filteredExamName[indexPath.row]
        cell.date.text = dates[indexPath.row]
        cell.status.text = filteredMarkStatus[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedExamName = filteredExamName[indexPath.row]
        self.selectedExamId = filteredExamId[indexPath.row]
        self.selectedStatus = filteredMarkStatus[indexPath.row]
        self.selectedTodate = filteredTodate[indexPath.row]
        self.selectednternalExternal = filteredInternalExternal[indexPath.row]
        print(selectednternalExternal)
        
        if selectedStatus == "1" {
            self.performSegue(withIdentifier: "to_examResultsDetails", sender: self)
        }
        else if selectedStatus == "0"{
            
            self.performSegue(withIdentifier: "to_examMarkEntry", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "to_examResultsDetails")
        {
        let vc = segue.destination as! ExamResultsDetailsVC
            vc.selectedClassId = self.selectedClassId
            vc.selectedExamId = self.selectedExamId
            vc.selectedsubId = self.selectedSubId
            vc.selectedInternalExternal = self.selectednternalExternal
        }
        else if (segue.identifier == "to_examMarkEntry")
        {
            let vc = segue.destination as! ExamMarkEntryVC
            vc.selectedClassId = self.selectedClassId
            vc.selectedExamId = self.selectedExamId
            vc.selectedsubId = self.selectedSubId
            vc.selectedInternalExternal = self.selectednternalExternal
        }
    }
}

extension Exams_ResultsVC {
    
    func successFetchedItems(viewModel: TeachersExamsListModel.Fetch.ViewModel) {
        displayedTeachersExamsListData = viewModel.displayedTeachersExamsListData
        MBProgressHUD.hide(for: self.view, animated: true)
        
        for data in displayedTeachersExamsListData {
            
//            self.examName = data.exam_name as! [String]
//            self.examID = data.exam_id as! [String]
//            self.markStatus = data.markStatus as! [String]
//            self.examTodate = data.todate as! [String]
//            self.examFromdate = data.fromdate as! [String]
//            self.examClassId = data.classmaster_id as! [String]
           
        }
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: TeachersExamsListModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
}
