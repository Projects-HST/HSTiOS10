//
//  TecaherAttendanceList.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 11/10/21.
//
import Foundation
import UIKit

struct DisplayAttenddanceListModel{
    struct Fetch {
        
        struct Request
        {
            var class_id : String?

        }
        
        struct Response
        {
            var testObj: [DisplayAttenddanceListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedDisplayAttenddanceListData
           {
            var ac_year : String?
            var at_id : String?
            var attendence_period : String?
            var class_id : String?
            var class_total : String?
            var created_at : String?
            var created_by : String?
            var name : String?
            var no_of_absent : String?
            var no_of_present : String?
            var sent_status : String?
            var status : String?
            var updated_at : String?
            var updated_by : String?
            
            }
              var displayedDisplayAttenddanceListData: [DisplayedDisplayAttenddanceListData]

        }
    }
}
