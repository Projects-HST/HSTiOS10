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
    
    var syncArray = ["karan","Minesh","bhuganesh","karthi"]
    var syncArray1 = ["ios","andriod","design","design12"]
    var syncArray2 = ["cbe","udt","thek","slaem"]
    var arraysss = [String()]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        context = appDelegate.persistentContainer.viewContext
        self.fetchData()
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
    
    func fetchData(){
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ClassAttendances")
    
        do {
            let results = try context.fetch(fetchRequest)
            let  datas = results as! [ClassAttendances]
    
            for data in datas {
                let classId = data.class_id
                arraysss.append(String(classId!.count))
            }
            print(arraysss)
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    @IBAction func attendanceSync(_ sender: Any) {

        if syncArray.count > 0 {
            print(syncArray.last!)
            print(syncArray1.last!)
            print(syncArray2.last!)
            syncArray.removeLast()
            syncArray1.removeLast()
            syncArray2.removeLast()
        }
        else {
            
            print("no")
        }
    }
    
    @IBAction func assignmentSync(_ sender: Any) {
       
            
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ClassAttendanceHistory")
                do {
                    let results = try context.fetch(fetchRequest)
                    let data = results as! [ClassAttendanceHistory]
                    
                    for dataa in data {
                        let name = dataa.a_taken_by
                        let id = dataa.id
                        print(name!)
                        print(id!)
                    }
                } catch let err as NSError {
                    print(err.debugDescription)
                }
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
