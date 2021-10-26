//
//  ExamResultsDetailsVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 19/10/21.
//

import UIKit
import MBProgressHUD

protocol TeachersExamsResultsDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: TeachersExamsResultsModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: TeachersExamsResultsModel.Fetch.ViewModel)
}
class ExamResultsDetailsVC: UIViewController, TeachersExamsResultsDisplayLogic {
   
    @IBOutlet weak var tableView: UITableView!
    
    var selectedClassId = String()
    var selectedExamId = String()
    var selectedsubId = String()
    var selectedInternalExternal = String()
    var interactor: TeachersExamsResultsBusinessLogic?
    var displayedTeachersExamsResultsData: [TeachersExamsResultsModel.Fetch.ViewModel.DisplayedTeachersExamsResultsData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: TeachersExamsResultsModel.Fetch.Request(class_id :self.selectedClassId,exam_id :self.selectedExamId,subject_id :self.selectedsubId,is_internal_external :self.selectedInternalExternal))
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
        let interactor = TeachersExamsResultsInteractor()
        let presenter = TeachersExamsResultsPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}

extension ExamResultsDetailsVC {
    
    func successFetchedItems(viewModel: TeachersExamsResultsModel.Fetch.ViewModel) {
        displayedTeachersExamsResultsData = viewModel.displayedTeachersExamsResultsData
        MBProgressHUD.hide(for: self.view, animated: true)
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: TeachersExamsResultsModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
}

extension ExamResultsDetailsVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedTeachersExamsResultsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExamResultsMarksCell
      
        let data = displayedTeachersExamsResultsData[indexPath.row]
        cell.name.text = data.name
        cell.grade.text = data.total_grade
        cell.mark.text = data.total_marks
        cell.selectionStyle = .none
        
        return cell
    }
}
