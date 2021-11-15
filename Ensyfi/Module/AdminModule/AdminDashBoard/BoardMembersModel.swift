//
//  BoardMembersModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/09/21.
//

import Foundation
import UIKit

struct BoardMembersListModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
            var dynamic_db : String?
        }
        
        struct Response
        {
            var testObj: [BoardMembersListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedBoardMembersListData
           {
            var age : String?
            var name : String?
            var sex : String?
            var teacher_id : String?
            }
              var displayedBoardMembersListData: [DisplayedBoardMembersListData]

        }
    }
}
