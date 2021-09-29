//
//  BoardMembersModels.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/09/21.
//

import Foundation

class BoardMembersListModels : NSObject {
    
    var age : String?
    var name : String?
    var sex : String?
    var teacher_id : String?
    
     // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
    {
        if let data = dict["age"] as? String {
        self.age = data
        }
        if let data = dict["name"] as? String {
        self.name = data
        }
        if let data = dict["sex"] as? String {
        self.sex = data
        }
        if let data = dict["teacher_id"] as? String {
        self.teacher_id = data
        }
  }
    
     // MARK: Class Method
  class func build(_ dict: [String: AnyObject]) -> BoardMembersListModels{
       let model = BoardMembersListModels()
       model.loadFromDictionary(dict)
       return model
    }
}
