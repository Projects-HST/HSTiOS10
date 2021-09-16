//
//  GroupSectionListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 16/09/21.
//
import Foundation
import UIKit

struct GroupSectionListModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
        }
        
        struct Response
        {
            var testObj: [GroupSectionListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedGroupSectionListData
           {
            var class_sec_id : String?
            var class_section : String?
           
            }
              var displayedGroupSectionListData: [DisplayedGroupSectionListData]

        }
    }
}
