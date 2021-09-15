//
//  FeesModels.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 08/09/21.
//

import Foundation


class FeesClassListModels : NSObject {
    
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
     class func build(_ dict: [String: AnyObject]) -> FeesClassListModels {
         let model = FeesClassListModels()
         model.loadFromDictionary(dict)
         return model
     }
}
