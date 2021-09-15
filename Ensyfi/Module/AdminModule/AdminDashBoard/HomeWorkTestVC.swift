//
//  HomeWorkTestVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 01/09/21.
//

import UIKit
import DropDown

protocol HomeWorkTestListDisplayLogic: class
{
    func successFetchedItems(viewModel: HomeWorkTestListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: HomeWorkTestListModel.Fetch.ViewModel)
}

class HomeWorkTestVC: UIViewController,HomeWorkTestListDisplayLogic {
 
    @IBOutlet weak var selectBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var TestTextField: UITextField!
    
    var displayedHomeWorkTestListData: [HomeWorkTestListModel.Fetch.ViewModel.DisplayedHomeWorkTestListData] = []
    var interactor: HomeWorkTestListBusinessLogic?
    let dropDown = DropDown()
    var dropDownData = [String]()
    var stsudentId = String()
    var selectedClassId = String()
    var selectedStudentId = String()
    var selectedHomeWorkId = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.dropDownData = ["Class Test","Home Work"]
        self.TestTextField.text = "Class Test"
        interactor?.fetchItems(request: HomeWorkTestListModel.Fetch.Request(class_id :self.selectedClassId,hw_type: "HT"))
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
        let interactor = HomeWorkTestListInteractor()
        let presenter = HomeWorkTestListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    @IBAction func selectAction(_ sender: Any) {
        
        dropDown.show()
        dropDown.anchorView = TestTextField
        dropDown.dataSource = dropDownData
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            TestTextField.text = item
            
            if dropDown.indexForSelectedRow == 0 {
                
                interactor?.fetchItems(request: HomeWorkTestListModel.Fetch.Request(class_id :self.selectedClassId,hw_type: "HT"))
            }
            
            else if dropDown.indexForSelectedRow == 1 {
                
                interactor?.fetchItems(request: HomeWorkTestListModel.Fetch.Request(class_id :self.selectedClassId,hw_type: "HW"))
            }
        }
    }
}

extension HomeWorkTestVC {
    
    func successFetchedItems(viewModel: HomeWorkTestListModel.Fetch.ViewModel) {
        
        displayedHomeWorkTestListData = viewModel.displayedHomeWorkTestListData
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: HomeWorkTestListModel.Fetch.ViewModel) {
        
    }
}

extension HomeWorkTestVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedHomeWorkTestListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeWorkListCell
        
        let data = displayedHomeWorkTestListData[indexPath.row]
        
        cell.title.text = data.title
        cell.date.text = " Due Date : \(data.test_date!)"
        
        if data.hw_type == "HT" {
            cell.subName.text = "\(data.subject_name!) - CLASS TEST"
        }
        else {
            cell.subName.text = "\(data.subject_name!) - HOME WORK"
        }
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = displayedHomeWorkTestListData[indexPath.row]
        self.selectedHomeWorkId = data.hw_id!
        
        self.performSegue(withIdentifier: "student_detail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "student_detail")
        {
//        let vc = segue.destination as! StudentsDetailsVC
//            vc.studentEnroolId = self.selectedStudentId
//            vc.selectedClassId = self.selectedClassId
            
        }
    }
}
