//
//  StudentsExamResultsVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 22/10/21.
//

import UIKit
import MBProgressHUD

class StudentsExamResultsVC: UIViewController, ExamResultsDisplayLogic {
   
    @IBOutlet weak var tableView: UITableView!
    
    var interactor2: ExamResultsBusinessLogic?
    var displayedExamResultsData: [ExamResultsModel.Fetch.ViewModel.DisplayedExamResultsData] = []
    var selectedExamId = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor2?.fetchItems(request: ExamResultsModel.Fetch.Request(class_id:GlobalVariables.shared.class_id,section_id:"Students"))
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
        let interactor2 = ExamResultsInteractor()
        let presenter2 = ExamResultsPresenter()
        viewController2.interactor2 = interactor2
        interactor2.presenter2 = presenter2
        presenter2.viewController2 = viewController2
    }
}

extension StudentsExamResultsVC {
    
    func successFetchedItems(viewModel: ExamResultsModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedExamResultsData = viewModel.displayedExamResultsData
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: ExamResultsModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"An error occured", complition: {
        })
    }
}

extension StudentsExamResultsVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedExamResultsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExamsCell
        
        let data = displayedExamResultsData[indexPath.row]
        
        cell.title.text = data.exam_name
        cell.date.text = "\(data.Fromdate!) - \(data.Todate!) "
        cell.status.text = data.MarkStatus
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = displayedExamResultsData[indexPath.row]
        self.selectedExamId = data.exam_id!
//
        self.performSegue(withIdentifier: "to_studentExamDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "to_studentExamDetails")
        {
        let vc = segue.destination as! ExamTimeTableVC
            vc.selectedExamId = self.selectedExamId
            vc.selectedClassId = GlobalVariables.shared.class_id
        }
    }
}
