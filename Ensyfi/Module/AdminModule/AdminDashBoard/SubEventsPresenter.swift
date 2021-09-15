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
        let displayedSubEventsDatas = SubEventsModel.Fetch.ViewModel.DisplayedSubEventsData(sub_event_name: data.sub_event_name!,name: data.name!)
            displayedSubEventsData.append(displayedSubEventsDatas)
        }
        let viewModel = SubEventsModel.Fetch.ViewModel(displayedSubEventsData: displayedSubEventsData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
