//
//  TeacherGroupTypeListMoswl.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/10/21.
//


import Foundation
import UIKit

struct TeacherGroupTypleListModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
            var user_type : String?
            
            
        }
        
        struct Response
        {
            var testObj: [TeacherGroupTypleListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedTeacherGroupTypleListData
           {
               var id : String?
               var group_title : String?
            
            }
              var displayedTeacherGroupTypleListData: [DisplayedTeacherGroupTypleListData]

        }
    }
}
