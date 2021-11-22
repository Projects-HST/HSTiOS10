//
//  TecahersAddOndutyVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 18/11/21.
//

import UIKit
import MBProgressHUD

protocol AddONDutyDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel:AddONDutyModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel:AddONDutyModel.Fetch.ViewModel)
}

class TecahersAddOndutyVC: UIViewController, AddONDutyDisplayLogic {
   
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var reasonField: UITextField!
    @IBOutlet weak var fromDateField: UITextField!
    @IBOutlet weak var toDateField: UITextField!
    @IBOutlet weak var detailsField: UITextField!
    
    var interactor: AddONDutyBusinessLogic?
    
    let date = Date()
    let datePicker = UIDatePicker()
    var todayDate = String()
    var dateFormatted = String()
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.bgView.dropShadow()
        self.showDatePicker()
        self.setDate()
        self.hideKeyboardWhenTappedAround()
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
        let interactor = AddONDutyInteractor()
        let presenter = AddONDutyPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    @IBAction func applyAction(_ sender: Any) {
        
        guard CheckValuesAreEmpty () else {
                   return
        }
        interactor?.fetchItems(request: AddONDutyModel.Fetch.Request(user_id: GlobalVariables.shared.user_id, dynamic_db: GlobalVariables.shared.dynamic_db, user_type: GlobalVariables.shared.user_type, od_for: self.reasonField.text!, from_date: self.fromDateField.text!, to_date: self.toDateField.text!, created_at:self.todayDate, created_by:GlobalVariables.shared.user_id , status: "Pending", notes:self.detailsField.text!))
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
            dateFormatted = formatter.string(from: datePicker.date)
//            dateFormatted = datePicker.date
            let formatted = self.formattedDateFromString(dateString: dateFormatted, withFormat: "yyyy-MM-dd")
            fromDateField.text = formatted
            self.view.endEditing(true)
        }
         else if toDateField.isFirstResponder {
             let formatter = DateFormatter()
             formatter.dateFormat = "yyyy-MM-dd"
             dateFormatted = formatter.string(from: datePicker.date)
 //            dateFormatted = datePicker.date
             let formatted = self.formattedDateFromString(dateString: dateFormatted, withFormat: "yyyy-MM-dd")
             toDateField.text = formatted
             self.view.endEditing(true)
         }
    }
        
    @objc func cancelDatePicker() {
       self.view.endEditing(true)
     }
    
    func setDate() {
        formatter.dateFormat = "yyyy-MM-dd"
        let result = formatter.string(from: date)
        self.todayDate = result
        self.fromDateField.text = todayDate
        self.toDateField.text = todayDate
    }
    
    func CheckValuesAreEmpty () -> Bool{
    
        
        guard Reachability.isConnectedToNetwork() == true else {
              AlertController.shared.offlineAlert(targetVc: self, complition: {
                //Custom action code
             })
             return false
        }
        
        guard self.reasonField.text?.count != 0  else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: "Enter Reason", complition: {
                
              })
             return false
         }
        guard self.fromDateField.text?.count != 0  else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: "Select From date", complition: {
                
              })
             return false
         }
        guard self.toDateField.text?.count != 0  else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: "Select To date", complition: {
                
              })
             return false
         }
        guard self.detailsField.text?.count != 0  else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Enter Details", complition: {
                
              })
             return false
         }
          return true
    }
}

extension TecahersAddOndutyVC {
    
    func successFetchedItems(viewModel: AddONDutyModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:viewModel.msg!, complition: {
            self.navigationController?.popViewController(animated: true)
        })
    }
    
    func errorFetchingItems(viewModel: AddONDutyModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"An Error Occured", complition: {
        })
    }
}
