//
//  SelectClassSecListVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 27/09/21.
//

import UIKit

protocol ClassSectionListDelegate
{
    func saveText(strText : String)
}

protocol Class_SectionDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: Class_SectionModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: Class_SectionModel.Fetch.ViewModel)
}

class SelectClassSecListVC: UIViewController,Class_SectionDisplayLogic {
   
    @IBOutlet weak var tableView: UITableView!
    
    var delegate : ClassSectionListDelegate?
    var strSaveText : NSString!
    var interactor: Class_SectionBusinessLogic?
    var selectedRows:[IndexPath] = []
    var classNameArr = [String]()
    var classIdArr = [String]()
    var selectedId = String()
    var selectedIdArr = [String]()
    
    var displayedClass_SectionData: [Class_SectionModel.Fetch.ViewModel.DisplayedClass_SectionData] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: Class_SectionModel.Fetch.Request(user_id :GlobalVariables.shared.user_id))
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
        let interactor = Class_SectionInteractor()
        let presenter = Class_SectionPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    @IBAction func doneAction(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
   
}

extension SelectClassSecListVC {
    
    func successFetchedItems(viewModel: Class_SectionModel.Fetch.ViewModel) {
        
        displayedClass_SectionData = viewModel.displayedClass_SectionData
        
        for data in displayedClass_SectionData {
            
            let className = data.class_name
            let classNameID = data.class_sec_id
            
            self.classIdArr.append(classNameID!)
            self.classNameArr.append(className!)
        }
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: Class_SectionModel.Fetch.ViewModel) {
        
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"An error occured", complition: {
        })
    }
}

extension SelectClassSecListVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedClass_SectionData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ClassSecListCell
        
        let data = displayedClass_SectionData[indexPath.row]
        cell.className.text = data.class_name
        cell.selectionStyle = .none
        
        if selectedRows.contains(indexPath)
           {
             cell.checkBox.setImage(UIImage(named:"mail1"), for: .normal)
           }
        else
           {
             cell.checkBox.setImage(UIImage(named:"mail"), for: .normal)
           }
        cell.checkBox.tag = indexPath.row
        cell.checkBox.addTarget(self, action: #selector(checkBoxSelection(sender:)), for: .touchUpInside)
           return cell
    }

     @objc func checkBoxSelection(sender: UIButton){
        
         let selectedIndexPath = IndexPath(row: sender.tag, section: 0)
        
        if self.selectedRows.contains(selectedIndexPath)
        {
         self.selectedRows.remove(at: self.selectedRows.firstIndex(of: selectedIndexPath)!)
        }
        else
        {
          self.selectedRows.append(selectedIndexPath)
        }
        
        let buttonClicked = sender.tag
          print(buttonClicked)
          let selectedIndex = Int(buttonClicked)
          let sel = self.classIdArr[selectedIndex]
          self.selectedIdArr.append(sel)
          selectedId = selectedIdArr.joined(separator:",")
          print(selectedId)
          delegate?.saveText(strText: (selectedId as NSString) as String)
        
        self.tableView.reloadData()
    }
}
