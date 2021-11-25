//
//  TeacherDetailsVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 02/09/21.
//

import UIKit
import MBProgressHUD

protocol TeacherDetailsDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: TeacherDetailsModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: TeacherDetailsModel.Fetch.ViewModel)
}

class TeacherDetailsVC: UIViewController, TeacherDetailsDisplayLogic {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var nationality: UILabel!
    @IBOutlet weak var religion: UILabel!
    @IBOutlet weak var commmunityCLass: UILabel!
    @IBOutlet weak var community: UILabel!
    @IBOutlet weak var handSubject: UILabel!
    @IBOutlet weak var claasTeacherFor: UILabel!
    @IBOutlet weak var mobilNo: UILabel!
    @IBOutlet weak var secMobileNo: UILabel!
    @IBOutlet weak var emailId: UILabel!
    @IBOutlet weak var alternateEmailId: UILabel!
    @IBOutlet weak var handlingClasses: UILabel!
    @IBOutlet weak var techerImage: UIImageView!
    @IBOutlet weak var bgView: UIView!
    
    var interactor: TeacherDetailsBusinessLogic?
    var displayedTeacherDetailsData: [TeacherDetailsModel.Fetch.ViewModel.DisplayedTeacherDetailsData] = []
    var teacher_ID = String()
    var user_id = String()
    var class_id = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: TeacherDetailsModel.Fetch.Request(teacher_id :self.teacher_ID,dynamic_db: GlobalVariables.shared.dynamic_db))
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
        let interactor = TeacherDetailsInteractor()
        let presenter = TeacherDetailsPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    @IBAction func viewT_tableAction(_ sender: Any) {
        self.performSegue(withIdentifier: "toTimeTableTeachers", sender: self)
    }
}

extension TeacherDetailsVC {
    
    func successFetchedItems(viewModel: TeacherDetailsModel.Fetch.ViewModel) {
        
        displayedTeacherDetailsData = viewModel.displayedTeacherDetailsData
        
        MBProgressHUD.hide(for: self.view, animated: true)
        for data in displayedTeacherDetailsData {
            
            self.address.text = data.address
            self.name.text = data.name
            self.commmunityCLass.text = data.community_class
            self.gender.text = data.sex
            self.claasTeacherFor.text = data.class_teacher
            self.age.text = data.age
            self.nationality.text = data.nationality
            self.religion.text = data.religion
            self.handSubject.text = data.community_class
            self.community.text = data.community
            self.mobilNo.text = data.phone
            self.secMobileNo.text = data.sec_phone
            self.emailId.text = data.email
            self.alternateEmailId.text = data.sec_email
            self.handlingClasses.text = data.class_taken
            self.user_id = data.user_id!
//            self.class_id = data.class_id
            print(user_id)
        }
    }
    
    func errorFetchingItems(viewModel: TeacherDetailsModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "toTimeTableTeachers")
        {
        let vc = segue.destination as! TimeTableTeacherListsVC
            vc.user_id = self.user_id
            vc.class_id = self.class_id
        }
    }
}
