//
//  TeachersDashBoard.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/09/21.
//

import UIKit
import CoreData

class TeachersDashBoardVC: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context : NSManagedObjectContext?
    
    var class_name = String()
    var subjectArr = [String]()
    var classArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        context = appDelegate.persistentContainer.viewContext
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
        
        self.fetchData()
    }

    func fetchData(){

        subjectArr.removeAll()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ExamsDatas")

        do {
            let results = try context.fetch(fetchRequest)
            let  classSubData = results as! [ExamsDatas]

            for data in classSubData {
                subjectArr = data.exam_name as! [String]
                print(subjectArr)
                
//                classArr = data.class_name as! [String]
//                print(classArr)
            }
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
}
