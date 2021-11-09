//
//  TeacherSubstitutionVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/10/21.
//

import UIKit
import MBProgressHUD

protocol TeacherSubstutionListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel:TeacherSubstutionListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: TeacherSubstutionListModel.Fetch.ViewModel)
}

class TeacherSubstitutionVC: UIViewController, TeacherSubstutionListDisplayLogic {
    
    @IBOutlet weak var tableView: UITableView!
    
    var interactor: TeacherSubstutionListBusinessLogic?
    var displayedTeacherSubstutionListtData: [TeacherSubstutionListModel.Fetch.ViewModel.DisplayedTeacherSubstutionListData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: TeacherSubstutionListModel.Fetch.Request(user_id :GlobalVariables.shared.user_id))
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
        let interactor = TeacherSubstutionListInteractor()
        let presenter = TeacherSubstutionListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}

extension TeacherSubstitutionVC {
    
    func successFetchedItems(viewModel: TeacherSubstutionListModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedTeacherSubstutionListtData = viewModel.displayedTeacherSubstutionListData
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: TeacherSubstutionListModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
}

extension TeacherSubstitutionVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedTeacherSubstutionListtData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TeacherSubstitutionCell
            
        let data = displayedTeacherSubstutionListtData[indexPath.row]
        cell.secName.text = data.class_sec_name
        cell.dateLbl.text = data.sub_date
        cell.periodNum.text = data.period
        
        return cell
    }
}
