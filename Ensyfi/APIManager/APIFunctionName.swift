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
}


















