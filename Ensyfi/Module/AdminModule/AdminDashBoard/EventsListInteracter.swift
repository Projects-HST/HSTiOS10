//
//  EventsListInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//

import Foundation
import UIKit

protocol EventsListBusinessLogic
{
    func fetchItems(request: EventsListModel.Fetch.Request)
}
protocol EventsListDataStore
{
  
}

class EventsListInteractor: EventsListBusinessLogic, EventsListDataStore
{
    
    var presenter: EventsListPresentationLogic?
    var worker: EventsListWorker?
    var respData = [EventsListModels]()
    func fetchItems(request: EventsListModel.Fetch.Request) {
        if request.class_id == nil {
        self.presenter?.presentFetchResults(resp: EventsListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = EventsListWorker()
        worker!.fetch(class_id:request.class_id!,section_id:request.section_id!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: EventsListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: EventsListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
