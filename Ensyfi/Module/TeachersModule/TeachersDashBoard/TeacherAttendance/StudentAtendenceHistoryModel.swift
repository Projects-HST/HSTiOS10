//
//  StudentAtendenceHistoryModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 08/10/21.
//

import Foundation
import UIKit

struct AttendanceHistory{
    
    var Atendstatus : String?
    var takenBy : String?
    var aVal : String?
    var absDate : String?
    var attendId : String?
    var attendPeriod : String?
    var classId : String?
    var createdAt : String?
    var iD : String?
    var serverAtendId : String?
    var studentId : String?
    var status : String?
    var syncStatus : String?
    var updatedAt : String?
    var updatedBy : String?
    
    init(atendStatus:String,TakeBy:String,A_val:String,AbsentDate:String,AtendId:String,AtendPeriod:String,ClasID:String,CretedAt:String,ID:String,ServerAtendID:String,Status:String,SyncStatus:String,UpdatedAT:String,UpdatedBY:String,StudentID:String){
        
        self.Atendstatus = atendStatus
        self.takenBy = TakeBy
        self.aVal = A_val
        self.absDate = AbsentDate
        self.studentId = StudentID
        self.attendId = AtendId
        self.attendPeriod = AtendPeriod
        self.classId = ClasID
        self.createdAt = CretedAt
        self.iD = ID
        self.serverAtendId = ServerAtendID
        self.status = Status
        self.syncStatus = SyncStatus
        self.updatedAt = UpdatedAT
        self.updatedBy = UpdatedBY
    }
}
