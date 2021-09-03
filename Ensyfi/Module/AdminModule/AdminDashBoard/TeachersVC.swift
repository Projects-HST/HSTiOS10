//
//  TeachersVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/08/21.
//

import UIKit

protocol TeachersListDisplayLogic: class
{
    func successFetchedItems(viewModel: TeachersListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: TeachersListModel.Fetch.ViewModel)
}

class TeachersVC: UIViewController,TeachersListDisplayLogic {
   
    @IBOutlet weak var tableView: UITableView!
    
    var interactor: TeachersListBusinessLogic?
    var displayedTeachersListData: [TeachersListModel.Fetch.ViewModel.DisplayedTeachersListData] = []
    var serialNoArr = [Int]()
    var selectedStaffId = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: TeachersListModel.Fetch.Request(user_id :""))
        print("1234")
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
        let interactor = TeachersListInteractor()
        let presenter = TeachersListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}
    
extension TeachersVC {
    
    func successFetchedItems(viewModel: TeachersListModel.Fetch.ViewModel) {
        
        displayedTeachersListData = viewModel.displayedTeachersListData
        for i in 1...10000 {
            self.serialNoArr.append(i)
        }
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: TeachersListModel.Fetch.ViewModel) {
        
    }
}
extension TeachersVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedTeachersListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TeacherListCell
        
        let data = displayedTeachersListData[indexPath.row]
        
        cell.SerialNo.text = String(serialNoArr[indexPath.row])
        cell.sub.text = data.subject
        cell.name.text = data.name
        cell.selectionStyle = .none
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = displayedTeachersListData[indexPath.row]
        self.selectedStaffId = data.teacher_id!
        
        self.performSegue(withIdentifier: "to_TeacherDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "to_TeacherDetails")
        {
        let vc = segue.destination as! TeacherDetailsVC
            vc.teacher_ID = self.selectedStaffId
           
        }
    }
}
