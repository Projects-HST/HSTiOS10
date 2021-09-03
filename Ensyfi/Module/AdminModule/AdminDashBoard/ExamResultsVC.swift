//
//  ExamResultsVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 02/09/21.
//

import UIKit

protocol ExamResultsDisplayLogic: class
{
    func successFetchedItems(viewModel: ExamResultsModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: ExamResultsModel.Fetch.ViewModel)
}

class ExamResultsVC: UIViewController, ExamResultsDisplayLogic {
 
    @IBOutlet weak var tableView: UITableView!
    
    var displayedExamResultsData: [ExamResultsModel.Fetch.ViewModel.DisplayedExamResultsData] = []
    var interactor: ExamResultsBusinessLogic?
    var selectedClassId = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: ExamResultsModel.Fetch.Request(class_id:self.selectedClassId))
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
        let interactor = ExamResultsInteractor()
        let presenter = ExamResultsPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}

extension ExamResultsVC {
    
    func successFetchedItems(viewModel: ExamResultsModel.Fetch.ViewModel) {
        
        displayedExamResultsData = viewModel.displayedExamResultsData
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: ExamResultsModel.Fetch.ViewModel) {
        
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"An error occured", complition: {
        })
    }
}

extension ExamResultsVC : UITableViewDelegate,UITableViewDataSource {
    
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
}
