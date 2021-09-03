//
//  EventsListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//

import Foundation

protocol EventsListPresentationLogic
{
  func presentFetchResults(resp: EventsListModel.Fetch.Response)
}

class EventsListPresenter: EventsListPresentationLogic
{
  weak var viewController: EventsListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: EventsListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedEventsListData: [EventsListModel.Fetch.ViewModel.DisplayedEventsListData] = []
       
        for data in resp.testObj {
        let displayedEventsListDatas = EventsListModel.Fetch.ViewModel.DisplayedEventsListData(event_date: data.event_date!,status: data.status!,sub_event_status: data.sub_event_status!,year_id: data.year_id!,event_details: data.event_details!,event_name: data.event_name!,event_id: data.event_id!)
            displayedEventsListData.append(displayedEventsListDatas)
        }
        let viewModel = EventsListModel.Fetch.ViewModel(displayedEventsListData: displayedEventsListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
