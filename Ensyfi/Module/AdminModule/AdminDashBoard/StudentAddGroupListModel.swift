//
//  StudentAddGroupListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 16/09/21.
//
import Foundation
import UIKit

struct StudentGroupAddListModel{
    struct Fetch {
        
        struct Request
        {
            var group_id : String?
            var group_user_type : String?
            var class_id : String?
            var dynamic_db : String?
        }
        
        struct Response
        {
            var testObj: [StudentGroupAddListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedStudentGroupAddListData
           {
            var Status : String?
            var user_id : String?
            var name : String?
            }
              var displayedStudentGroupAddListData: [DisplayedStudentGroupAddListData]

        }
    }
}
