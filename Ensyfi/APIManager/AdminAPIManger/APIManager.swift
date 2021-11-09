//
//  APIManager.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 31/08/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIManager: NSObject {

    static let instance = APIManager()
    var manager: SessionManager {
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 3.0
        return manager
    }

    enum RequestMethod {
        case get
        case post
    }

    func createRequest (_ url: String,method: HTTPMethod,headers: [String: String]?,parameters: [String:String]?,onSuccess successCallback: ((JSON) -> Void)?,onFailure failureCallback: ((String) -> Void)?)
      {
      manager.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (responseObject) -> Void in
        print(responseObject)

        if responseObject.result.isSuccess
        {
            let resJson = JSON(responseObject.result.value!)
            successCallback?(resJson)
        }

        if responseObject.result.isFailure
        {
           let error : Error = responseObject.result.error!
            failureCallback!(error.localizedDescription)
        }
      }
    }

    func createRequestGet (_ url: String,method: HTTPMethod,headers: [String: String]?,parameters: [String:String]?,onSuccess successCallback: ((JSON) -> Void)?,onFailure failureCallback: ((String) -> Void)?)
      {
      manager.request(url, method: .get, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (responseObject) -> Void in
        print(responseObject)

        if responseObject.result.isSuccess
        {
            let resJson = JSON(responseObject.result.value!)
            successCallback?(resJson)
        }

        if responseObject.result.isFailure
        {
           let error : Error = responseObject.result.error!
            failureCallback!(error.localizedDescription)
        }
      }
    }

    func callAPILogin(institue_id:String,onSuccess successCallback: ((_ login: LoginModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
   // Build URL
        let url = APIURL.appBase_URL
   // Set Parameters
         let parameters: Parameters =  ["InstituteID": institue_id]
   // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
   // Create dictionary
         print(responseObject)

         guard let msg = responseObject["msg"].string, msg == "Institute code is valid." else{
         failureCallback?(responseObject["msg"].string!)
         return
       }
          let institute_code =  responseObject["userData"]["institute_code"].string
          let institute_id =  responseObject["userData"]["institute_id"].string
          let institute_logo =  responseObject["userData"]["institute_logo"].string
          let institute_name =  responseObject["userData"]["institute_name"].string
          let status =  responseObject["status"].string

          let sendToModel = LoginModels()

          sendToModel.institute_code = institute_code
          sendToModel.institute_id = institute_id
          sendToModel.institute_logo = institute_logo
          sendToModel.institute_name = institute_name
          sendToModel.status = status
          sendToModel.msg = msg

          successCallback?(sendToModel)
       },
         onFailure: {(errorMessage: String) -> Void in
         failureCallback?(errorMessage)
       }
     )
  }

    func callAPIInstituteLogin(institue_code:String,userName:String,password:String,onSuccess successCallback: ((_ login: InstituteLoginModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
   // Build URL
        let url = APIURL.base_URL + APIFunctionName.instituteLoginUrl
   // Set Parameters
         let parameters: Parameters =  ["username": userName,"password": password]
        print(parameters)
        print(url)
   // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
   // Create dictionary
         print(responseObject)

         guard let msg = responseObject["msg"].string, msg == "User loggedIn successfully" else {
         failureCallback?(responseObject["msg"].string!)
         return
       }
          let name =  responseObject["userData"]["name"].string
          let user_id =  responseObject["userData"]["user_id"].string
          let user_name =  responseObject["userData"]["user_name"].string
          let user_pic =  responseObject["userData"]["user_pic"].string
          let user_type =  responseObject["userData"]["user_type"].string
          let user_type_name =  responseObject["userData"]["user_type_name"].string
          let status =  responseObject["status"].string
          let year_id =  responseObject["year_id"].string

          let sendToModel = InstituteLoginModels()

          sendToModel.name = name
          sendToModel.user_id = user_id
          sendToModel.user_name = user_name
          sendToModel.user_pic = user_pic
          sendToModel.user_type = user_type
          sendToModel.user_type_name = user_type_name
          sendToModel.status = status
          sendToModel.year_id = year_id
          sendToModel.msg = msg

          successCallback?(sendToModel)
       },
         onFailure: {(errorMessage: String) -> Void in
         failureCallback?(errorMessage)
       }
     )
  }

    func callAPIForgotPassword(userName:String,onSuccess successCallback: ((_ login: ForgotPasswordModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
   // Build URL
        let url = APIURL.base_URL + APIFunctionName.forgotPswdUrl
   // Set Parameters
         let parameters: Parameters =  ["user_name": userName]
        print(parameters)
   // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
   // Create dictionary
         print(responseObject)

         guard let status = responseObject["status"].string, status == "sucess" else {
         failureCallback?(responseObject["msg"].string!)
         return
       }
          let msg = responseObject["msg"].string

          let sendToModel = ForgotPasswordModels()

          sendToModel.status = status
          sendToModel.msg = msg

          successCallback?(sendToModel)
       },
         onFailure: {(errorMessage: String) -> Void in
         failureCallback?(errorMessage)
       }
     )
  }

    func callAPIClassView(user_id:String, onSuccess successCallback: ((_ resp: [ClassViewModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = "http://happysanz.in/ensyfi/apiadmin/get_all_classes/"
         // Set Parameters
        print(url)
         let parameters: Parameters =  ["": ""]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)
         print(url)
           guard let status = responseObject["status"].string, status == "success" else {
               failureCallback?(responseObject["msg"].string!)
               return
         }
          if let responseDict = responseObject["data"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [ClassViewModels]()
                  for item in toModel {
                      let single = ClassViewModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
       )
    }

    func callAPISectionList(class_id:String, onSuccess successCallback: ((_ resp: [SectionListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = "http://happysanz.in/ensyfi/apiadmin/get_all_sections/"
         // Set Parameters
         let parameters: Parameters =  ["class_id": class_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else {
               failureCallback?(responseObject["msg"].string!)
               return
         }
          if let responseDict = responseObject["data"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [SectionListModels]()
                  for item in toModel {
                      let single = SectionListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
       )
    }

    func callAPIStudentsList(class_id:String,section_id:String, onSuccess successCallback: ((_ resp: [StudentsListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL  + APIFunctionName.studentsListUrl
         // Set Parameters
        let parameters: Parameters = ["class_id": class_id,"section_id":section_id]
        print(class_id)
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"].string!)
               return
         }
          if let responseDict = responseObject["data"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [StudentsListModels]()
                  for item in toModel {
                      let single = StudentsListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
             } else {
              failureCallback?("An error has occured.")
           }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
   }

    func callAPITeachersList(user_id:String, onSuccess successCallback: ((_ resp: [TeachersListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL  + APIFunctionName.teacherListUrl
         // Set Parameters
        let parameters: Parameters = ["":""]
        print(user_id)
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"].string!)
               return
         }
          if let responseDict = responseObject["data"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [TeachersListModels]()
                  for item in toModel {
                      let single = TeachersListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
             } else {
              failureCallback?("An error has occured.")
           }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
   }

    func callAPIStudentDetails(student_id:String, onSuccess successCallback: ((_ resp: [StudentDetailsModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL  + APIFunctionName.studentsDetailsUrl
         // Set Parameters
        let parameters: Parameters = ["student_id": student_id]
        print(parameters)
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"].string!)
               return
         }
          if let responseDict = responseObject["studentData"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [StudentDetailsModels]()
                  for item in toModel {
                      let single = StudentDetailsModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
             } else {
              failureCallback?("An error has occured.")
           }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
   }
    
    func callAPIHomeWorkTestList(class_id:String,hw_type:String, onSuccess successCallback: ((_ resp: [HomeWorkTestListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL  + APIFunctionName.HomeWorkTestListUrl
         // Set Parameters
        let parameters: Parameters = ["class_id": class_id,"hw_type":hw_type]
        print(hw_type)
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"].string!)
               return
         }
          if let responseDict = responseObject["homeworkDetails"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [HomeWorkTestListModels]()
                  for item in toModel {
                      let single = HomeWorkTestListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
             } else {
              failureCallback?("An error has occured.")
           }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
   }
    
    func callAPIHomeWorkDetails(class_id:String,hw_type:String, onSuccess successCallback: ((_ resp: [HomeWorkDetailsModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL  + APIFunctionName.HomeWorkTestListUrl
         // Set Parameters
        let parameters: Parameters = ["class_id": class_id,"hw_type":hw_type]
        print(hw_type)
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"].string!)
               return
         }
          if let responseDict = responseObject["homeworkDetails"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [HomeWorkDetailsModels]()
                  for item in toModel {
                      let single = HomeWorkDetailsModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
             } else {
              failureCallback?("An error has occured.")
           }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
   }
    
    func callAPIStudentAttendance(class_id:String,stud_id:String, onSuccess successCallback: ((_ resp: [StudentAttendanceModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL  + APIFunctionName.studentAttendanceUrl
         // Set Parameters
        let parameters: Parameters = ["class_id": class_id,"stud_id":stud_id]
      
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"].string!)
               return
         }
            GlobalVariables.shared.leave_days = responseObject["attendenceHistory"]["leave_days"].int!
            GlobalVariables.shared.absent_days = responseObject["attendenceHistory"]["absent_days"].int!
            GlobalVariables.shared.od_days = responseObject["attendenceHistory"]["od_days"].int!
            GlobalVariables.shared.total_working_days = responseObject["attendenceHistory"]["total_working_days"].int!
            GlobalVariables.shared.present_days = responseObject["attendenceHistory"]["present_days"].int!
            
          if let responseDict = responseObject["attendenceDetails"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [StudentAttendanceModels]()
                  for item in toModel {
                      let single = StudentAttendanceModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
             } else {
              failureCallback?("An error has occured.")
           }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
   }
    
    func callAPIExamResults(class_id:String,section_id:String, onSuccess successCallback: ((_ resp: [ExamResultsModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
//        let url = APIURL.base_URL  + APIFunctionName.examsRsultsListUrl
         // Set Parameters
        let parameters: Parameters
        var url = String()
        
        if section_id == "Students" {
            parameters = ["class_id": class_id]
            url = APIURL.base_URL  + APIFunctionName.studentExamReslutListUrl
        }
        else {
           parameters = ["class_id": class_id,"section_id": section_id]
            url = APIURL.base_URL  + APIFunctionName.examsRsultsListUrl
        }
//
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"].string!)
               return
         }
            
          if let responseDict = responseObject["Exams"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [ExamResultsModels]()
                  for item in toModel {
                      let single = ExamResultsModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
             } else {
              failureCallback?("An error has occured.")
           }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
   }
    
    func callAPITeacherDetails(teacher_id:String, onSuccess successCallback: ((_ resp: [TeacherDetailsModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL  + APIFunctionName.teacherDetailUrl
         // Set Parameters
        let parameters: Parameters = ["teacher_id": teacher_id]
        print(parameters)
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"].string!)
               return
         }
          if let responseDict = responseObject["teacherProfile"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [TeacherDetailsModels]()
                  for item in toModel {
                      let single = TeacherDetailsModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
             } else {
              failureCallback?("An error has occured.")
           }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
   }
  
    func callAPIClassForTeacherList(class_id:String,section_id:String, onSuccess successCallback: ((_ resp: [ClassForTeacherListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL  + APIFunctionName.clasForTeacherListurl
         // Set Parameters
        let parameters: Parameters = ["class_id":class_id,"section_id":section_id]
        print(class_id)
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"].string!)
               return
         }
          if let responseDict = responseObject["data"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [ClassForTeacherListModels]()
                  for item in toModel {
                      let single = ClassForTeacherListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
             } else {
              failureCallback?("An error has occured.")
           }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
   }
    
    func callAPIExamList(class_id:String,section_id:String,onSuccess successCallback: ((_ resp: [ExamListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL  + APIFunctionName.examsRsultsListUrl
         // Set Parameters
        let parameters: Parameters = ["class_id": class_id,"section_id": section_id]
      
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"].string!)
               return
         }
            
          if let responseDict = responseObject["Exams"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [ExamListModels]()
                  for item in toModel {
                      let single = ExamListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
             } else {
              failureCallback?("An error has occured.")
           }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
        
   }
    
    func callAPIEventsList(class_id:String,section_id:String,onSuccess successCallback: ((_ resp: [EventsListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL  + APIFunctionName.eventsListUrl
         // Set Parameters
        let parameters: Parameters = ["class_id": class_id]
      
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"].string!)
               return
         }
            
          if let responseDict = responseObject["eventDetails"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [EventsListModels]()
                  for item in toModel {
                      let single = EventsListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
             } else {
              failureCallback?("An error has occured.")
           }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
   }
    
    func callAPISubEvents(event_id:String,onSuccess successCallback: ((_ resp: [SubEventsModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL  + APIFunctionName.subEventsListUrl
         // Set Parameters
        let parameters: Parameters = ["event_id": event_id]
      
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"].string!)
               return
         }
          if let responseDict = responseObject["subeventDetails"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [SubEventsModels]()
                  for item in toModel {
                      let single = SubEventsModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
             } else {
              failureCallback?("An error has occured.")
           }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
   }
    
    func callAPICircularsList(user_id:String,onSuccess successCallback: ((_ resp: [CircularsListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL  + APIFunctionName.adminCircularListUrl
         // Set Parameters
        let parameters: Parameters = ["user_id": user_id]
      
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"].string!)
               return
         }
            
          if let responseDict = responseObject["circularDetails"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [CircularsListModels]()
                  for item in toModel {
                      let single = CircularsListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
             } else {
              failureCallback?("An error has occured.")
           }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
   }
    
    func callAPIExamTimeTable(class_id:String,exam_id:String,onSuccess successCallback: ((_ resp: [ExamTimeTableModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL  + APIFunctionName.examDetailsTableListUrl
         // Set Parameters
        let parameters: Parameters = ["class_id": class_id,"exam_id": exam_id]
      
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"].string!)
               return
         }
            
          if let responseDict = responseObject["examDetails"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [ExamTimeTableModels]()
                  for item in toModel {
                      let single = ExamTimeTableModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
             } else {
              failureCallback?("An error has occured.")
           }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
   }
//
    
    func callAPIFatherDeatils(admission_id:String,onSuccess successCallback: ((_ login: FatherDeatilsModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
   // Build URL
        let url = APIURL.base_URL + APIFunctionName.getParentDetailsUrl
   // Set Parameters
         let parameters: Parameters =  ["admission_id": admission_id]
        print(parameters)
        print(url)
   // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
   // Create dictionary
         print(responseObject)

         guard let msg = responseObject["msg"].string, msg == "userdetailfound" else {
         failureCallback?(responseObject["msg"].string!)
         return
       }
          let email =  responseObject["parentProfile"]["fatherProfile"]["email"].string
          let id =  responseObject["parentProfile"]["fatherProfile"]["id"].string
          let relationship =  responseObject["parentProfile"]["fatherProfile"]["relationship"].string
          let office_phone =  responseObject["parentProfile"]["fatherProfile"]["office_phone"].string
          let home_phone =  responseObject["parentProfile"]["fatherProfile"]["home_phone"].string
          let mobile =  responseObject["parentProfile"]["fatherProfile"]["mobile"].string
          let home_address = responseObject["parentProfile"]["fatherProfile"]["home_address"].string
          let user_pic =  responseObject["parentProfile"]["fatherProfile"]["user_pic"].string
          let name =  responseObject["parentProfile"]["fatherProfile"]["name"].string
          let occupation =  responseObject["parentProfile"]["fatherProfile"]["occupation"].string
          let income = responseObject["parentProfile"]["fatherProfile"]["income"].string
          let status =  responseObject["status"].string

          let sendToModel = FatherDeatilsModels()

          sendToModel.email = email
          sendToModel.id = id
          sendToModel.relationship = relationship
          sendToModel.office_phone = office_phone
          sendToModel.mobile = mobile
          sendToModel.home_phone = home_phone
          sendToModel.home_address = home_address
          sendToModel.name = name
          sendToModel.user_pic = user_pic
          sendToModel.occupation = occupation
          sendToModel.income = income
          sendToModel.status = status
          sendToModel.msg = msg

          successCallback?(sendToModel)
       },
         onFailure: {(errorMessage: String) -> Void in
         failureCallback?(errorMessage)
       }
     )
  }
    
    func callAPIMotherDetails(admission_id:String,onSuccess successCallback: ((_ login: MotherDetailsModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
   // Build URL
        let url = APIURL.base_URL + APIFunctionName.getParentDetailsUrl
   // Set Parameters
         let parameters: Parameters =  ["admission_id": admission_id]
        print(parameters)
        print(url)
   // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
   // Create dictionary
         print(responseObject)

         guard let msg = responseObject["msg"].string, msg == "userdetailfound" else {
         failureCallback?(responseObject["msg"].string!)
         return
       }
          let email =  responseObject["parentProfile"]["motherProfile"]["email"].string
          let id =  responseObject["parentProfile"]["motherProfile"]["id"].string
          let relationship =  responseObject["parentProfile"]["motherProfile"]["relationship"].string
          let office_phone =  responseObject["parentProfile"]["motherProfile"]["office_phone"].string
          let home_phone =  responseObject["parentProfile"]["motherProfile"]["home_phone"].string
          let mobile =  responseObject["parentProfile"]["motherProfile"]["mobile"].string
          let home_address = responseObject["parentProfile"]["motherProfile"]["home_address"].string
          let user_pic =  responseObject["parentProfile"]["motherProfile"]["user_pic"].string
          let name =  responseObject["parentProfile"]["motherProfile"]["name"].string
          let occupation =  responseObject["parentProfile"]["motherProfile"]["occupation"].string
          let income = responseObject["parentProfile"]["motherProfile"]["income"].string
          let status =  responseObject["status"].string

          let sendToModel = MotherDetailsModels()

          sendToModel.email = email
          sendToModel.id = id
          sendToModel.relationship = relationship
          sendToModel.office_phone = office_phone
          sendToModel.mobile = mobile
          sendToModel.home_phone = home_phone
          sendToModel.home_address = home_address
          sendToModel.name = name
          sendToModel.user_pic = user_pic
          sendToModel.occupation = occupation
          sendToModel.income = income
          sendToModel.status = status
          sendToModel.msg = msg

          successCallback?(sendToModel)
       },
         onFailure: {(errorMessage: String) -> Void in
         failureCallback?(errorMessage)
       }
     )
  }
    
    func callAPIGuardianDetails(admission_id:String,onSuccess successCallback: ((_ login: GuardianDetailsModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
   // Build URL
        let url = APIURL.base_URL + APIFunctionName.getParentDetailsUrl
   // Set Parameters
         let parameters: Parameters =  ["admission_id": admission_id]
        print(parameters)
        print(url)
   // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
   // Create dictionary
         print(responseObject)

         guard let msg = responseObject["msg"].string, msg == "userdetailfound" else {
         failureCallback?(responseObject["msg"].string!)
         return
       }
          let email =  responseObject["parentProfile"]["guardianProfile"]["email"].string
          let id =  responseObject["parentProfile"]["guardianProfile"]["id"].string
          let relationship =  responseObject["parentProfile"]["guardianProfile"]["relationship"].string
          let office_phone =  responseObject["parentProfile"]["guardianProfile"]["office_phone"].string
          let home_phone =  responseObject["parentProfile"]["guardianProfile"]["home_phone"].string
          let mobile =  responseObject["parentProfile"]["guardianProfile"]["mobile"].string
          let home_address = responseObject["parentProfile"]["guardianProfile"]["home_address"].string
          let user_pic =  responseObject["parentProfile"]["guardianProfile"]["user_pic"].string
          let name =  responseObject["parentProfile"]["guardianProfile"]["name"].string
          let occupation =  responseObject["parentProfile"]["guardianProfile"]["occupation"].string
          let income = responseObject["parentProfile"]["guardianProfile"]["income"].string
          let status =  responseObject["status"].string

          let sendToModel = GuardianDetailsModels()

          sendToModel.email = email
          sendToModel.id = id
          sendToModel.relationship = relationship
          sendToModel.office_phone = office_phone
          sendToModel.mobile = mobile
          sendToModel.home_phone = home_phone
          sendToModel.home_address = home_address
          sendToModel.name = name
          sendToModel.user_pic = user_pic
          sendToModel.occupation = occupation
          sendToModel.income = income
          sendToModel.status = status
          sendToModel.msg = msg

          successCallback?(sendToModel)
       },
         onFailure: {(errorMessage: String) -> Void in
         failureCallback?(errorMessage)
       }
     )
  }
    
    func callAPIFeesList(class_id:String,section_id:String, onSuccess successCallback: ((_ resp: [FeesListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL + APIFunctionName.feesListUrl
         // Set Parameters
        print(url)
         let parameters: Parameters =  ["class_id": class_id,"section_id": section_id]
        print(parameters)
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)
         print(url)
           guard let status = responseObject["status"].string, status == "success" else {
               failureCallback?(responseObject["msg"].string!)
               return
         }
          if let responseDict = responseObject["data"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [FeesListModels]()
                  for item in toModel {
                      let single = FeesListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
       )
    }
    
    func callAPIFeesStatusList(class_id:String,section_id:String,fees_id:String, onSuccess successCallback: ((_ resp: [FeesStatusListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL + APIFunctionName.feesStatusListUrl
         // Set Parameters
        print(url)
         let parameters: Parameters =  ["class_id": class_id,"section_id": section_id,"fees_id": fees_id]
        print(parameters)
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)
         print(url)
           guard let status = responseObject["status"].string, status == "success" else {
               failureCallback?(responseObject["msg"].string!)
               return
         }
          if let responseDict = responseObject["data"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [FeesStatusListModels]()
                  for item in toModel {
                      let single = FeesStatusListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
          }
       )
    }
    
    func callAPIFeesSectionList(class_id:String, onSuccess successCallback: ((_ resp: [FeesSectionListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL + APIFunctionName.feesSectionListUrl
         // Set Parameters
        print(url)
         let parameters: Parameters =  ["class_id": class_id]
        print(parameters)
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)
         print(url)
           guard let status = responseObject["status"].string, status == "success" else {
               failureCallback?(responseObject["msg"].string!)
               return
         }
          if let responseDict = responseObject["data"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [FeesSectionListModels]()
                  for item in toModel {
                      let single = FeesSectionListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
       )
    }
    
    func callAPIODStudentsList(user_type:String, onSuccess successCallback: ((_ resp: [ODStudentsListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL  + APIFunctionName.ODstudentsListUrl
         // Set Parameters
        let parameters: Parameters = ["user_type": user_type]
       
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"].string!)
               return
         }
          if let responseDict = responseObject["ondutyDetails"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [ODStudentsListModels]()
                  for item in toModel {
                      let single = ODStudentsListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
             } else {
              failureCallback?("An error has occured.")
           }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
   }

    func callAPIODTeachersList(user_type:String, onSuccess successCallback: ((_ resp: [ODTeachersListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL  + APIFunctionName.ODteachersListUrl
         // Set Parameters
        let parameters: Parameters = ["user_type": user_type]
       
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"].string!)
               return
         }
          if let responseDict = responseObject["ondutyDetails"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [ODTeachersListModels]()
                  for item in toModel {
                      let single = ODTeachersListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
             } else {
              failureCallback?("An error has occured.")
           }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
   }
    
    func callAPIODApproval(status:String,od_id:String,onSuccess successCallback: ((_ login: ODApprovalModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
   // Build URL
        let url = APIURL.base_URL + APIFunctionName.ODApprovalUrl
   // Set Parameters
         let parameters: Parameters =  ["status": status,"od_id": od_id]
        print(parameters)
   // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
   // Create dictionary
         print(responseObject)

         guard let status = responseObject["status"].string, status == "sucess" else {
         failureCallback?(responseObject["msg"].string!)
         return
       }
          let msg = responseObject["msg"].string

          let sendToModel = ODApprovalModels()

          sendToModel.status = status
          sendToModel.msg = msg

          successCallback?(sendToModel)
       },
         onFailure: {(errorMessage: String) -> Void in
         failureCallback?(errorMessage)
       }
     )
  }
    
    func callAPIGroupList(user_id:String,user_type:String,onSuccess successCallback: ((_ resp: [GroupListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL  + APIFunctionName.groupListUrl
         // Set Parameters
        let parameters: Parameters = ["user_id": user_id]
      
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"].string!)
               return
         }
          if let responseDict = responseObject["groupList"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [GroupListModels]()
                  for item in toModel {
                      let single = GroupListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
             } else {
              failureCallback?("An error has occured.")
           }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
   }
    
    func callAPITeacherListID(user_id:String,user_type:String,onSuccess successCallback: ((_ resp: [TeacherListIDModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL  + APIFunctionName.techerIDnameListUrl
         // Set Parameters
        let parameters: Parameters = ["user_id": user_id]
      
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"].string!)
               return
         }
          if let responseDict = responseObject["teacherList"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [TeacherListIDModels]()
                  for item in toModel {
                      let single = TeacherListIDModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
             } else {
              failureCallback?("An error has occured.")
           }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
   }
    
    func callAPICreateGroup(user_id:String,group_title:String,group_lead_id:String,status:String,onSuccess successCallback: ((_ login: CreateGroupModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
   // Build URL
        let url = APIURL.base_URL + APIFunctionName.createGroupUrl
   // Set Parameters
         let parameters: Parameters =  ["user_id": user_id,"group_title": group_title,"group_lead_id": group_lead_id,"status": status]
        print(parameters)
   // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
   // Create dictionary
         print(responseObject)

         guard let status = responseObject["status"].string, status == "success" else {
         failureCallback?(responseObject["msg"].string!)
         return
       }
          let msg = responseObject["msg"].string

          let sendToModel = CreateGroupModels()

          sendToModel.status = status
          sendToModel.msg = msg

          successCallback?(sendToModel)
       },
         onFailure: {(errorMessage: String) -> Void in
         failureCallback?(errorMessage)
       }
     )
  }
    
    func callAPIGroupMembersList(group_id:String,onSuccess successCallback: ((_ resp: [GroupMembersListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL  + APIFunctionName.groupMembersListUrl
         // Set Parameters
        let parameters: Parameters = ["group_id": group_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"].string!)
               return
         }
          if let responseDict = responseObject["memberList"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [GroupMembersListModels]()
                  for item in toModel {
                      let single = GroupMembersListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
             } else {
              failureCallback?("An error has occured.")
           }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
   }
    
    func callAPIUpdateGroup(user_id:String,group_title:String,group_lead_id:String,status:String,group_id:String,onSuccess successCallback: ((_ login: UpdateGroupModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
   // Build URL
        let url = APIURL.base_URL + APIFunctionName.updategroupUrl
   // Set Parameters
        let parameters: Parameters =  ["user_id": user_id,"group_title": group_title,"group_lead_id": group_lead_id,"status": status,"group_id":group_id]
        print(parameters)
   // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
   // Create dictionary
         print(responseObject)

         guard let status = responseObject["status"].string, status == "success" else {
         failureCallback?(responseObject["msg"].string!)
         return
       }
          let msg = responseObject["msg"].string
          let sendToModel = UpdateGroupModels()

          sendToModel.status = status
          sendToModel.msg = msg

          successCallback?(sendToModel)
       },
         onFailure: {(errorMessage: String) -> Void in
         failureCallback?(errorMessage)
       }
     )
  }
    
    func callAPIRoleList(user_id:String,onSuccess successCallback: ((_ resp: [RoleListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL  + APIFunctionName.roleListUrl
         // Set Parameters
        let parameters: Parameters = ["user_id": user_id]
      
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"].string!)
               return
         }
          if let responseDict = responseObject["roleList"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [RoleListModels]()
                  for item in toModel {
                      let single = RoleListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
             } else {
              failureCallback?("An error has occured.")
           }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
   }
    
    func callAPIGroupSectionList(user_id:String,onSuccess successCallback: ((_ resp: [GroupSectionListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL  + APIFunctionName.groupSectionUrl
         // Set Parameters
        let parameters: Parameters = ["user_id": user_id]
      
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"].string!)
               return
         }
          if let responseDict = responseObject["listClasssection"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [GroupSectionListModels]()
                  for item in toModel {
                      let single = GroupSectionListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
             } else {
              failureCallback?("An error has occured.")
           }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
   }
    
    func callAPIStudentGroupAddList(group_id:String,group_user_type:String,class_id:String,onSuccess successCallback: ((_ resp: [StudentGroupAddListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL  + APIFunctionName.studentListGroupAddUrl
         // Set Parameters
        let parameters: Parameters = ["group_id": group_id,"group_user_type": group_user_type,"class_id": class_id]
      
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)

           guard let status = responseObject["status"].string, status == "sucess" else{
               failureCallback?(responseObject["msg"].string!)
               return
         }
          if let responseDict = responseObject["gnMemberlist"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [StudentGroupAddListModels]()
                  for item in toModel {
                      let single = StudentGroupAddListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
             } else {
              failureCallback?("An error has occured.")
           }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
   }
    
    func callAPIStaffGroupAddList(group_id:String,group_user_type:String,class_id:String,onSuccess successCallback: ((_ resp: [StaffGroupAddListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL  + APIFunctionName.staffListGroupAddUrl
         // Set Parameters
        let parameters: Parameters = ["group_id": group_id,"group_user_type": group_user_type]
      print(parameters)
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)

           guard let status = responseObject["status"].string, status == "sucess" else{
               failureCallback?(responseObject["msg"].string!)
               return
         }
          if let responseDict = responseObject["gnMemberlist"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [StaffGroupAddListModels]()
                  for item in toModel {
                      let single = StaffGroupAddListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
             } else {
              failureCallback?("An error has occured.")
           }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
   }
    
    func callAPIAddGroupMember(user_id:String,group_member_id:String,group_user_type:String,status:String,group_id:String,onSuccess successCallback: ((_ login: AddGroupMemberModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
   // Build URL
        let url = APIURL.base_URL + APIFunctionName.AddGroupMemberUrl
   // Set Parameters
         let parameters: Parameters =  ["user_id": user_id,"group_member_id": group_member_id,"group_user_type": group_user_type,"status": status,"group_id": group_id]
        print(parameters)
   // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
   // Create dictionary
         print(responseObject)

         guard let status = responseObject["status"].string, status == "success" else {
         failureCallback?(responseObject["msg"].string!)
         return
        }
          let msg = responseObject["msg"].string

          let sendToModel = AddGroupMemberModels()

          sendToModel.status = status
          sendToModel.msg = msg

          successCallback?(sendToModel)
         },
         onFailure: {(errorMessage: String) -> Void in
         failureCallback?(errorMessage)
         }
      )
   }
    
    func callAPILeavesList(user_id:String,onSuccess successCallback: ((_ resp: [LeavesListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL  + APIFunctionName.leaveListUrl
         // Set Parameters
        let parameters: Parameters = ["user_id": user_id]
      
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"].string!)
               return
         }
            
          if let responseDict = responseObject["leaveDetails"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [LeavesListModels]()
                  for item in toModel {
                      let single = LeavesListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
             } else {
              failureCallback?("An error has occured.")
           }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
   }
    
    func callAPILeaveApproval(status:String,leave_id:String,onSuccess successCallback: ((_ login: LeaveApprovalModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
   // Build URL
        let url = APIURL.base_URL + APIFunctionName.leaveApprovalUrl
   // Set Parameters
         let parameters: Parameters =  ["status": status,"leave_id": leave_id]
        print(parameters)
   // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
   // Create dictionary
         print(responseObject)

         guard let status = responseObject["status"].string, status == "sucess" else {
         failureCallback?(responseObject["msg"].string!)
         return
       }
          let msg = responseObject["msg"].string

          let sendToModel = LeaveApprovalModels()

          sendToModel.status = status
          sendToModel.msg = msg

          successCallback?(sendToModel)
       },
         onFailure: {(errorMessage: String) -> Void in
         failureCallback?(errorMessage)
       }
     )
  }
    
    func callAPIClass_Section(user_id:String, onSuccess successCallback: ((_ resp: [Class_SectionModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL + APIFunctionName.classSectionListUrl
         // Set Parameters
        print(url)
         let parameters: Parameters =  ["": ""]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)
         print(url)
           guard let status = responseObject["status"].string, status == "success" else {
               failureCallback?(responseObject["msg"].string!)
               return
         }
          if let responseDict = responseObject["classList"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [Class_SectionModels]()
                  for item in toModel {
                      let single = Class_SectionModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
       )
    }
    
    func callAPIClassAttendanceList(date:String,class_ids:String, onSuccess successCallback: ((_ resp: [ClassAttendanceListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL + APIFunctionName.classAttendanceListUrl
         // Set Parameters
        print(url)
        let parameters: Parameters =  ["date":date,"class_ids":class_ids ]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)
         print(url)
           guard let status = responseObject["status"].string, status == "success" else {
               failureCallback?(responseObject["msg"].string!)
               return
         }
          if let responseDict = responseObject["attendence_list"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [ClassAttendanceListModels]()
                  for item in toModel {
                      let single = ClassAttendanceListModels.build(item)
                      data.append(single)
            }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
       )
    }
    
    func callAPIChangePassword(user_id:String,old_password:String,password:String,onSuccess successCallback: ((_ login: ChangePasswordModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
   // Build URL
        let url = APIURL.base_URL + APIFunctionName.changePasswordUrl
   // Set Parameters
        let parameters: Parameters =  ["user_id": user_id,"old_password": old_password,"password": password]
        print(parameters)
   // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
   // Create dictionary
         print(responseObject)

         guard let status = responseObject["status"].string, status == "success" else {
         failureCallback?(responseObject["msg"].string!)
         return
       }
          let msg = responseObject["msg"].string
          let sendToModel = ChangePasswordModels()

          sendToModel.status = status
          sendToModel.msg = msg

          successCallback?(sendToModel)
       },
         onFailure: {(errorMessage: String) -> Void in
         failureCallback?(errorMessage)
       }
     )
  }
    
    func callAPIBoardMembersList(user_id:String, onSuccess successCallback: ((_ resp: [BoardMembersListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL  + APIFunctionName.boardMemListUrl
         // Set Parameters
        let parameters: Parameters = ["user_id": user_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"].string!)
               return
         }
          if let responseDict = responseObject["data"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [BoardMembersListModels]()
                  for item in toModel {
                      let single = BoardMembersListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
             } else {
              failureCallback?("An error has occured.")
           }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
   }
    
    func callAPISpecialClassList(user_id:String,from:String,onSuccess successCallback: ((_ resp: [SpecialClassListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {

        var url = String()
        let parameters: Parameters = ["user_id": user_id]
        
        if from == "Students" {
            url = APIURL.base_URL  + StudentAPIFunctionName.studentSpecialClasListUrl
        }
        else if from == "Admin" {
            url = APIURL.base_URL  + APIFunctionName.adminSpecialClassListUrl
        }
        else if from == "Teachers" {
            url = APIURL.base_URL  + TeachersAPIFunctionName.teacherSpecialClassListUrl
        }
        
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary

         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"].string!)
               return
         }
            
          if let responseDict = responseObject["special_details"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [SpecialClassListModels]()
                  for item in toModel {
                      let single = SpecialClassListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
             } else {
              failureCallback?("An error has occured.")
           }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
   }
}
