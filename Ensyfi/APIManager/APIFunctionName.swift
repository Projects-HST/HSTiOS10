//
//  APIFunctionName.swift
//  Ensyfi
//
//  Created by HappysanziMac on 19/08/21.
//

import Foundation
import UIKit

struct APIFunctionName {
   
    static let instituteLoginUrl = "/apimain/login/"
    static let forgotPswdUrl = "/apimain/forgot_Password/"
    static let studentClassUrl = "/apiadmin/get_all_classes/"
    static let sectionListUrl = "/apiadmin/get_all_sections/"
    static let studentsListUrl = "/apiadmin/get_all_students_in_classes/"
    static let studentsDetailsUrl = "/apiadmin/get_student_details/"
    static let HomeWorkTestListUrl = "/apistudent/disp_Homework/"
    static let classTestDetailsUrl = "/apistudent/get_classtest_details/"
    static let studentAttendanceUrl = "/apistudent/disp_Attendence/"
    static let examListUrl = "/apistudent/disp_Exams/"
    static let getParentDetailsUrl = "/apiadmin/get_parent_details/"
    
    
//    Teachers
    static let teacherListUrl = "/apiadmin/get_all_teachers/"
    static let teacherDetailUrl = "/apiadmin/get_teacher_class_details/"
    
//    clasess
    static let clasForTeacherListurl = "/apiadmin/list_of_teachers_for_class/"
    
//    exams
    static let examsListUrl = "/apiadmin/list_of_exams_class/"
    
//    Events
    static let eventsListUrl = "/apimain/disp_Events/"
    static let subEventsListUrl = "/apimain/disp_subEvents/"
    
//    Circulars
    static let adminCircularListUrl = "/apiadmin/get_all_circular_view/"
    
//    Fees
    static let feesClassListUrl = "/apiadmin/get_fees_details/"
    
//    OnDuty
    static let ODstudentsListUrl = "/apiadmin/get_students_od_view/"
    static let ODteachersListUrl = "/apiadmin/get_teachers_od_view/"
    static let ODApprovalUrl = "/apiadmin/update_teachers_od/"
    
//    Groups
    static let groupListUrl = "/apiadmin/list_groupmaster/"
    static let techerIDnameListUrl = "/apiadmin/get_allteachersuserid/"
    static let createGroupUrl = "/apiadmin/add_groupmaster/"
    static let groupMembersListUrl = "/apiadmin/list_gn_members/"
    static let updategroupUrl = "/apiadmin/update_groupmaster/"
}
