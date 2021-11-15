//
//  SyncDataVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 06/10/21.
//

import UIKit
import CoreData
import MBProgressHUD

protocol SyncAttendanceDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel:SyncAttendanceModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: SyncAttendanceModel.Fetch.ViewModel)
}

protocol SyncAttendanceHistoryDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel:SyncAttendanceHistoryModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: SyncAttendanceHistoryModel.Fetch.ViewModel)
}

protocol SyncAssignmentDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel:SyncAssignmentModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: SyncAssignmentModel.Fetch.ViewModel)
}

protocol SyncCTestMarksDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel:SyncCTestMarksModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: SyncCTestMarksModel.Fetch.ViewModel)
}

protocol SyncExamMarksDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel:SyncExamMarksModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: SyncExamMarksModel.Fetch.ViewModel)
}

class SyncDataVC: UIViewController,SyncAttendanceDisplayLogic,SyncAttendanceHistoryDisplayLogic,SyncAssignmentDisplayLogic, SyncCTestMarksDisplayLogic, SyncExamMarksDisplayLogic {
    
    @IBOutlet weak var attendanceCount: UILabel!
    @IBOutlet weak var assignmentCount: UILabel!
    @IBOutlet weak var classtestCount: UILabel!
    @IBOutlet weak var examMarkseCount: UILabel!
    @IBOutlet weak var bgView1: UIView!
    @IBOutlet weak var bgView2: UIView!
    @IBOutlet weak var bgView3: UIView!
    @IBOutlet weak var bgView4: UIView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context : NSManagedObjectContext?
    
    var interactor: SyncAttendanceBusinessLogic?
    var interactor1: SyncAttendanceHistoryBusinessLogic?
    var interactor2: SyncAssignmentBusinessLogic?
    var interactor3: SyncCTestMarksBusinessLogic?
    var interactor4: SyncExamMarksBusinessLogic?
    
    var classAtendance = [ClassAttendances]()
    var classAtendanceHistory = [ClassAttendanceHistory]()
    var assignmentDataArr = [Homework_class_test]()
    var c_TestMarkEntryArr = [ClassTestMarkEntry]()
    var examMarkEntryArr = [ExamMarkEntry]()
    
    var arraysss = [String]()
//    Sync Attendance
    var id = [String]()
    var ac_year = [String]()
    var attendence_period = [String]()
    var no_of_absent = [String]()
    var created_at = [String]()
    var no_of_present = [String]()
    var created_by = [String]()
    var status = [String]()
    var class_id = [String]()
    var class_total = [String]()
    var AttendsyncStatus = [String]()
    var filteredAttendac_year = [String]()
    var filteredAttendattendence_period = [String]()
    var filteredAttendno_of_absent = [String]()
    var filteredAttendcreated_at = [String]()
    var filteredAttendno_of_present = [String]()
    var filteredAttendcreated_by = [String]()
    var filteredAttendstatus = [String]()
    var filteredAttendclass_id = [String]()
    var filteredAttendclass_total = [String]()
    var filteredAttendAttendsyncStatus = [String]()
    
    var atendCountSTR = String()
    var atendCountArr = [String]()
    
//    AttendHistory
    var A_Historyattend_id = [String]()
    var A_Historyclass_id = [String]()
    var A_Historystudent_id = [String]()
    var A_Historyabs_date = [String]()
    var A_Historya_status = [String]()
    var A_Historyattend_period = [String]()
    var A_Historya_val = [String]()
    var A_Historya_taken_by = [String]()
    var A_Historycreated_at = [String]()
    var A_Historystatus = [String]()
    var A_HistorySyncstatus = [String]()
    var FiltA_Historyattend_id = [String]()
    var FiltA_Historyclass_id = [String]()
    var FiltA_Historystudent_id = [String]()
    var FiltA_Historyabs_date = [String]()
    var FiltA_Historya_status = [String]()
    var FiltA_Historyattend_period = [String]()
    var FiltA_Historya_val = [String]()
    var FiltA_Historya_taken_by = [String]()
    var FiltA_Historycreated_at = [String]()
    var FiltA_Historystatus = [String]()
    var FiltA_HistorySyncstatus = [String]()

// Howe Work Assignment
    var HWclass_id = [String]()
    var HWteacher_id = [String]()
    var HWhomeWork_type = [String]()
    var HWsubject_id = [String]()
    var HWtitle = [String]()
    var HWtest_date = [String]()
    var HWdue_date = [String]()
    var HWhomework_details = [String]()
    var HWcreated_by = [String]()
    var HWcreated_at = [String]()
    var HWsyncStatus = [String]()
    
    var FiltHWclass_id = [String]()
    var FiltHWteacher_id = [String]()
    var FiltHWhomeWork_type = [String]()
    var FiltHWsubject_id = [String]()
    var FiltHWtitle = [String]()
    var FiltHWtest_date = [String]()
    var FiltHWdue_date = [String]()
    var FiltHWhomework_details = [String]()
    var FiltHWcreated_by = [String]()
    var FiltHWcreated_at = [String]()
    var FiltHWsyncStatus = [String]()
//
    var CTesthw_masterid = [String]()
    var CTeststudent_id = [String]()
    var CTestmarks = [String]()
    var CTestremarks = [String]()
    var CTestcreated_by = [String]()
    var CTestcreated_at = [String]()
    var CTestSyncStatus = [String]()
    
    var FiltCTesthw_masterid = [String]()
    var FiltCTeststudent_id = [String]()
    var FiltCTestmarks = [String]()
    var FiltCTestremarks = [String]()
    var FiltCTestcreated_by = [String]()
    var FiltCTestcreated_at = [String]()
    var FiltCTestSyncStatus = [String]()
    
    var ExamMarkexam_id = [String]()
    var ExamMarkteacher_id = [String]()
    var ExamMarksubject_id = [String]()
    var ExamMarkstu_id = [String]()
    var ExamMarkclassmaster_id = [String]()
    var ExamMarkinternal_mark = [String]()
    var ExamMarkexternal_mark = [String]()
    var ExamMarkmarks = [String]()
    var ExamMarkis_internal_external = [String]()
    var ExamMarkcreated_by = [String]()
    var ExamMarkSyncStatus = [String]()
    
    var FiltExamMarkexam_id = [String]()
    var FiltExamMarkteacher_id = [String]()
    var FiltExamMarksubject_id = [String]()
    var FiltExamMarkstu_id = [String]()
    var FiltExamMarkclassmaster_id = [String]()
    var FiltExamMarkinternal_mark = [String]()
    var FiltExamMarkexternal_mark = [String]()
    var FiltExamMarkmarks = [String]()
    var FiltExamMarkis_internal_external = [String]()
    var FiltExamMarkcreated_by = [String]()
    var FiltExamMarkSyncStatus = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.context = appDelegate.persistentContainer.viewContext
        self.fetchClassAttendanceHistory()
        self.fetchClassAttendance()
        self.fetchAssignmentDetails()
        self.fetchCtestMarks()
        self.fetchExamMarkEntryDetails()
        self.bgView1.dropShadow()
        self.bgView2.dropShadow()
        self.bgView3.dropShadow()
        self.bgView4.dropShadow()
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
        let interactor = SyncAttendanceInteractor()
        let presenter = SyncAttendancePresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        let viewController1 = self
        let interactor1 = SyncAttendanceHistoryInteractor()
        let presenter1 = SyncAttendanceHistoryPresenter()
        viewController1.interactor1 = interactor1
        interactor1.presenter1 = presenter1
        presenter1.viewController1 = viewController1
        
        let viewController2 = self
        let interactor2 = SyncAssignmentInteractor()
        let presenter2 = SyncAssignmentPresenter()
        viewController2.interactor2 = interactor2
        interactor2.presenter2 = presenter2
        presenter2.viewController2 = viewController2
        
        let viewController3 = self
        let interactor3 = SyncCTestMarksInteractor()
        let presenter3 = SyncCTestMarksPresenter()
        viewController3.interactor3 = interactor3
        interactor3.presenter3 = presenter3
        presenter3.viewController3 = viewController3
        
        let viewController4 = self
        let interactor4 = SyncExamMarksInteractor()
        let presenter4 = SyncExamMarksPresenter()
        viewController4.interactor4 = interactor4
        interactor4.presenter4 = presenter4
        presenter4.viewController4 = viewController4
    }
    
    @IBAction func attendanceSync(_ sender: Any) {
        
        self.syncAttendance()
    }
    
    func syncAttendance() {
        
        if filteredAttendno_of_absent.count >= 1 {
            
            let acYear = filteredAttendac_year.last
            self.filteredAttendac_year.removeLast()
            let atendPeriod = filteredAttendattendence_period.last
            self.filteredAttendattendence_period.removeLast()
            let absentCount = filteredAttendno_of_absent.last
            self.filteredAttendno_of_absent.removeLast()
            let createdAt = filteredAttendcreated_at.last
            self.filteredAttendcreated_at.removeLast()
            let presentCount = filteredAttendno_of_present.last
            self.filteredAttendno_of_present.removeLast()
            let cretedBy = filteredAttendcreated_by.last
            self.filteredAttendcreated_by.removeLast()
            let atendStatus = filteredAttendstatus.last
            self.filteredAttendstatus.removeLast()
            let clasId = filteredAttendclass_id.last
            self.filteredAttendclass_id.removeLast()
            let classTotal = filteredAttendclass_total.last
            self.filteredAttendclass_total.removeLast()
            
            interactor?.fetchItems(request: SyncAttendanceModel.Fetch.Request(ac_year:acYear!,class_id:clasId!,class_total:classTotal!,no_of_present:presentCount!,no_of_absent:absentCount!,attendence_period:atendPeriod!,created_by:cretedBy!,created_at:createdAt!,status:atendStatus!,dynamic_db: GlobalVariables.shared.dynamic_db))
        }
    }
    
    func syncAttendanceHistory() {
        
        if FiltA_Historyattend_id.count >= 1 {
            
            let attendId = FiltA_Historyattend_id.last
            self.FiltA_Historyattend_id.removeLast()
            let classId = FiltA_Historyclass_id.last
            self.FiltA_Historyclass_id.removeLast()
            let studenentId = FiltA_Historystudent_id.last
            self.FiltA_Historystudent_id.removeLast()
            let absDate = FiltA_Historyabs_date.last
            self.FiltA_Historyabs_date.removeLast()
            let absentStatus = FiltA_Historya_status.last
            self.FiltA_Historya_status.removeLast()
            let attendPeriod = FiltA_Historyattend_period.last
            self.FiltA_Historyattend_period.removeLast()
            let a_val = FiltA_Historya_val.last
            self.FiltA_Historya_val.removeLast()
            let takenBy = FiltA_Historya_taken_by.last
            self.FiltA_Historya_taken_by.removeLast()
            let createdAt = FiltA_Historycreated_at.last
            self.FiltA_Historycreated_at.removeLast()
            let Status = FiltA_Historystatus.last
            self.FiltA_Historystatus.removeLast()
           
            interactor1?.fetchItems(request: SyncAttendanceHistoryModel.Fetch.Request(attend_id: attendId!, class_id: classId!, student_id: studenentId!, abs_date: absDate!, a_status: absentStatus!, attend_period: attendPeriod!, a_val: a_val!, a_taken_by: takenBy!, created_at: createdAt!, status: Status!,dynamic_db: GlobalVariables.shared.dynamic_db))
        }
    }
    
    func syncAssignment() {
        
        if FiltHWclass_id.count >= 1 {
        
            let classId = FiltHWclass_id.last
            self.FiltHWclass_id.removeLast()
            let teacherId = FiltHWteacher_id.last
            self.FiltHWteacher_id.removeLast()
            let hwType = FiltHWhomeWork_type.last
            self.FiltHWhomeWork_type.removeLast()
            let subjectId = FiltHWsubject_id.last
            self.FiltHWsubject_id.removeLast()
            let HWTitle = FiltHWtitle.last
            self.FiltHWtitle.removeLast()
            let testData = FiltHWtest_date.last
            self.FiltHWtest_date.removeLast()
            let dueDate = FiltHWdue_date.last
            self.FiltHWdue_date.removeLast()
            let HWDetails = FiltHWhomework_details.last
            self.FiltHWhomework_details.removeLast()
            let createdBy = FiltHWcreated_by.last
            self.FiltHWcreated_by.removeLast()
            let createdAt = FiltHWcreated_at.last
            self.FiltHWcreated_at.removeLast()
           
            interactor2?.fetchItems(request: SyncAssignmentModel.Fetch.Request(class_id: classId!, teacher_id: teacherId!, homeWork_type: hwType!, subject_id: subjectId!, title: HWTitle!, test_date: testData!, due_date: dueDate!, homework_details: HWDetails!, created_by: createdBy!, created_at: createdAt!,dynamic_db: GlobalVariables.shared.dynamic_db))
        }
    }
    
    func syncCTestMarks() {
        
        if FiltCTeststudent_id.count >= 1 {
            
            let HwMasterId = FiltCTesthw_masterid.last
            self.FiltCTesthw_masterid.removeLast()
            let StudentId = FiltCTeststudent_id.last
            self.FiltCTeststudent_id.removeLast()
            let CTetsMarks = FiltCTestmarks.last
            self.FiltCTestmarks.removeLast()
            let Remarks = FiltCTestremarks.last
            self.FiltCTestremarks.removeLast()
            let CreatedBy = FiltCTestcreated_by.last
            self.FiltCTestcreated_by.removeLast()
            let CreatedAt = FiltCTestcreated_at.last
            self.FiltCTestcreated_at.removeLast()
           
            interactor3?.fetchItems(request: SyncCTestMarksModel.Fetch.Request(hw_masterid:HwMasterId!,student_id:StudentId!,marks:CTetsMarks!,remarks:Remarks!,created_by:CreatedBy!,created_at:CreatedAt!,dynamic_db: GlobalVariables.shared.dynamic_db))
        }
    }
    
    func syncExamMarks() {
        
        if FiltExamMarkstu_id.count >= 1 {
            
            let examId = FiltExamMarkexam_id.last
            self.FiltExamMarkexam_id.removeLast()
            let teacherId = FiltExamMarkteacher_id.last
            self.FiltExamMarkteacher_id.removeLast()
            let subjectId = FiltExamMarksubject_id.last
            self.FiltExamMarksubject_id.removeLast()
            let studentId = FiltExamMarkstu_id.last
            self.FiltExamMarkstu_id.removeLast()
            let classId = FiltExamMarkclassmaster_id.last
            self.FiltExamMarkclassmaster_id.removeLast()
            let internalMark = FiltExamMarkinternal_mark.last
            self.FiltExamMarkinternal_mark.removeLast()
            let externalMark = FiltExamMarkexternal_mark.last
            self.FiltExamMarkexternal_mark.removeLast()
            let marks = FiltExamMarkmarks.last
            self.FiltExamMarkmarks.removeLast()
            let isInternal_external = FiltExamMarkis_internal_external.last
            self.FiltExamMarkis_internal_external.removeLast()
            let createdBy = FiltExamMarkcreated_by.last
            self.FiltExamMarkcreated_by.removeLast()
           
            interactor4?.fetchItems(request: SyncExamMarksModel.Fetch.Request(exam_id: examId!, teacher_id: teacherId!, subject_id: subjectId!, stu_id: studentId!, classmaster_id: classId!, internal_mark: internalMark!, external_mark: externalMark!, marks: marks!, is_internal_external: isInternal_external!, created_by: createdBy!,dynamic_db: GlobalVariables.shared.dynamic_db))
        }
    }
    
    @IBAction func assignmentSync(_ sender: Any) {
        self.syncAssignment()
    }
    
    @IBAction func classTestSync(_ sender: Any) {
        self.syncCTestMarks()
    }
    
    @IBAction func examMarksSync(_ sender: Any) {
        self.syncExamMarks()
    }
    
    @IBAction func refreshAction(_ sender: Any) {
        
    }
}

extension SyncDataVC {
        
    func successFetchedItems(viewModel: SyncAttendanceModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: viewModel.msg!, complition: {
        })
        self.syncAttendance()
        self.syncAttendanceHistory()
        
        if filteredAttendac_year.count == 0 {
            self.deleteAllData(entity:"ClassAttendances")
        }
    }
    
    func errorFetchingItems(viewModel: SyncAttendanceModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Already Added", complition: {
        })
    }
    
//    Attendence History
    func successFetchedItems(viewModel: SyncAttendanceHistoryModel.Fetch.ViewModel) {
        
        if FiltA_Historyattend_id.count == 0 {
            self.deleteAllData(entity:"ClassAttendanceHistory")
        }
    }
    
    func errorFetchingItems(viewModel: SyncAttendanceHistoryModel.Fetch.ViewModel) {
        
    }
    
//    Assignment
    func successFetchedItems(viewModel: SyncAssignmentModel.Fetch.ViewModel) {
        
        if FiltHWclass_id.count == 0 {
            self.deleteAllData(entity:"Homework_class_test")
        }
    }
    
    func errorFetchingItems(viewModel: SyncAssignmentModel.Fetch.ViewModel) {
        
    }
    
//    ClassTestMarks
    func successFetchedItems(viewModel: SyncCTestMarksModel.Fetch.ViewModel) {
        
        self.syncCTestMarks()
        if FiltCTeststudent_id.count == 0 {
            self.deleteAllData(entity:"ClassTestMarkEntry")
        }
    }
    
    func errorFetchingItems(viewModel: SyncCTestMarksModel.Fetch.ViewModel) {
        self.deleteAllData(entity:"ClassTestMarkEntry")
    }
    
//  ExamMarks
    func successFetchedItems(viewModel: SyncExamMarksModel.Fetch.ViewModel) {
        self.syncExamMarks()
        if FiltExamMarkstu_id.count == 0 {
            self.deleteAllData(entity:"ExamMarkEntry")
        }
    }
    
    func errorFetchingItems(viewModel: SyncExamMarksModel.Fetch.ViewModel) {
        
    }
}

extension SyncDataVC {
    
    func fetchClassAttendance() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ClassAttendances")
        do {
            let results = try context.fetch(fetchRequest)
            classAtendance = results as! [ClassAttendances]

                for data in classAtendance {

                    let id = data.id
                    let ac_year = data.ac_year
                    let attendence_period = data.attendence_period
                    let class_id = data.class_id
                    let class_total = data.class_total
                    let no_of_present = data.no_of_present
                    let no_of_absent = data.no_of_absent
                    let created_at = data.created_at
                    let created_by = data.created_by
                    let status = data.status
                    let syncstatus = data.sync_status

                    self.id.append(id!)
                    self.ac_year.append(ac_year!)
                    self.attendence_period.append(attendence_period!)
                    self.class_id.append(class_id!)
                    self.class_total.append(class_total!)
                    self.no_of_present.append(no_of_present!)
                    self.no_of_absent.append(no_of_absent!)
                    self.created_at.append(created_at!)
                    self.created_by.append(created_by!)
                    self.status.append(status!)
                    self.AttendsyncStatus.append(syncstatus!)
                    
                    self.atendCountArr.append(no_of_absent!)
            }
            
            let SyncStatusIndex = AttendsyncStatus.enumerated().filter {
                $0.element == "NS"
                }.map{$0.offset}
            
            self.filteredAttendac_year = SyncStatusIndex.map { ac_year[$0] }
            self.filteredAttendattendence_period = SyncStatusIndex.map { attendence_period[$0] }
            self.filteredAttendno_of_absent = SyncStatusIndex.map { no_of_absent[$0] }
            self.filteredAttendcreated_at = SyncStatusIndex.map { created_at[$0] }
            self.filteredAttendno_of_present = SyncStatusIndex.map { no_of_present[$0] }
            self.filteredAttendcreated_by = SyncStatusIndex.map { created_by[$0] }
            self.filteredAttendstatus = SyncStatusIndex.map { status[$0] }
            self.filteredAttendclass_id = SyncStatusIndex.map { class_id[$0] }
            self.filteredAttendclass_total = SyncStatusIndex.map { class_total[$0] }
            
            self.attendanceCount.text = String(filteredAttendno_of_absent.count)
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func fetchClassAttendanceHistory() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ClassAttendanceHistory")
        do {
            let results = try context.fetch(fetchRequest)
            classAtendanceHistory = results as! [ClassAttendanceHistory]
            
            for data in classAtendanceHistory {
                
                self.A_Historyattend_id.append(data.attend_id!)
                self.A_Historystudent_id.append(data.student_id!)
                self.A_Historyabs_date.append(data.abs_date!)
                self.A_Historya_status.append(data.a_status!)
                self.A_Historyattend_period.append(data.attend_period!)
                self.A_Historya_val.append(data.a_val!)
                self.A_Historya_taken_by.append(data.a_taken_by!)
                self.A_Historycreated_at.append(data.created_at!)
                self.A_Historystatus.append(data.status!)
                self.A_Historyclass_id.append(data.class_id!)
                self.A_HistorySyncstatus.append(data.sync_status!)
            }
            
            let SyncStatusIndex = A_HistorySyncstatus.enumerated().filter {
                $0.element == "NS"
                }.map{$0.offset}
            
            self.FiltA_Historyattend_id = SyncStatusIndex.map { A_Historyattend_id[$0] }
            self.FiltA_Historystudent_id = SyncStatusIndex.map { A_Historystudent_id[$0] }
            self.FiltA_Historyclass_id = SyncStatusIndex.map { A_Historyclass_id[$0] }
            self.FiltA_Historyabs_date = SyncStatusIndex.map { A_Historyabs_date[$0] }
            self.FiltA_Historya_status = SyncStatusIndex.map { A_Historya_status[$0] }
            self.FiltA_Historyattend_period = SyncStatusIndex.map { A_Historyattend_period[$0] }
            self.FiltA_Historya_val = SyncStatusIndex.map { A_Historya_val[$0] }
            self.FiltA_Historya_taken_by = SyncStatusIndex.map { A_Historya_taken_by[$0] }
            self.FiltA_Historycreated_at = SyncStatusIndex.map { A_Historycreated_at[$0] }
            self.FiltA_Historystatus = SyncStatusIndex.map { A_Historystatus[$0] }
            self.FiltA_HistorySyncstatus = SyncStatusIndex.map { A_HistorySyncstatus[$0] }
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func fetchAssignmentDetails() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Homework_class_test")
        do {
            let results = try context.fetch(fetchRequest)
            assignmentDataArr = results as! [Homework_class_test]
            
            for data in assignmentDataArr {
                
                self.HWclass_id.append(data.class_id!)
                self.HWteacher_id.append(data.teacher_id!)
                self.HWhomeWork_type.append(data.hw_type!)
                self.HWsubject_id.append(data.subject_id!)
                self.HWtitle.append(data.title!)
                self.HWtest_date.append(data.test_date!)
                self.HWdue_date.append(data.due_date!)
                self.HWhomework_details.append(data.hw_details!)
                self.HWcreated_by.append(data.created_by!)
                self.HWcreated_at.append(data.created_at!)
                self.HWsyncStatus.append(data.sync_status!)
            }
            
            let SyncStatusIndex = HWsyncStatus.enumerated().filter {
                $0.element == "NS"
                }.map{$0.offset}
            
            self.FiltHWclass_id = SyncStatusIndex.map { HWclass_id[$0] }
            self.FiltHWteacher_id = SyncStatusIndex.map { HWteacher_id[$0] }
            self.FiltHWhomeWork_type = SyncStatusIndex.map { HWhomeWork_type[$0] }
            self.FiltHWsubject_id = SyncStatusIndex.map { HWsubject_id[$0] }
            self.FiltHWtitle = SyncStatusIndex.map { HWtitle[$0] }
            self.FiltHWtest_date = SyncStatusIndex.map { HWtest_date[$0] }
            self.FiltHWdue_date = SyncStatusIndex.map { HWdue_date[$0] }
            self.FiltHWhomework_details = SyncStatusIndex.map { HWhomework_details[$0] }
            self.FiltHWcreated_by = SyncStatusIndex.map { HWcreated_by[$0] }
            self.FiltHWcreated_at = SyncStatusIndex.map { HWcreated_at[$0] }
            self.FiltHWsyncStatus = SyncStatusIndex.map { HWsyncStatus[$0] }
            
            self.assignmentCount.text = String(FiltHWteacher_id.count)
            print(FiltHWcreated_at)
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func fetchExamMarkEntryDetails() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ExamMarkEntry")
        do {
            let results = try context.fetch(fetchRequest)
            examMarkEntryArr = results as! [ExamMarkEntry]
            
            for data in examMarkEntryArr {
                
                self.ExamMarkexam_id = data.exam_id as! [String]
                self.ExamMarkteacher_id = data.teacher_id as! [String]
                self.ExamMarksubject_id = data.subject_id as! [String]
                self.ExamMarkstu_id = data.stu_id as! [String]
                self.ExamMarkclassmaster_id = data.classmaster_id as! [String]
                self.ExamMarkinternal_mark = data.internal_mark as! [String]
                self.ExamMarkexternal_mark = data.external_grade as! [String]
                self.ExamMarkmarks = data.total_marks as! [String]
                self.ExamMarkis_internal_external = data.internal_mark as! [String]
                self.ExamMarkcreated_by = data.created_by as! [String]
                self.ExamMarkSyncStatus = data.sync_status as! [String]
            }
            
            let SyncStatusIndex = ExamMarkSyncStatus.enumerated().filter {
                $0.element == "NS"
                }.map{$0.offset}
            
            self.FiltExamMarkexam_id = SyncStatusIndex.map { ExamMarkexam_id[$0] }
            self.FiltExamMarkteacher_id = SyncStatusIndex.map { ExamMarkteacher_id[$0] }
            self.FiltExamMarksubject_id = SyncStatusIndex.map { ExamMarksubject_id[$0] }
            self.FiltExamMarkstu_id = SyncStatusIndex.map { ExamMarkstu_id[$0] }
            self.FiltExamMarkclassmaster_id = SyncStatusIndex.map { ExamMarkclassmaster_id[$0] }
            self.FiltExamMarkinternal_mark = SyncStatusIndex.map { ExamMarkinternal_mark[$0] }
            self.FiltExamMarkexternal_mark = SyncStatusIndex.map { ExamMarkexternal_mark[$0] }
            self.FiltExamMarkmarks = SyncStatusIndex.map { ExamMarkmarks[$0] }
            self.FiltExamMarkis_internal_external = SyncStatusIndex.map { ExamMarkis_internal_external[$0] }
            self.FiltExamMarkcreated_by = SyncStatusIndex.map { ExamMarkcreated_by[$0] }
            self.FiltExamMarkSyncStatus = SyncStatusIndex.map { ExamMarkSyncStatus[$0] }
           
            self.examMarkseCount.text = String(FiltExamMarkstu_id.count)
            print(FiltExamMarkexam_id)
            print(FiltExamMarkmarks)
            print(FiltExamMarkstu_id)
            print(FiltExamMarkstu_id)
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func fetchCtestMarks() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ClassTestMarkEntry")
        do {
            let results = try context.fetch(fetchRequest)
            c_TestMarkEntryArr = results as! [ClassTestMarkEntry]
            
            for data in c_TestMarkEntryArr {
               
                self.CTesthw_masterid = data.local_hw_id as! [String]
                self.CTeststudent_id = data.student_id as! [String]
                self.CTestmarks = data.marks as! [String]
                self.CTestremarks = data.remarks as! [String]
                self.CTestcreated_by = data.created_by as! [String]
                self.CTestcreated_at = data.created_at as! [String]
                self.CTestSyncStatus = data.sync_status as! [String]
                
                let SyncStatusIndex = CTestSyncStatus.enumerated().filter {
                    $0.element == "NS"
                    }.map{$0.offset}
                
                self.FiltCTesthw_masterid = SyncStatusIndex.map { CTesthw_masterid[$0] }
                self.FiltCTeststudent_id = SyncStatusIndex.map { CTeststudent_id[$0] }
                self.FiltCTestmarks = SyncStatusIndex.map { CTestmarks[$0] }
                self.FiltCTestremarks = SyncStatusIndex.map { CTestremarks[$0] }
                self.FiltCTestcreated_by = SyncStatusIndex.map { CTestcreated_by[$0] }
                self.FiltCTestcreated_at = SyncStatusIndex.map { CTestcreated_at[$0] }
                self.FiltCTestSyncStatus = SyncStatusIndex.map { CTestSyncStatus[$0] }
               
            }
            print(FiltCTesthw_masterid)
            print(FiltCTestmarks)
            self.classtestCount.text = String(FiltCTestSyncStatus.count)
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func deleteAllData(entity: String)
    {
        let ReqVar = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: ReqVar)
        do { try context!.execute(DelAllReqVar) }
        catch { print(error) }
    }
}
