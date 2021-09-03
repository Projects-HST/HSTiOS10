//
//  EventsDetailsPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//

import Foundation

protocol SubEventsPresentationLogic
{
  func presentFetchResults(resp: SubEventsModel.Fetch.Response)
}

class SubEventsPresenter: SubEventsPresentationLogic
{
  weak var viewController: SubEventsDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: SubEventsModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedSubEventsData: [SubEventsModel.Fetch.ViewModel.DisplayedSubEventsData] = []
       
        for data in resp.testObj {
        let displayedSubEventsDatas = SubEventsModel.Fetch.ViewModel.DisplayedSubEventsData(event_date: data.event_date!,status: data.status!,sub_event_status: data.sub_event_status!,year_id: data.year_id!,event_details: data.event_details!,event_name: data.event_name!,event_id: data.event_id!)
            displayedSubEventsData.append(displayedSubEventsDatas)
        }
        let viewModel = SubEventsModel.Fetch.ViewModel(displayedSubEventsData: displayedSubEventsData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
