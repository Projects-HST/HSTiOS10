//
//  StudentsAttendanceVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 02/09/21.
//

import UIKit
import FSCalendar

protocol StudentAttendanceDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: StudentAttendanceModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: StudentAttendanceModel.Fetch.ViewModel)
}

class StudentsAttendanceVC: UIViewController, StudentAttendanceDisplayLogic {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: StudentAttendanceModel.Fetch.Request(class_id :self.selectedClassId,stud_id :self.stsudentId))
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

extension StudentsAttendanceVC {
    
    func successFetchedItems(viewModel: StudentAttendanceModel.Fetch.ViewModel) {
        
        self.workingDays.text = "  \(GlobalVariables.shared.total_working_days) Days"
        self.daysPresent.text = "  \(GlobalVariables.shared.present_days) Days"
        self.onDuty.text = "  \(GlobalVariables.shared.od_days) Days"
        self.leaves.text = "  \(GlobalVariables.shared.leave_days) Days"
        self.daysAbsent.text = "  \(GlobalVariables.shared.absent_days) Days"
        
    }
    
    func errorFetchingItems(viewModel: StudentAttendanceModel.Fetch.ViewModel) {
        
    }
    
}
