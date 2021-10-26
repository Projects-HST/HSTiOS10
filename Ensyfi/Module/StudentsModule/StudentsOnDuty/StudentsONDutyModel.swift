//
//  StudentsONDutyModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 23/10/21.
//


import Foundation
import UIKit

struct StudentsONDutyModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
            var user_type : String?
        }
        
        struct Response
        {
            var testObj: [StudentsONDutyModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedStudentsONDutyData
           {
               var od_for : String?
               var from_date : String?
               var to_date : String?
               var notes : String?
               var status : String?
               var student_id : String?
               var name : String?
            
            }
              var displayedStudentsONDutyData: [DisplayedStudentsONDutyData]

        }
    }
}
