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
    
    func callAPIExamResults(class_id:String, onSuccess successCallback: ((_ resp: [ExamResultsModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
        let url = APIURL.base_URL  + APIFunctionName.examListUrl
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
        let url = APIURL.base_URL  + APIFunctionName.examsListUrl
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
            
          if let responseDict = responseObject["eventDetails"].arrayObject
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
}
