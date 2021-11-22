//
//  TeacherAttendanceVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 04/10/21.
//

import UIKit
import DropDown
import CoreData
import MBProgressHUD

protocol DayMonthAttendanceListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: DayMonthAttendanceListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: DayMonthAttendanceListModel.Fetch.ViewModel)
}

protocol MonthAttendanceListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: MonthAttendanceListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: MonthAttendanceListModel.Fetch.ViewModel)
}

class TeacherAttendanceVC: UIViewController,UITextFieldDelegate, DayMonthAttendanceListDisplayLogic, MonthAttendanceListDisplayLogic {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var classTextfield: UITextField!
    @IBOutlet weak var classBtnOutlet: UIButton!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var date_month: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    var interactor: DayMonthAttendanceListBusinessLogic?
    var displayedDayMonthAttendanceListData: [DayMonthAttendanceListModel.Fetch.ViewModel.DisplayedDayMonthAttendanceListData] = []
    
    var interactor1: MonthAttendanceListBusinessLogic?
    var displayedMonthAttendanceListData: [MonthAttendanceListModel.Fetch.ViewModel.DisplayedMonthAttendanceListData] = []
    
    var serialNoArr = [Int]()
    let datePicker = UIDatePicker()
    var dateFormatted = String()
    var className = [String]()
    var classId = [String]()
    var secName = [String]()
    var secId = [String]()
    var zipedArr = [String]()
    var academicMonthArr = [String]()
    var selectedClassId = String()
    var selectedType = String()
    var selectedSecId = String()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context : NSManagedObjectContext?
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        context = appDelegate.persistentContainer.viewContext
        self.fetchData()
//        self.classBtnOutlet.isEnabled = false
        self.fetchMonthData()
        self.showDatePicker()
        self.bgView.dropShadow()
        self.selectedType = "Dview"
        self.tableView.dropShadow()
        for i in 1...10000 {
            self.serialNoArr.append(i)
        }
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
        let interactor = DayMonthAttendanceListInteractor()
        let presenter = DayMonthAttendanceListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        let viewController1 = self
        let interactor1 = MonthAttendanceListInteractor()
        let presenter1 = MonthAttendanceListPresenter()
        viewController1.interactor1 = interactor1
        interactor1.presenter1 = presenter1
        presenter1.viewController1 = viewController1
    }
    
    @IBAction func selectClass(_ sender: Any) {
        
        dropDown.show()
        dropDown.anchorView = classTextfield
        dropDown.dataSource = zipedArr
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            classTextfield.text = item
            let slecteId = classId[index]
            self.selectedClassId = String(slecteId)
            print(selectedClassId)
        }
    }
    
    @IBAction func selectDataMonth(_ sender: Any) {
        
        if self.selectedType == "Dview"{
            
        }
        else {
            dropDown.show()
            dropDown.anchorView = date_month
            dropDown.dataSource = academicMonthArr
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.date_month.text = item
                interactor1?.fetchItems(request:MonthAttendanceListModel.Fetch.Request(class_id :self.selectedClassId,dynamic_db: GlobalVariables.shared.dynamic_db,disp_type:"month", disp_date:"",month_year:self.date_month.text!))
            MBProgressHUD.showAdded(to: self.view, animated: true)
            }
        }
    }
    
    @IBAction func segmentAction(_ sender: Any) {
        
        if segmentedControl.selectedSegmentIndex == 0 {
            
            self.selectedType = "Dview"
            self.img2.image = UIImage(named:"unselected1")
            self.img1.image = UIImage(named:"selected")
            self.date_month.text = "Select Date"
            self.date_month.isEnabled = true
        }
        else if segmentedControl.selectedSegmentIndex == 1 {
            self.selectedType = "Mview"
            self.img2.image = UIImage(named:"selected")
            self.img1.image = UIImage(named:"unselected1")
            self.date_month.text = "Select Month"
            self.date_month.isEnabled = false
        }
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
        date_month.inputAccessoryView = toolbar
        date_month.inputView = datePicker
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
        if date_month.isFirstResponder
        {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            dateFormatted = formatter.string(from: datePicker.date)
//            dateFormatted = datePicker.date
            let formatted = self.formattedDateFromString(dateString: dateFormatted, withFormat: "yyyy-MM-dd")
            date_month.text = formatted
            self.view.endEditing(true)
            interactor?.fetchItems(request: DayMonthAttendanceListModel.Fetch.Request(class_id :self.selectedClassId,dynamic_db: GlobalVariables.shared.dynamic_db,disp_type:"day", disp_date:self.date_month.text!,month_year:""))
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
    }
        
    @objc func cancelDatePicker() {
       self.view.endEditing(true)
     }
    
    func fetchData() {
    
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ClassSubjects")
    
        do {
            let results = try context.fetch(fetchRequest)
            let  classSubData = results as! [ClassSubjects]
    
            for data in classSubData {
                className = data.class_name as! [String]
                secName = data.sec_name as! [String]
                classId = data.class_master_id as! [String]
                print(className)
                let ziped = zip(className, secName)
                let result = ziped.map { $0.0 + " " + $0.1 }
                zipedArr = result
            }
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }

    func fetchMonthData(){
    
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AcademicMonths")
    
        do {
            let results = try context.fetch(fetchRequest)
            let  classSubData = results as! [AcademicMonths]
    
            for data in classSubData {
                academicMonthArr = data.academic_month as! [String]
                print(academicMonthArr)
            }
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
}

extension TeacherAttendanceVC {
    
    func successFetchedItems(viewModel: DayMonthAttendanceListModel.Fetch.ViewModel) {
        displayedDayMonthAttendanceListData = viewModel.displayedDayMonthAttendanceListData
        MBProgressHUD.hide(for: self.view, animated: true)
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: DayMonthAttendanceListModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func successFetchedItems(viewModel: MonthAttendanceListModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedMonthAttendanceListData = viewModel.displayedMonthAttendanceListData
        self.tableView.reloadData()

    }
    
    func errorFetchingItems(viewModel: MonthAttendanceListModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}

extension TeacherAttendanceVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.selectedType == "Dview" {
            return displayedDayMonthAttendanceListData.count
        }
        else {
            return displayedMonthAttendanceListData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AttendanceMonthDateListCell
            
        if self.selectedType == "Dview" {
            
          let data = displayedDayMonthAttendanceListData[indexPath.row]
            cell.serialNo.text = String(serialNoArr[indexPath.row])
            cell.name.text = data.name
            cell.statusLbl.textColor = UIColor.white
            
           if data.a_status == "P"{
              cell.statusLbl.text = "Present"
              cell.statusView.backgroundColor = UIColor.systemGreen
           }
           else if data.a_status == "OD"{
              cell.statusLbl.text = "OD"
              cell.statusView.backgroundColor = UIColor.systemPurple
           }
           else if data.a_status == "L"{
              cell.statusLbl.text = "Leave"
              cell.statusView.backgroundColor = UIColor.systemOrange
           }
           else if data.a_status == "A"{
              cell.statusLbl.text = "Absent"
              cell.statusView.backgroundColor = UIColor.systemRed
           }
        }
        
        else {
            
          let data = displayedMonthAttendanceListData[indexPath.row]
            cell.serialNo.text = String(serialNoArr[indexPath.row])
            cell.name.text = data.name
        
           if data.leaves != "0"{
               cell.statusLbl.text = "\(data.leaves!) Days Leave"
               cell.statusView.backgroundColor = UIColor.clear
               cell.statusLbl.textColor = UIColor.systemRed
           }
            else {
                cell.statusLbl.text = "No Leave"
                cell.statusView.backgroundColor = UIColor.clear
                cell.statusLbl.textColor = UIColor.systemGreen
            }
        }
        cell.selectionStyle = .none
        return cell
    }
}
