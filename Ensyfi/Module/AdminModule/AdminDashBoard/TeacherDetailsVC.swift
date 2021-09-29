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
    
    var interactor: TeacherDetailsBusinessLogic?
    var displayedTeacherDetailsData: [TeacherDetailsModel.Fetch.ViewModel.DisplayedTeacherDetailsData] = []
    var teacher_ID = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: TeacherDetailsModel.Fetch.Request(teacher_id :self.teacher_ID))
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
        let interactor = TeacherDetailsInteractor()
        let presenter = TeacherDetailsPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
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

        }
    }
    
    func errorFetchingItems(viewModel: TeacherDetailsModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
}
