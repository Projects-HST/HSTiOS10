//
//  TeacherTimeTableVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 01/11/21.
//
//

import UIKit
import CoreData
import HMSegmentedControl

class TeacherTimeTableVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentView: UIView!
    
    var segmentedControl = HMSegmentedControl()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context : NSManagedObjectContext?
    var timeTableArr = [TimeTables]()
    var timeTableDaysArr = [TimeTableDays]()
    
    var segTitles = [String]()
    var segTitlesID = [String]()
    var nameArr = [String]()
    var secNameArr = [String]()
    var fromTimeArr = [String]()
    var toTimeArr = [String]()
    var subNameArr = [String]()
    var day_idArr = [String]()
    var is_breakArr = [String]()
    
    var selectedfromTimeArr = [String]()
    var selectedtoTimeArr = [String]()
    var selectedSecNameArr = [String]()
    var selectedday_idArr = [String]()
    var selectedis_breakdArr = [String]()
    var selectedSubjectArr = [String]()
    var selectedSegId = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setUpSegementControl ()
        self.fetchTimeTables()
        self.fetchTimaTableDaysList()
        self.context = appDelegate.persistentContainer.viewContext
    }
    
    func setUpSegementControl ()
    {
            segmentedControl = HMSegmentedControl(sectionTitles: self.segTitles)
            segmentedControl.autoresizingMask = [.flexibleRightMargin, .flexibleWidth]
            segmentedControl.frame = CGRect(x: 0, y: 0, width: self.segmentView.frame.width, height: 50)
            segmentedControl.addTarget(self, action: #selector(segmentedControlChangedValue(segmentedControl:)), for: .valueChanged)
            segmentView.addSubview(segmentedControl)
            segmentView.backgroundColor = UIColor.darkGray
            segmentedControl.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
            segmentedControl.selectedTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
            segmentedControl.selectionStyle = HMSegmentedControlSelectionStyle.fullWidthStripe
            segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocation.bottom
            segmentedControl.segmentWidthStyle = HMSegmentedControlSegmentWidthStyle.fixed
            segmentedControl.selectionIndicatorHeight = 4.0
            segmentedControl.selectionIndicatorColor = UIColor.black
//            segmentedControl.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Roboto-Medium", size: 15.0)!]
    }
        
    @objc func segmentedControlChangedValue(segmentedControl: HMSegmentedControl) {
            
            self.selectedfromTimeArr.removeAll()
            self.selectedtoTimeArr.removeAll()
            self.selectedSecNameArr.removeAll()
            self.selectedday_idArr.removeAll()
            self.selectedis_breakdArr.removeAll()
            
            let index =  Int(segmentedControl.selectedSegmentIndex)
            let selectedId = segTitlesID[index]
            self.selectedSegId = String(selectedId)
            print(selectedSegId)
            let indexes = day_idArr.enumerated().filter {
                $0.element == selectedSegId
                }.map{$0.offset}
            print(indexes)
            let dayID = day_idArr[indexes.indices]
            let toTime = toTimeArr[indexes.indices]
            let fromTime = fromTimeArr[indexes.indices]
            let secName = secNameArr[indexes.indices]
            let isBreak = is_breakArr[indexes.indices]
            let subName = is_breakArr[indexes.indices]
           
            self.selectedfromTimeArr = Array(fromTime)
            self.selectedtoTimeArr = Array(toTime)
            self.selectedSecNameArr = Array(secName)
            self.selectedday_idArr = Array(dayID)
            self.selectedis_breakdArr = Array(isBreak)
            self.selectedSubjectArr = Array(subName)
            print(selectedSecNameArr)
            print(selectedtoTimeArr)
            print(selectedfromTimeArr)
            self.tableView.reloadData()
        }
    
    func fetchTimaTableDaysList() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "TimeTableDays")
        do {
            let results = try context.fetch(fetchRequest)
            self.timeTableDaysArr = results as! [TimeTableDays]
            
            for dataa in timeTableDaysArr {
                
                let dayID = dataa.day_id
                let dayName = dataa.day_name
                
                self.segTitles.append(dayName!)
                self.segTitlesID.append(dayID!)
            }
            self.setUpSegementControl ()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func fetchTimeTables() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "TimeTables")
        do {
            let results = try context.fetch(fetchRequest)
            self.timeTableArr = results as! [TimeTables]
            
            for dataa in timeTableArr {
                
                let name = dataa.name
                let secName = dataa.sec_name
                let fromTime = dataa.from_time
                let toTime = dataa.to_time
                let subName = dataa.subject_name
                let dayID = dataa.day_id
                let isBreak = dataa.is_break
               
                self.nameArr.append(name!)
                self.secNameArr.append(secName!)
                self.fromTimeArr.append(fromTime!)
                self.toTimeArr.append(toTime!)
                self.subNameArr.append(subName!)
                self.day_idArr.append(dayID!)
                self.is_breakArr.append(isBreak!)
            }
//            self.tableView.reloadData()
            print(nameArr)
            print(day_idArr)
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
}

extension TeacherTimeTableVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return selectedSecNameArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TimeTableListCell
                
        if selectedis_breakdArr[indexPath.row] == "0"{
            cell.timeLbl.text = "\(selectedfromTimeArr[indexPath.row]) - \(selectedtoTimeArr[indexPath.row])"
            cell.secNmae.text = selectedSecNameArr[indexPath.row]
            cell.subNameLbl.text = selectedSubjectArr[indexPath.row]
        }
        
        else {
            cell.bgView.backgroundColor = UIColor.orange
            cell.timeLbl.text = " break \(selectedfromTimeArr[indexPath.row]) - \(selectedtoTimeArr[indexPath.row])"
            cell.timeLbl.textColor = UIColor.white
            cell.timeLbl.font = UIFont(name:"SFUIText-Regular", size: 20.0)
        }
        return cell
    }
}
