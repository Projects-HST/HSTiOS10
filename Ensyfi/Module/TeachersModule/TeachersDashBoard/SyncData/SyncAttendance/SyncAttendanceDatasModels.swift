//
//  SyncAttendanceDatasModels.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 09/11/21.
//

import Foundation
import UIKit

struct SyncAttendanceDatasModels{
    
    var ac_year : String?
    var attendence_period : String?
    var class_id : String?
    var class_total : String?
    var no_of_present : String?
    var no_of_absent : String?
    var created_at : String?
    var created_by : String?
    var status : String?
   
    
    init(Ac_year:String,Attendence_period:String,Class_id:String,Class_total:String,No_of_present:String,No_of_absent:String,Created_at:String,Created_by:String,Status:String){
        
        self.ac_year = Ac_year
        self.attendence_period = Attendence_period
        self.class_id = Class_id
        self.class_total = Class_total
        self.no_of_present = No_of_present
        self.no_of_absent = No_of_absent
        self.created_at = Created_at
        self.created_by = Created_by
        self.status = Status
    }
}
