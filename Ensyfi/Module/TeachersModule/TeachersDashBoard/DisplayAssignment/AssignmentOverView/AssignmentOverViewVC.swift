//
//  AssignmentOverViewVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 12/10/21.
//

import UIKit
import MBProgressHUD

protocol AssignmentOverViewDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: AssignmentOverViewModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: AssignmentOverViewModel.Fetch.ViewModel)
}

class AssignmentOverViewVC: UIViewController, AssignmentOverViewDisplayLogic,UIPopoverPresentationControllerDelegate, ClassSectionListDelegate {
    
  
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sendAttendanceOutlet: UIBarButtonItem!
    
    var interactor: AssignmentOverViewBusinessLogic?
    var displayedAssignmentOverViewData: [AssignmentOverViewModel.Fetch.ViewModel.DisplayedAssignmentOverViewData] = []
    var class_id = String()
    var hw_date = String()
    var SelTitle = String()
    var selSubject = String()
    var selTeacherName = String()
    var selType = String()
    var selDescription = String()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: AssignmentOverViewModel.Fetch.Request(class_id :"1",hw_date:self.hw_date,dynamic_db: GlobalVariables.shared.dynamic_db))
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
        let interactor = AssignmentOverViewInteractor()
        let presenter = AssignmentOverViewPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    @IBAction func sendAttendanceAction(_ sender: Any) {
        
        self.popOverButtonClick(sender: self.sendAttendanceOutlet)
    }

    func saveText(strText: String, strTextCName: String) {
        
    }
    
    
    func popOverButtonClick (sender: UIBarButtonItem)
    {
        let savingsInformationViewController = storyboard?.instantiateViewController(withIdentifier: "sendAttendanceVC") as! SendAttendanceVC
            savingsInformationViewController.delegate = self
            savingsInformationViewController.strSaveText = self.selType as NSString
            savingsInformationViewController.modalPresentationStyle = .automatic
        if let popoverController = savingsInformationViewController.popoverPresentationController {
            popoverController.sourceView = self.view
                popoverController.sourceRect = view.frame
            popoverController.permittedArrowDirections = .right
                popoverController.delegate = self
            }
        present(savingsInformationViewController, animated: true, completion: nil)
     }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController!) -> UIModalPresentationStyle {
      return .none
    }

    private func presentationController(controller: UIPresentationController!, viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController! {
        return UINavigationController(rootViewController: controller.presentedViewController)
    }
}

extension AssignmentOverViewVC {
    
    func successFetchedItems(viewModel: AssignmentOverViewModel.Fetch.ViewModel) {
        displayedAssignmentOverViewData = viewModel.displayedAssignmentOverViewData
        MBProgressHUD.hide(for: self.view, animated: true)
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: AssignmentOverViewModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
}

extension AssignmentOverViewVC :UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedAssignmentOverViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AssignmentOverViewCell
            
        let data = displayedAssignmentOverViewData[indexPath.row]
        cell.name.text = "Teacher Name \(data.name!)"
        cell.subject.text = "Subject \(data.subject_name!)"
        cell.type.text = "Type \(data.hw_type!)"
        cell.selectionStyle = .none
        
        if data.send_option_status == "0" {
            cell.sentImg.alpha = 0
            cell.sentStatus.text = ""
        }
        else{
            cell.sentImg.alpha = 1
            cell.sentStatus.text = "Sent"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = displayedAssignmentOverViewData[indexPath.row]
        self.selSubject = data.subject_name!
        self.SelTitle = data.title!
        self.selTeacherName = data.name!
        self.selType = data.hw_type!
        self.selDescription = data.hw_details!
        
        self.performSegue(withIdentifier: "to_workDeatil", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "to_workDeatil")
        {
        let vc = segue.destination as! AssignmentDetailVC
            
            vc.selSubject = self.selSubject
            vc.SelTitle = self.SelTitle
            vc.selTeacherName = self.selTeacherName
            vc.selType = self.selType
            vc.selDescription = self.selDescription
        }
    }
}
