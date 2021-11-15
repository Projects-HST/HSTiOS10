//
//  EventDetailsInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//

import Foundation
import UIKit

protocol SubEventsBusinessLogic
{
    func fetchItems(request: SubEventsModel.Fetch.Request)
}
protocol SubEventsDataStore
{
  
}

class SubEventsInteractor: SubEventsBusinessLogic, SubEventsDataStore
{
    
    var presenter: SubEventsPresentationLogic?
    var worker: SubEventsWorker?
    var respData = [SubEventsModels]()
    func fetchItems(request: SubEventsModel.Fetch.Request) {
        if request.event_id == nil {
        self.presenter?.presentFetchResults(resp: SubEventsModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = SubEventsWorker()
        worker!.fetch(event_id:request.event_id!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: SubEventsModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: SubEventsModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

