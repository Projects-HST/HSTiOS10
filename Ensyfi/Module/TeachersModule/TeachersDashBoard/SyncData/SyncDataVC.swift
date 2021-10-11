//
//  SyncDataVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 06/10/21.
//

import UIKit
import CoreData

protocol SyncAttendanceDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel:SyncAttendanceModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: SyncAttendanceModel.Fetch.ViewModel)
}

class SyncDataVC: UIViewController, SyncAttendanceDisplayLogic {
    
    @IBOutlet weak var attendanceCount: UILabel!
    @IBOutlet weak var assignmentCount: UILabel!
    @IBOutlet weak var classtestCount: UILabel!
    @IBOutlet weak var examMarkseCount: UILabel!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context : NSManagedObjectContext?
    var interactor: SyncAttendanceBusinessLogic?
    var classAtendance = [ClassAttendances]()
    var classAtendanceHistory = [ClassAttendanceHistory]()
    
    var syncArray = ["karan","Minesh","bhuganesh","karthi"]
    var syncArray1 = ["ios","andriod","design","design12"]
    var syncArray2 = ["cbe","udt","thek","slaem"]
    var arraysss = [String]()
    var id = [String]()
    var ac_year = [String]()
    var attendence_period = [String]()
    var no_of_absent = [String]()
    var created_at = [String]()
    var no_of_present = [String]()
    var created_by = [String]()
    var status = [String]()
    var class_id = [String]()
    var class_total = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        context = appDelegate.persistentContainer.viewContext
        self.fetchClassAttendanceHistory()
        self.fetchClassAttendance()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup()
    {
        let viewController = self
        let interactor = SyncAttendanceInteractor()
        let presenter = SyncAttendancePresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    @IBAction func attendanceSync(_ sender: Any) {
        
        for data in classAtendance {
            
            let id = data.id
            let ac_year = data.ac_year
            let attendence_period = data.attendence_period
            let class_id = data.class_id
            let class_total = data.class_total
            let no_of_present = data.no_of_present
            let no_of_absent = data.no_of_absent
            let created_at = data.created_at
            let created_by = data.created_by
            let status = data.status
            
            self.id.append(id!)
            self.ac_year.append(ac_year!)
            self.attendence_period.append(attendence_period!)
            self.class_id.append(class_id!)
            self.class_total.append(class_total!)
            self.no_of_present.append(no_of_present!)
            self.no_of_absent.append(no_of_absent!)
            self.created_at.append(created_at!)
            self.created_by.append(created_by!)
            self.status.append(status!)
        }
    }
    
    @IBAction func assignmentSync(_ sender: Any) {
               
    }
    
    @IBAction func classTestSync(_ sender: Any) {
        
    }
    
    @IBAction func examMarksSync(_ sender: Any) {
        
    }
    
    @IBAction func refreshAction(_ sender: Any) {
        
    }
}

extension SyncDataVC {
        
    func successFetchedItems(viewModel: SyncAttendanceModel.Fetch.ViewModel) {
        
    }
    
    func errorFetchingItems(viewModel: SyncAttendanceModel.Fetch.ViewModel) {
            
    }
}

extension SyncDataVC {
    
    func fetchClassAttendance() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ClassAttendances")
        do {
            let results = try context.fetch(fetchRequest)
            classAtendance = results as! [ClassAttendances]
            
            for dataa in classAtendance {
                let id = dataa.id
                print(id!)
            }
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func fetchClassAttendanceHistory() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ClassAttendanceHistory")
        do {
            let results = try context.fetch(fetchRequest)
            classAtendanceHistory = results as! [ClassAttendanceHistory]
            
            for dataa in classAtendanceHistory {
                let id = dataa.id
                print(id!)
            }
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
}
