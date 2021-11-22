//
//  StudentDetailsFeesListVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 19/11/21.
//

import UIKit
import MBProgressHUD

class StudentDetailsFeesListVC: UIViewController, FeesListDisplayLogic {
    
    @IBOutlet weak var tableView: UITableView!
    
    var interactor2: FeesListBusinessLogic?
    var displayedFeesListData: [FeesListModel.Fetch.ViewModel.DisplayedFeesListData] = []
    
    var selectedClassId = String()
    var selectedSecId = String()
    var selectedFeesId = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor2?.fetchItems(request: FeesListModel.Fetch.Request(class_id:self.selectedClassId , section_id: self.selectedSecId,dynamic_db: GlobalVariables.shared.dynamic_db))
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
        let interactor2 = FeesListInteractor()
        let presenter2 = FeesListPresenter()
        viewController2.interactor2 = interactor2
        interactor2.presenter2 = presenter2
        presenter2.viewController2 = viewController2
    }
}

extension StudentDetailsFeesListVC {
    
    func successFetchedItems(viewModel: FeesListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedFeesListData = viewModel.displayedFeesListData
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: FeesListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"An error occured", complition: {
        })
    }
}

extension StudentDetailsFeesListVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedFeesListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeesListCell
        
        let data = displayedFeesListData[indexPath.row]
        
        cell.title.text = data.term_name
        cell.date.text = "\(data.due_date_from!) - \(data.due_date_to!) "
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = displayedFeesListData[indexPath.row]
        self.selectedFeesId = data.fees_id!
        
        self.performSegue(withIdentifier: "to_feesStatusListVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "to_feesStatusListVC")
        {
        let vc = segue.destination as! FeesStatusListVC
            
            vc.selectedClassId = self.selectedClassId
            vc.selectedSecId = self.selectedSecId
            vc.selectedFeesId = self.selectedFeesId
        }
    }
}
