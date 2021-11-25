//
//  StudentsAtendanceViewControler.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 22/10/21.
//

import UIKit
import FSCalendar
import MBProgressHUD
import SideMenu

class StudentsAtendanceViewControler: UIViewController, StudentAttendanceDisplayLogic,SideMenuNavigationControllerDelegate,FSCalendarDelegate,FSCalendarDataSource,FSCalendarDelegateAppearance {

    @IBOutlet weak var workingDays: UILabel!
    @IBOutlet weak var daysPresent: UILabel!
    @IBOutlet weak var onDuty: UILabel!
    @IBOutlet weak var leaves: UILabel!
    @IBOutlet weak var daysAbsent: UILabel!
    @IBOutlet weak var calendar: FSCalendar!
    
    var stsudentId = String()
    var selectedClassId = String()
    var displayedStudentAttendanceData: [StudentAttendanceModel.Fetch.ViewModel.DisplayedStudentAttendanceData] = []
    var interactor: StudentAttendanceBusinessLogic?
    
    var presentDays = [String]()
    var absentDays = [String]()
    var leaveDays = [String]()
    
    fileprivate lazy var dateFormatter1: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: StudentAttendanceModel.Fetch.Request(class_id :GlobalVariables.shared.class_id,stud_id :GlobalVariables.shared.registered_id,dynamic_db: GlobalVariables.shared.dynamic_db))
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func sideMenuWillAppear(menu: SideMenuNavigationController, animated: Bool) {
        view.alpha = 0.8
    }
    
    func sideMenuWillDisappear(menu: SideMenuNavigationController, animated: Bool) {
           view.alpha = 1
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
        let interactor = StudentAttendanceInteractor()
        let presenter = StudentAttendancePresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}

extension StudentsAtendanceViewControler {
    
    func successFetchedItems(viewModel: StudentAttendanceModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        self.workingDays.text = "  \(GlobalVariables.shared.total_working_days) Days"
        self.daysPresent.text = "  \(GlobalVariables.shared.present_days) Days"
        self.onDuty.text = "  \(GlobalVariables.shared.od_days) Days"
        self.leaves.text = "  \(GlobalVariables.shared.leave_days) Days"
        self.daysAbsent.text = "  \(GlobalVariables.shared.absent_days) Days"
    }
    
    func errorFetchingItems(viewModel: StudentAttendanceModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillSelectionColorFor date: Date) -> UIColor? {

        presentDays = ["2021-11-03",
                            "2021-11-10",
                            "2021-11-21",
                            "2021-11-06"]

        absentDays = ["2021-11-01",
                      "2021-11-11",
                      "2021-11-29",
                      "2021-11-16"]

        let datestring2 : String = dateFormatter1.string(from:date)

          if presentDays.contains(datestring2)
      {
        return UIColor.green
      }
//       else if absentDays.contains(datestring2)
//       {
//          return UIColor.red
//       }
        return appearance.selectionColor
    }
}
