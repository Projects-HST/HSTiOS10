//
//  StudentsDetailsVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/08/21.
//

import UIKit
import SDWebImage
import MBProgressHUD

protocol StudentDetailsDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: StudentDetailsModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: StudentDetailsModel.Fetch.ViewModel)
}

class StudentsDetailsVC: UIViewController, StudentDetailsDisplayLogic {
  
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var admissionNo: UILabel!
    @IBOutlet weak var EmsiNo: UILabel!
    @IBOutlet weak var admissionDate: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var dob: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var nationality: UILabel!
    @IBOutlet weak var religion: UILabel!
    @IBOutlet weak var communalClass: UILabel!
    @IBOutlet weak var community: UILabel!
    @IBOutlet weak var parentName: UILabel!
    @IBOutlet weak var parentId: UILabel!
    @IBOutlet weak var motherTongue: UILabel!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var mobileNo: UILabel!
    @IBOutlet weak var secMobileNo: UILabel!
    @IBOutlet weak var emailId: UILabel!
    @IBOutlet weak var secEmailId: UILabel!
    @IBOutlet weak var previousSchool: UILabel!
    @IBOutlet weak var previousClass: UILabel!
    @IBOutlet weak var promotionStatus: UILabel!
    @IBOutlet weak var tc: UILabel!
    @IBOutlet weak var recordSheet: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var parentStatus: UILabel!
    @IBOutlet weak var studentPic: UIImageView!
    @IBOutlet weak var bgView: UIView!
    
    var studentEnroolId = String()
    var selectedClassId = String()
    var interactor: StudentDetailsBusinessLogic?
    var displayedStudentDetailsData: [StudentDetailsModel.Fetch.ViewModel.DisplayedStudentDetailsData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: StudentDetailsModel.Fetch.Request(student_id :self.studentEnroolId,dynamic_db: GlobalVariables.shared.dynamic_db))
        MBProgressHUD.showAdded(to: self.view, animated: true)
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
        let interactor = StudentDetailsInteractor()
        let presenter = StudentDetailsPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    @IBAction func homeWork_testAction(_ sender: Any) {
        
        self.performSegue(withIdentifier: "to_homeWork_test", sender: self)
    }
    
    @IBAction func feesAction(_ sender: Any) {
        
    }
    
    @IBAction func attendanceAction(_ sender: Any) {
        self.performSegue(withIdentifier: "students_attendance", sender: self)
    }
    
    @IBAction func examResultsAction(_ sender: Any) {
        
        self.performSegue(withIdentifier: "to_exams", sender: self)
    }
}

extension StudentsDetailsVC  {
    
    func successFetchedItems(viewModel: StudentDetailsModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedStudentDetailsData = viewModel.displayedStudentDetailsData
        
        for data in displayedStudentDetailsData {
        
            self.EmsiNo.text = data.emsi_num
            self.name.text = data.name
            self.admissionNo.text = data.admisn_no
            self.gender.text = data.sex
            self.dob.text = data.dob
            self.age.text = data.age
            self.nationality.text = data.nationality
            self.religion.text = data.religion
            self.communalClass.text = data.community_class
            self.community.text = data.community
            self.parentName.text = data.parnt_guardn
            self.parentId.text = data.parnt_guardn_id
            self.motherTongue.text = data.mother_tongue
            self.language.text = data.language
            self.mobileNo.text = data.mobile
            self.secMobileNo.text = data.sec_mobile
            self.emailId.text = data.email
            self.secEmailId.text = data.sec_email
            self.previousSchool.text = ""
            self.previousClass.text = ""
            self.promotionStatus.text = data.qualified_promotion
            self.tc.text = data.tccopy
            self.recordSheet.text = data.record_sheet
            self.status.text = data.status
            self.parentStatus.text = data.parents_status
            
//            self.studentPic.sd_setImage(with: URL(string:data.student_pic!), placeholderImage: UIImage(named: ""))
        }
    }
    
    func errorFetchingItems(viewModel: StudentDetailsModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "to_homeWork_test")
        {
        let vc = segue.destination as! HomeWorkTestVC
            vc.stsudentId = self.studentEnroolId
            vc.selectedClassId = self.selectedClassId
        }
        else if (segue.identifier == "students_attendance")
        {
        let vc = segue.destination as! StudentsAttendanceVC
            vc.stsudentId = self.studentEnroolId
            vc.selectedClassId = self.selectedClassId
        }
        else if (segue.identifier == "to_exams")
        {
        let vc = segue.destination as! ExamResultsVC
            vc.selectedClassId = self.selectedClassId
        }
    }
}
