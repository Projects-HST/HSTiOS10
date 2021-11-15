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
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentView: UIView!
    
    var interactor: DayListBusinessLogic?
    var displayedDayListData: [DayListModel.Fetch.ViewModel.DisplayedDayListData] = []
    
    var interactor1: TimeTableListBusinessLogic?
    var displayedTimeTableListData: [TimeTableListModel.Fetch.ViewModel.DisplayedTimeTableListData] = []
    
    var segmentedControl = HMSegmentedControl()
    var segTitles = [String]()
    var segTitlesID = [String]()
    
    var nameArr = [String]()
    var secNameArr = [String]()
    var fromTimeArr = [String]()
    var toTimeArr = [String]()
    var subNameArr = [String]()
    var day_idArr = [String]()
    var is_breakArr = [String]()
    
    var selectedfromTimeArr = [String]()
    var selectedtoTimeArr = [String]()
    var selectedSecNameArr = [String]()
    var selectedday_idArr = [String]()
    var selectedis_breakdArr = [String]()
    
    var selectedSegId = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        interactor?.fetchItems(request: DayListModel.Fetch.Request(class_id:GlobalVariables.shared.class_id,dynamic_db: GlobalVariables.shared.dynamic_db))
        interactor1?.fetchItems(request: TimeTableListModel.Fetch.Request(class_id:GlobalVariables.shared.class_id,dynamic_db: GlobalVariables.shared.dynamic_db))
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
            segmentView.backgroundColor = UIColor.darkGray
            segmentedControl.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
            segmentedControl.selectedTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
            segmentedControl.selectionStyle = HMSegmentedControlSelectionStyle.fullWidthStripe
            segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocation.bottom
            segmentedControl.segmentWidthStyle = HMSegmentedControlSegmentWidthStyle.fixed
            segmentedControl.selectionIndicatorHeight = 4.0
            segmentedControl.selectionIndicatorColor = UIColor.white
//            segmentedControl.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Roboto-Medium", size: 15.0)!]
        }
        
        @objc func segmentedControlChangedValue(segmentedControl: HMSegmentedControl) {
            let index =  Int(segmentedControl.selectedSegmentIndex)
            let selectedId = segTitlesID[index]
            self.selectedSegId = String(selectedId)
            
            let indexes = day_idArr.enumerated().filter {
                $0.element == selectedSegId
                }.map{$0.offset}
            
            let dayID = day_idArr[indexes.indices]
            let toTime = toTimeArr[indexes.indices]
            let fromTime = fromTimeArr[indexes.indices]
            let secName = secNameArr[indexes.indices]
            let isBreak = is_breakArr[indexes.indices]
           
            selectedfromTimeArr = Array(fromTime)
            selectedtoTimeArr = Array(toTime)
            selectedSecNameArr = Array(secName)
            selectedday_idArr = Array(dayID)
            selectedis_breakdArr = Array(isBreak)
            self.tableView.reloadData()
        }
}

extension StudentsTimeTableListVC {
    
    func successFetchedItems(viewModel: DayListModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedDayListData = viewModel.displayedDayListData
        
        for datas in displayedDayListData {
            let days = datas.day_name
            let daysId = datas.day_name
            
            self.segTitles.append(days!)
            self.segTitlesID.append(daysId!)
        }
        self.setUpSegementControl ()
    }
    
    func errorFetchingItems(viewModel: DayListModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"An error occured", complition: {
        })
    }
    
    
    func successFetchedItems(viewModel: TimeTableListModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedTimeTableListData = viewModel.displayedTimeTableListData
        
        for datas in displayedTimeTableListData {
            let fromTime = datas.from_time
            let toTime = datas.to_time
            let dayId = datas.day_id
            let secName = datas.sec_name
            let is_break = datas.is_break
            
            self.day_idArr.append(dayId!)
            self.toTimeArr.append(toTime!)
            self.fromTimeArr.append(fromTime!)
            self.secNameArr.append(secName!)
            self.is_breakArr.append(is_break!)
        }
    }
    
    func errorFetchingItems(viewModel: TimeTableListModel.Fetch.ViewModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"An error occured", complition: {
        })
    }
}

extension StudentsTimeTableListVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return selectedSecNameArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TimeTableListCell
                
        if selectedis_breakdArr[indexPath.row] == "0"{
            cell.timeLbl.text = "\(selectedfromTimeArr[indexPath.row]) - \(selectedtoTimeArr[indexPath.row])"
              cell.secNmae.text = selectedSecNameArr[indexPath.row]
        }
        
        else {
            cell.bgView.backgroundColor = UIColor.orange
            cell.timeLbl.text = " break \(selectedfromTimeArr[indexPath.row]) - \(selectedtoTimeArr[indexPath.row])"
            cell.timeLbl.textColor = UIColor.white
            cell.timeLbl.font = UIFont(name:"SFUIText-Regular", size: 20.0)
        }
        return cell
    }
}






//TimeTableListCell: UITableViewCell {
//
//    @IBOutlet weak var timeLbl: UILabel!
//    @IBOutlet weak var nameLbl: UILabel!
//    @IBOutlet weak var subNameLbl: UILabel!
//    @IBOutlet weak var lineLbl: UILabel!
//    @IBOutlet weak var bgView: UIView!
//    @IBOutlet weak var iconImg: UIImageView!
//
