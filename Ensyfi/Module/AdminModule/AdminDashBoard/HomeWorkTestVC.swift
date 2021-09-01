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
    @IBOutlet weak var TestTextField: UITextField!
    
    var interactor: HomeWorkTestListBusinessLogic?
    let dropDown = DropDown()
    var dropDownData = [String]()
    var stsudentId = String()
    var selectedClassId = String()
    
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
        
    }
    
    func errorFetchingItems(viewModel: HomeWorkTestListModel.Fetch.ViewModel) {
        
    }
}

extension HomeWorkTestVC : UITableViewDelegate,UITableViewDataSource {
    
    
}
