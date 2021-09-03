//
//  AdminEventsVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//

import UIKit

protocol EventsListDisplayLogic: class
{
    func successFetchedItems(viewModel: EventsListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: EventsListModel.Fetch.ViewModel)
}

class AdminEventsVC: UIViewController, EventsListDisplayLogic {

    @IBOutlet weak var tableView: UITableView!
    
    var interactor: EventsListBusinessLogic?
    var displayedEventsListData: [EventsListModel.Fetch.ViewModel.DisplayedEventsListData] = []
    
    var selectedEventId = String()
    var selectedEventName = String()
    var selectedEventDetails = String()
    var selectedEventDate = String()
    var selectedSubEventStatus = String()
    var selectedYearId = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: EventsListModel.Fetch.Request(class_id :"",section_id:""))
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
        let interactor = EventsListInteractor()
        let presenter = EventsListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}

extension AdminEventsVC {
    
    func successFetchedItems(viewModel: EventsListModel.Fetch.ViewModel) {
        
        displayedEventsListData = viewModel.displayedEventsListData
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: EventsListModel.Fetch.ViewModel) {
        
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
}

extension AdminEventsVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedEventsListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EventListCell
        
        let data = displayedEventsListData[indexPath.row]
         
        cell.title.text = data.event_name
        cell.date.text = data.event_date
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = displayedEventsListData[indexPath.row]
        
        self.selectedEventId = data.event_id!
        self.selectedEventName = data.event_name!
        self.selectedEventDetails = data.event_details!
        self.selectedEventDate = data.event_date!
        self.selectedYearId = data.year_id!
        self.selectedSubEventStatus = data.sub_event_status!
    
        
        self.performSegue(withIdentifier: "toEvent_details", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "toEvent_details")
        {
        let vc = segue.destination as! EventDetailsVC
            
            vc.selectedEventId = self.selectedEventId
            vc.selectedEventName = self.selectedEventName
            vc.selectedEventDetails = self.selectedEventDetails
            vc.selectedEventDate = self.selectedEventDate
            vc.selectedYearId = self.selectedYearId
            vc.selectedSubEventStatus = self.selectedSubEventStatus
        }
    }
}
