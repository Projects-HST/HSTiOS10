//
//  ODTeachersListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 08/09/21.
//
import Foundation
import UIKit

struct ODTeachersListModel{
    struct Fetch {
        
        struct Request
        {
            var user_type : String?
           
        }
        
        struct Response
        {
            var testObj: [ODTeachersListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedODTeachersListData
           {
            var class_name : String?
            var from_date : String?
            var id : String?
            var name : String?
            var notes : String?
            var od_for : String?
            var sec_name : String?
            var status : String?
            var to_date : String?
            var user_id : String?
            var user_master_id : String?
            
            }
              var displayedODTeachersListData: [DisplayedODTeachersListData]

        }
    }
}
