//
//  TeacherLeaveRequestVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/10/21.
//

import UIKit
import MBProgressHUD
import DropDown

protocol TeacherLeavesRequestDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: TeacherLeavesRequestModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: TeacherLeavesRequestModel.Fetch.ViewModel)
}

protocol ApplyLeaveRequestDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel:ApplyLeaveRequestModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: ApplyLeaveRequestModel.Fetch.ViewModel)
}

class TeacherLeaveRequestVC: UIViewController, TeacherLeavesRequestDisplayLogic, ApplyLeaveRequestDisplayLogic {
   
    @IBOutlet weak var leaveTypeField: UITextField!
    @IBOutlet weak var fromDateField: UITextField!
    @IBOutlet weak var toDateField: UITextField!
    @IBOutlet weak var fromTime: UITextField!
    @IBOutlet weak var toTime: UITextField!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var desTextField: UITextField!
    
    var interactor: TeacherLeavesRequestBusinessLogic?
    var interactor1: ApplyLeaveRequestBusinessLogic?
    
    var displayedTeacherLeavesRequestData: [TeacherLeavesRequestModel.Fetch.ViewModel.DisplayedTeacherLeavesRequestData] = []
    let dropDown = DropDown()
    let date = Date()
    let formatter = DateFormatter()
    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()
    
    var fromDateFormatted = String()
    var toDateFormatted = String()
    var fromTimeFormated = String()
    var toTimeFormated = String()
    var selectedFromDate = Date()
    var selectedToDate = Date()
    
    var leaveTitleArr = [String]()
    var leaveTypeAr = [String]()
    var leaveIDAr = [String]()
    var selectedleaveID = String()
    var selectedleave_type = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: TeacherLeavesRequestModel.Fetch.Request(user_id :GlobalVariables.shared.user_id,dynamic_db: GlobalVariables.shared.dynamic_db))
        self.SetDate()
        self.showDatePicker()
        self.hideKeyboardWhenTappedAround()
        self.openTimePicker()
        MBProgressHUD.showAdded(to: self.view, animated: true)
        self.timePicker.datePickerMode = .time
        self.fromTime.isEnabled = false
        self.toTime.isEnabled = false
        self.bgView.dropShadow()
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
        let interactor = TeacherLeavesRequestInteractor()
        let presenter = TeacherLeavesRequestPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        let viewController1 = self
        let interactor1 = ApplyLeaveRequestInteractor()
        let presenter1 = ApplyLeaveRequestPresenter()
        viewController1.interactor1 = interactor1
        interactor1.presenter1 = presenter1
        presenter1.viewController1 = viewController1
    }
    
    func SetDate() {
        
        self.formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        self.fromDateField.text = result
        self.toDateField.text = result
    }
    
    @IBAction func selectType(_ sender: Any) {
        
        self.fromTime.text = ""
        self.toTime.text = ""
        dropDown.show()
        dropDown.anchorView = leaveTypeField
        dropDown.dataSource = leaveTitleArr
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            leaveTypeField.text = item
            let slecteId = leaveIDAr[index]
            let slecteType = leaveTypeAr[index]
            self.selectedleaveID = slecteId
            self.selectedleave_type = slecteId
            
            if index == 0 || index == 3 || index == 3 {
                self.fromTime.isEnabled = false
                self.toTime.isEnabled = false
                self.fromTime.alpha = 0.5
                self.toTime.alpha = 0.5
            }
            else {
                self.fromTime.isEnabled = true
                self.toTime.isEnabled = true
                self.fromTime.alpha = 1
                self.toTime.alpha = 1
            }
        }
    }
    
    @IBAction func requestAction(_ sender: Any) {
        
        guard CheckValuesAreEmpty () else {
                   return
        }
        interactor1?.fetchItems(request: ApplyLeaveRequestModel.Fetch.Request(user_type:GlobalVariables.shared.user_type , user_id: GlobalVariables.shared.user_id, leave_master_id: self.selectedleaveID, leave_type: self.selectedleave_type, date_from: self.fromDateField.text!, date_to:self.toDateField.text!, fromTime: self.fromTime.text!, toTime:self.toTime.text!, description: self.desTextField.text!,dynamic_db: GlobalVariables.shared.dynamic_db))
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func showDatePicker() {
       //Formate Date
       datePicker.datePickerMode = .date
       datePicker.backgroundColor = UIColor.white
       datePicker.setValue(UIColor.black, forKeyPath: "textColor")
       datePicker.preferredDatePickerStyle = UIDatePickerStyle.wheels
     
       //ToolBar
       let toolbar = UIToolbar();
       toolbar.sizeToFit()
       toolbar.backgroundColor = UIColor.white
       toolbar.tintColor = UIColor(red: 45/255.0, green: 148/255.0, blue: 235/255.0, alpha: 1.0)
       let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
       let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
       let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
       toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)

        fromDateField.inputAccessoryView = toolbar
        fromDateField.inputView = datePicker
        toDateField.inputAccessoryView = toolbar
        toDateField.inputView = datePicker
        fromTime.inputAccessoryView = toolbar
        fromTime.inputView = datePicker
    }
    
    func formattedDateFromString(dateString: String, withFormat format: String) -> String? {

        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"

        if let date = inputFormatter.date(from: dateString) {

            let outputFormatter = DateFormatter()
          outputFormatter.dateFormat = format

            return outputFormatter.string(from: date)
        }
        return nil
    }
    
     @objc func donedatePicker(){
        if fromDateField.isFirstResponder
        {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            fromDateFormatted = formatter.string(from: datePicker.date)
            selectedFromDate = datePicker.date
            let formatted = self.formattedDateFromString(dateString: fromDateFormatted, withFormat: "dd-MM-YYYY")
            fromDateField.text = formatted
            self.view.endEditing(true)
        }
         else if toDateField.isFirstResponder
        {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            toDateFormatted = formatter.string(from: datePicker.date)
            selectedToDate = datePicker.date
            let formatted = self.formattedDateFromString(dateString: toDateFormatted, withFormat: "dd-MM-YYYY")
            toDateField.text = formatted
            self.view.endEditing(true)
        }
    }
    
    func openTimePicker()  {
        
        timePicker.datePickerMode = .time
        timePicker.backgroundColor = UIColor.white
        timePicker.setValue(UIColor.black, forKeyPath: "textColor")
        timePicker.preferredDatePickerStyle = UIDatePickerStyle.wheels
        
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        toolbar.backgroundColor = UIColor.white
        toolbar.tintColor = UIColor(red: 45/255.0, green: 148/255.0, blue: 235/255.0, alpha: 1.0)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTimePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTimePicker));
        toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)

        fromTime.inputAccessoryView = toolbar
        fromTime.inputView = timePicker
    }
    
    @objc func doneTimePicker(){
       if fromTime.isFirstResponder
       {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm aa"
        fromTimeFormated = formatter.string(from: timePicker.date)
        let convertedDate = convertDate(date:fromTimeFormated, dateFormat:"HH:mm aa", convertFormat: "HH:mm aa")
        fromTime.text = convertedDate
        self.view.endEditing(true)
       }
        else if toTime.isFirstResponder
        {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm aa"
        toTimeFormated = formatter.string(from: timePicker.date)
        let convertedDate = convertDate(date:toTimeFormated, dateFormat:"HH:mm aa", convertFormat: "HH:mm aa")
        toTime.text = convertedDate
        self.view.endEditing(true)
        }
    }

   func convertDate(date: String, dateFormat : String, convertFormat : String) -> String {
        let datetimeFormatOriginal = DateFormatter()
        datetimeFormatOriginal.dateFormat = dateFormat

        let convertedFormat = DateFormatter()
        convertedFormat.dateFormat = convertFormat

        if date == "" || date == "-" {
            return "-"
        }
        else {
            return convertedFormat.string(from: datetimeFormatOriginal.date(from: date)!)
        }
    }
        
    @objc func cancelDatePicker(){
       self.view.endEditing(true)
     }
    
    @objc func cancelTimePicker(){
       self.view.endEditing(true)
     }
    
    func CheckValuesAreEmpty () -> Bool{
        
        guard self.fromDateField.text?.count != 0  else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"From date is empty", complition: {
                
              })
             return false
         }
        guard self.toDateField.text?.count != 0  else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: "To date is Empty", complition: {
                
              })
             return false
         }
        guard self.desTextField.text?.count != 0  else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: Globals.LoginAlertMessage, complition: {
                
              })
             return false
         }
          return true
    }
}

extension TeacherLeaveRequestVC {
    
    func successFetchedItems(viewModel: TeacherLeavesRequestModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedTeacherLeavesRequestData = viewModel.displayedTeacherLeavesRequestData
        for data in displayedTeacherLeavesRequestData {
            
            let leaveTitle = data.leave_title
            let leaveTitID = data.id
            let leaveType = data.leave_type
            
            self.leaveTitleArr.append(leaveTitle!)
            self.leaveTypeAr.append(leaveType!)
            self.leaveIDAr.append(leaveTitID!)
        }
    }
    
    func errorFetchingItems(viewModel: TeacherLeavesRequestModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
    
    func successFetchedItems(viewModel: ApplyLeaveRequestModel.Fetch.ViewModel) {
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: viewModel.msg!, complition: {
            self.navigationController?.popViewController(animated: true)
        })
    }
    
    func errorFetchingItems(viewModel: ApplyLeaveRequestModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
}
