//
//  StudentsHWClassTestVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 22/10/21.
//

import UIKit
import DropDown
import MBProgressHUD

//class StudentsHWClassTestVC: UIViewController, HomeWorkTestListDisplayLogic {
//
//}
//    @IBOutlet weak var selectBtn: UIButton!
//    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var typeTextfield: UITextField!
//
//    let dropDown = DropDown()
//    var dropDownData = [String]()
//    var interactor: HomeWorkTestListBusinessLogic?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//        interactor?.fetchItems(request: HomeWorkTestListModel.Fetch.Request(class_id :self.selectedClassId,hw_type: "HT"))
//    }
//
//    @IBAction func selectAction(_ sender: Any) {
//
//        dropDown.show()
//        dropDown.anchorView = typeTextfield
//        dropDown.dataSource = dropDownData
//        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
//          print("Selected item: \(item) at index: \(index)")
//            typeTextfield.text = item
//        }
//    }
//
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
//    {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        setup()
//    }
//
//    required init?(coder aDecoder: NSCoder)
//    {
//        super.init(coder: aDecoder)
//        setup()
//    }
//
//    private func setup()
//    {
//        let viewController = self
//        let interactor = HomeWorkTestListInteractor()
//        let presenter = HomeWorkTestListPresenter()
//        viewController.interactor = interactor
//        interactor.presenter = presenter
//        presenter.viewController = viewController
//    }
//}
//
//extension StudentsHWClassTestVC {
//
//    func successFetchedItems(viewModel: HomeWorkTestListModel.Fetch.ViewModel) {
//
//        MBProgressHUD.hide(for: self.view, animated: true)
//        displayedHomeWorkTestListData = viewModel.displayedHomeWorkTestListData
//        self.tableView.reloadData()
//    }
//
//    func errorFetchingItems(viewModel: HomeWorkTestListModel.Fetch.ViewModel) {
//
//        MBProgressHUD.hide(for: self.view, animated: true)
//    }
//}
//
//extension HomeWorkTestVC: UITableViewDelegate,UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return displayedHomeWorkTestListData.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeWorkListCell
//
//        let data = displayedHomeWorkTestListData[indexPath.row]
//
//        cell.title.text = data.title
//        cell.date.text = " Due Date : \(data.test_date!)"
//
//        if data.hw_type == "HT" {
//            cell.subName.text = "\(data.subject_name!) - CLASS TEST"
//        }
//        else {
//            cell.subName.text = "\(data.subject_name!) - HOME WORK"
//        }
//        cell.selectionStyle = .none
//
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let data = displayedHomeWorkTestListData[indexPath.row]
//        self.selectedHomeWorkType = data.hw_type!
//        self.selectedDescription = data.hw_details!
//        self.selectedTopic = data.title!
//        self.selectedMark = data.mark_status!
//
//        self.performSegue(withIdentifier: "toHomeWorkDetails", sender: self)
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if (segue.identifier == "toHomeWorkDetails")
//        {
//        let vc = segue.destination as! HomeWorkDetailsVC
//            vc.selectedHomeWorkType = self.selectedHomeWorkType
//            vc.selectedClassId = self.selectedClassId
//            vc.selectedDescription = self.selectedDescription
//            vc.selectedTopic = self.selectedTopic
//            vc.selectedMark = self.selectedMark
//
//        }
//    }
