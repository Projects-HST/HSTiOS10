//
//  HomeWorkDetailsVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/09/21.
//

import UIKit
import MBProgressHUD

protocol HomeWorkDetailsDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: HomeWorkDetailsModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: HomeWorkDetailsModel.Fetch.ViewModel)
}

class HomeWorkDetailsVC: UIViewController, HomeWorkDetailsDisplayLogic {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var topicLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var markLbl: UILabel!
    @IBOutlet weak var markDetLbl: UILabel!
    @IBOutlet weak var lineLbl1: UILabel!
    @IBOutlet weak var commentLbl: UILabel!
    @IBOutlet weak var commentDetLbl: UILabel!
    @IBOutlet weak var lineLbl2: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    var selectedMark = String()
    var selectedTopic = String()
    var selectedDescription = String()
    var selectedClassId = String()
    var selectedHomeWorkType = String()
    var displayedHomeWorkDetailsData: [HomeWorkDetailsModel.Fetch.ViewModel.DisplayedHomeWorkDetailsData] = []
    var interactor: HomeWorkDetailsBusinessLogic?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedClassId)
        print(selectedHomeWorkType)

        // Do any additional setup after loading the view.
        self.bgView.dropShadow()
        self.titleLbl.text = selectedTopic
        self.markDetLbl.text = selectedMark
        self.commentDetLbl.text = ""
        self.descriptionLbl.text = selectedDescription
        
        if selectedHomeWorkType == "HW" {
            markLbl.alpha = 0
            markDetLbl.alpha = 0
            lineLbl1.alpha = 0
            commentLbl.alpha = 0
            commentDetLbl.alpha = 0
            lineLbl2.alpha = 0
        }
        else {
            
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
        let interactor = HomeWorkDetailsInteractor()
        let presenter = HomeWorkDetailsPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}

extension HomeWorkDetailsVC {
    
    func successFetchedItems(viewModel: HomeWorkDetailsModel.Fetch.ViewModel) {
        displayedHomeWorkDetailsData = viewModel.displayedHomeWorkDetailsData
    }
    
    func errorFetchingItems(viewModel: HomeWorkDetailsModel.Fetch.ViewModel) {
        
    }
}

extension HomeWorkDetailsVC {
    
    
}
