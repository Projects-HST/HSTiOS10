//
//  StudentsTimeTableListVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/10/21.
//

import UIKit
import HMSegmentedControl
import MBProgressHUD

protocol DayListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: DayListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: DayListModel.Fetch.ViewModel)
}

protocol TimeTableListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: TimeTableListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: TimeTableListModel.Fetch.ViewModel)
}

class StudentsTimeTableListVC: UIViewController,DayListDisplayLogic, TimeTableListDisplayLogic {
   
   
    @IBOutlet weak var segmentView: UIView!
    
    var interactor: DayListBusinessLogic?
    var displayedDayListData: [DayListModel.Fetch.ViewModel.DisplayedDayListData] = []
    
    var interactor1: TimeTableListBusinessLogic?
    var displayedTimeTableListData: [TimeTableListModel.Fetch.ViewModel.DisplayedTimeTableListData] = []
    
    var segmentedControl = HMSegmentedControl()
    var segTitles = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setUpSegementControl ()
        interactor?.fetchItems(request: DayListModel.Fetch.Request(class_id:GlobalVariables.shared.class_id))
        interactor1?.fetchItems(request: TimeTableListModel.Fetch.Request(class_id:GlobalVariables.shared.class_id))
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
        let interactor = DayListInteractor()
        let presenter = DayListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        let viewController1 = self
        let interactor1 = TimeTableListInteractor()
        let presenter1 = TimeTableListPresenter()
        viewController1.interactor1 = interactor1
        interactor1.presenter1 = presenter1
        presenter1.viewController1 = viewController1
    }
    
    func setUpSegementControl ()
        {
            segmentedControl = HMSegmentedControl(sectionTitles: self.segTitles)
            segmentedControl.autoresizingMask = [.flexibleRightMargin, .flexibleWidth]
            segmentedControl.frame = CGRect(x: 0, y: 0, width: self.segmentView.frame.width, height: 50)
            segmentedControl.addTarget(self, action: #selector(segmentedControlChangedValue(segmentedControl:)), for: .valueChanged)
            segmentView.addSubview(segmentedControl)
            segmentedControl.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
            segmentedControl.selectedTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
            segmentedControl.selectionStyle = HMSegmentedControlSelectionStyle.fullWidthStripe
            segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocation.bottom
            segmentedControl.segmentWidthStyle = HMSegmentedControlSegmentWidthStyle.fixed
            segmentedControl.selectionIndicatorHeight = 4.0
            segmentedControl.selectionIndicatorColor = UIColor.black
//            segmentedControl.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Roboto-Medium", size: 15.0)!]
        }
        
        @objc func segmentedControlChangedValue(segmentedControl: HMSegmentedControl) {
            /*remove array Values*/
//            self.fullnameArr.removeAll()
        }
}

extension StudentsTimeTableListVC {
    
    func successFetchedItems(viewModel: DayListModel.Fetch.ViewModel) {
        
    }
    
    func errorFetchingItems(viewModel: DayListModel.Fetch.ViewModel) {
        
    }
    
    func successFetchedItems(viewModel: TimeTableListModel.Fetch.ViewModel) {
        
    }
    
    func errorFetchingItems(viewModel: TimeTableListModel.Fetch.ViewModel) {
        
    }
}
