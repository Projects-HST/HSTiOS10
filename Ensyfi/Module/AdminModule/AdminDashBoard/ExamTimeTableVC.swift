//
//  ExamTimeTableVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/09/21.
//

import UIKit
import MBProgressHUD

protocol ExamTimeTableDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: ExamTimeTableModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: ExamTimeTableModel.Fetch.ViewModel)
}

class ExamTimeTableVC: UIViewController, ExamTimeTableDisplayLogic {

    @IBOutlet weak var tableView: UITableView!
    
    var selectedClassId = String()
    var selectedExamId = String()
    var interactor: ExamTimeTableBusinessLogic?
    var displayedExamTimeTableData: [ExamTimeTableModel.Fetch.ViewModel.DisplayedExamTimeTableData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: ExamTimeTableModel.Fetch.Request(class_id:self.selectedClassId, exam_id:self.selectedExamId,dynamic_db: GlobalVariables.shared.dynamic_db))
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
        let interactor = ExamTimeTableInteractor()
        let presenter = ExamTimeTablePresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}

extension ExamTimeTableVC {
    
    func successFetchedItems(viewModel: ExamTimeTableModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedExamTimeTableData = viewModel.displayedExamTimeTableData
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: ExamTimeTableModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
}

extension ExamTimeTableVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedExamTimeTableData.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExamTimeTableCell
        
        let data = displayedExamTimeTableData[indexPath.row]
         
        cell.time.text = data.times
        cell.date.text = data.exam_date
        cell.subject.text = data.subject_name
        cell.selectionStyle = .none
        
        return cell
    }
}
