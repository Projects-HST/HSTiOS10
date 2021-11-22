//
//  TeacherExamDutyVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 19/11/21.
//

import UIKit
import MBProgressHUD

protocol ExamDutyListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: ExamDutyListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: ExamDutyListModel.Fetch.ViewModel)
}

class TeacherExamDutyVC: UIViewController, ExamDutyListDisplayLogic {
   
    @IBOutlet weak var tableView: UITableView!
    
    var interactor: ExamDutyListBusinessLogic?
    var displayedExamDutyListData: [ExamDutyListModel.Fetch.ViewModel.DisplayedExamDutyListData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: ExamDutyListModel.Fetch.Request(teacher_id :GlobalVariables.shared.user_id,dynamic_db: GlobalVariables.shared.dynamic_db))
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
        let interactor = ExamDutyListInteractor()
        let presenter = ExamDutyListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}

extension TeacherExamDutyVC {
    
    func successFetchedItems(viewModel: ExamDutyListModel.Fetch.ViewModel) {
        displayedExamDutyListData = viewModel.displayedExamDutyListData
        MBProgressHUD.hide(for: self.view, animated: true)
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: ExamDutyListModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
}

extension TeacherExamDutyVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedExamDutyListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TeacherExamDutysCell
            
        let data = displayedExamDutyListData[indexPath.row]
        cell.titleLbl.text = data.exam_name
        cell.secName.text = data.class_section
        cell.dateLbl.text = data.exam_datetime
        cell.selectionStyle = .none
        return cell
    }
}
