//
//  StudentsAtendanceViewControler.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 22/10/21.
//

import UIKit
import FSCalendar

class StudentsAtendanceViewControler: UIViewController {

    @IBOutlet weak var workingDays: UILabel!
    @IBOutlet weak var daysPresent: UILabel!
    @IBOutlet weak var onDuty: UILabel!
    @IBOutlet weak var leaves: UILabel!
    @IBOutlet weak var daysAbsent: UILabel!
    @IBOutlet weak var calendar: FSCalendar!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        
    }
}
