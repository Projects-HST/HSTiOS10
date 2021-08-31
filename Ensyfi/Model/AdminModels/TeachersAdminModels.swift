//
//  TeachersAdminModels.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/08/21.
//

import Foundation


class TeachersListModels : NSObject {
    
var class_id : String?
var class_name : String?
    
     // MARK: Instance Method
func loadFromDictionary(_ dict: [String: AnyObject])
    {
    if let data = dict["class_id"] as? String {
        self.class_id = data
    }
    if let data = dict["class_name"] as? String {
        self.class_name = data
    }
}
    
     // MARK: Class Method
class func build(_ dict: [String: AnyObject]) -> TeachersListModels{
    let model = TeachersListModels()
    model.loadFromDictionary(dict)
    return model
 }
}

