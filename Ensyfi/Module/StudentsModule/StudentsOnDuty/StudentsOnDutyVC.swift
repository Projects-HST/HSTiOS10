//
//  StudentsOnDutyVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 23/10/21.
//

import UIKit
import MBProgressHUD

protocol StudentsONDutyDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: StudentsONDutyModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: StudentsONDutyModel.Fetch.ViewModel)
}

class StudentsOnDutyVC: UIViewController, StudentsONDutyDisplayLogic {

    @IBOutlet weak var tableView: UITableView!
    
    var interactor1: StudentsONDutyBusinessLogic?
    var displayedStudentsONDutyData: [StudentsONDutyModel.Fetch.ViewModel.DisplayedStudentsONDutyData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor1?.fetchItems(request: StudentsONDutyModel.Fetch.Request(user_id:GlobalVariables.shared.user_id,user_type:GlobalVariables.shared.user_type,dynamic_db: GlobalVariables.shared.dynamic_db))
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
        let viewController1 = self
        let interactor1 = StudentsONDutyInteractor()
        let presenter1 = StudentsONDutyPresenter()
        viewController1.interactor1 = interactor1
        interactor1.presenter1 = presenter1
        presenter1.viewController1 = viewController1
    }
}

extension StudentsOnDutyVC {
    
    func successFetchedItems(viewModel: StudentsONDutyModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedStudentsONDutyData = viewModel.displayedStudentsONDutyData
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: StudentsONDutyModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"An error occured", complition: {
        })
    }
}

extension StudentsOnDutyVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedStudentsONDutyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ONDutyListCell
                
        let data = displayedStudentsONDutyData[indexPath.row]
        cell.name.text = "\(data.name!) - \(data.od_for!)"
        cell.date.text = "\(data.from_date!) - \(data.to_date!)"
        cell.status.text = data.status
        
        if data.status == "Approved" {
            cell.status.textColor = UIColor.systemGreen
            cell.sideView.backgroundColor = UIColor.systemGreen
            cell.statusImg.image = UIImage(named:"Completed ")
        }
        else if data.status == "Rejected" {
            cell.status.textColor = UIColor.systemRed
            cell.sideView.backgroundColor = UIColor.systemRed
            cell.statusImg.image = UIImage(named:"rejected")
        }
        else if data.status == "Pending" {
            cell.status.textColor = UIColor.systemYellow
            cell.sideView.backgroundColor = UIColor.systemYellow
            cell.statusImg.image = UIImage(named:"pending")
        }
        cell.selectionStyle = .none
        return cell
    }
}
