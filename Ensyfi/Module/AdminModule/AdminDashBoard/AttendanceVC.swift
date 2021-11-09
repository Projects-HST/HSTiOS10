//
//  AttendanceVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 27/09/21.
//

import UIKit
import MBProgressHUD

class AttendanceVC: UIViewController,UIPopoverPresentationControllerDelegate, ClassSectionListDelegate,UITextFieldDelegate {
    
    let datePicker = UIDatePicker()
    var selectedDate = Date()
    var dateFormatted = String()
    var selectedClassID = String()
    
    @IBOutlet weak var dateTextfield: UITextField!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var classTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.classTextfield.delegate = self
        self.showDatePicker()
        self.bgView.dropShadow()
    }
    
    @IBAction func selectClassAction(_ sender: Any) {
        
        self.popOverButtonClick(sender: self.classTextfield)
    }
        
    @IBAction func searchClassAction(_ sender: Any) {
        
        if dateTextfield.text!.count == 0 {
            
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Select Date", complition: {
            })
        }
        
        else if selectedClassID == "" {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Select Class", complition: {
            })
        }
        else {
            self.performSegue(withIdentifier: "to_attendanceList", sender: self)
        }
    }
    
    func saveText(strText: String) {
         self.selectedClassID = strText
        print(selectedClassID)
        self.classTextfield.text = ""
     }
    
    func popOverButtonClick (sender: UITextField)
    {
        let savingsInformationViewController = storyboard?.instantiateViewController(withIdentifier: "classSecList") as! SelectClassSecListVC
            savingsInformationViewController.delegate = self
            savingsInformationViewController.strSaveText = self.selectedClassID as NSString
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
    
    func showDatePicker() {
        
       //Formate Date
       datePicker.datePickerMode = .date
       datePicker.backgroundColor = UIColor.white
        datePicker.preferredDatePickerStyle = UIDatePickerStyle.wheels
//        datePicker.datePickerStyle = .
       datePicker.setValue(UIColor.black, forKeyPath: "textColor")

       //ToolBar
       let toolbar = UIToolbar();
       toolbar.sizeToFit()
       toolbar.backgroundColor = UIColor.white
       toolbar.tintColor = UIColor(red: 45/255.0, green: 148/255.0, blue: 235/255.0, alpha: 1.0)
       let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
       let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
       let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
       toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)

        dateTextfield.inputAccessoryView = toolbar
        dateTextfield.inputView = datePicker
    }
    
    @objc func cancelDatePicker() {
       self.view.endEditing(true)
     }
    
    @objc func donedatePicker() {
       
           let formatter = DateFormatter()
           formatter.dateFormat = "yyyy-MM-dd"
           dateFormatted = formatter.string(from: datePicker.date)
           selectedDate = datePicker.date
           let formatted = self.formattedDateFromString(dateString: dateFormatted, withFormat: "dd-MM-YYYY")
           dateTextfield.text = formatted
           self.view.endEditing(true)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "to_attendanceList")
        {
        let vc = segue.destination as! ClassAttendanceListVC
            
            vc.selectedClassID = self.selectedClassID
            vc.selectedDate = self.dateTextfield.text!
        }
    }
}
