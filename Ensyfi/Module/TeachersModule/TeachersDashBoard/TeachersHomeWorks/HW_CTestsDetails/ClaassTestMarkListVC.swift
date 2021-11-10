//
//  UpdateClassTestListVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 27/10/21.
//

import UIKit
import CoreData
import MBProgressHUD

protocol ClassTestMarkListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel:ClassTestMarkListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel:ClassTestMarkListModel.Fetch.ViewModel)
}

class ClaassTestMarkListVC: UIViewController, ClassTestMarkListDisplayLogic {
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedClassId = String()
    var selectedTopic = String()
    var selectedDate = String()
    var selectedExamId = String()
    var selectedsubId = String()
    var selectedInternalExternal = String()
    var selectedHwId = String()
     
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context : NSManagedObjectContext?
    var dataArr = [StudentDetails]()
    var interactor: ClassTestMarkListBusinessLogic?
    var displayedClassTestMarkListData: [ClassTestMarkListModel.Fetch.ViewModel.DisplayedClassTestMarkListData] = []
    
    let date = Date()
    let formatter = DateFormatter()
    var dummy = [String]()
    var dummy1 = [String]()
    
    var studentName = [String]()
    var studentSubject = [String]()
    var studentId = [String]()
    var classSection = [String]()
    var classID = [String]()
    var markArr = [String]()
    
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
        print(selectedClassId)
        self.hideKeyboardWhenTappedAround()
        self.context = appDelegate.persistentContainer.viewContext
        
        interactor?.fetchItems(request: ClassTestMarkListModel.Fetch.Request(hw_id :self.selectedHwId))
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
        let interactor = ClassTestMarkListInteractor()
        let presenter = ClassTestMarkListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    @IBAction func editAction(_ sender: Any) {
        
        self.performSegue(withIdentifier: "to_updateMarkList", sender: self)
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
                self.filteredStudentID = examIndexes.map { studentId[$0] }
                self.filteredSubject = examIndexes.map { studentSubject[$0] }
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


extension ClaassTestMarkListVC : UITableViewDelegate,UITableViewDataSource {
    
    func successFetchedItems(viewModel: ClassTestMarkListModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedClassTestMarkListData = viewModel.displayedClassTestMarkListData
        for data in displayedClassTestMarkListData{
            let mark = data.marks
            self.markArr.append(mark!)
        }
        
        self.fetchStudentData()
//        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: ClassTestMarkListModel.Fetch.ViewModel) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredStudentName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StudentMarkListCell
        
//        let data = displayedClassTestMarkListData[indexPath.row]
        cell.name.text = filteredStudentName[indexPath.row]
        cell.marks.text = markArr[indexPath.row]
        cell.selectionStyle = .none
        return cell
        
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   
        if (segue.identifier == "to_updateMarkList")
        {
        let vc = segue.destination as! UpdateClassTestMarkVC
            vc.selectedClassId = self.selectedClassId
//              vc.selectedTitle = self.selectedTitle
            vc.selectedDate = self.selectedDate
            vc.selectedHwId = self.selectedHwId
        }
    }
}

