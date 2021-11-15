//
//  ExamResultsStudentsListVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 18/09/21.
//

import UIKit
import MBProgressHUD

class ExamResultsStudentsListVC: UIViewController, StudentsListDisplayLogic {
    
    @IBOutlet weak var tableView: UITableView!
    
    var interactor2: StudentsListBusinessLogic?
    
    var studentIdArr = [String]()
    var serialNoArr = [Int]()
    var selectedClassId = String()
    var selectedSecId = String()
    var selectedStudentId = String()
    
    var displayedStudentsListData: [StudentsListModel.Fetch.ViewModel.DisplayedStudentsListData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor2?.fetchItems(request: StudentsListModel.Fetch.Request(class_id :self.selectedClassId,section_id: self.selectedSecId,dynamic_db: GlobalVariables.shared.dynamic_db))
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
        let viewController2 = self
        let interactor2 = StudentsListInteractor()
        let presenter2 = StudentsListPresenter()
        viewController2.interactor2 = interactor2
        interactor2.presenter2 = presenter2
        presenter2.viewController2 = viewController2
    }
}

extension ExamResultsStudentsListVC {
    
    func successFetchedItems(viewModel: StudentsListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedStudentsListData = viewModel.displayedStudentsListData
        for i in 1...10000 {
            self.serialNoArr.append(i)
        }
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: StudentsListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"An error occured", complition: {
        })
    }
}

extension ExamResultsStudentsListVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedStudentsListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StudentsListCell
        
        let data = displayedStudentsListData[indexPath.row]
        
        cell.SerialNo.text = String(serialNoArr[indexPath.row])
        cell.admissionNo.text = data.admisn_no
        cell.studentName.text = data.name
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = displayedStudentsListData[indexPath.row]
        self.selectedStudentId = data.enroll_id!
        
//        self.performSegue(withIdentifier: "student_detail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        if (segue.identifier == "student_detail")
//        {
//        let vc = segue.destination as! StudentsDetailsVC
//            vc.studentEnroolId = self.selectedStudentId
//            vc.selectedClassId = self.selectedClassId
//
//        }
    }
}
