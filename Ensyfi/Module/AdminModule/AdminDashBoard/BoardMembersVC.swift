//
//  BoardMembersVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/09/21.
//

import UIKit
import MBProgressHUD
import SideMenu

protocol BoardMembersListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: BoardMembersListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: BoardMembersListModel.Fetch.ViewModel)
}

class BoardMembersVC: UIViewController, BoardMembersListDisplayLogic,SideMenuNavigationControllerDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    
    var serialNoArr = [Int]()
    var interactor: BoardMembersListBusinessLogic?
    var displayedBoardMembersListData: [BoardMembersListModel.Fetch.ViewModel.DisplayedBoardMembersListData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: BoardMembersListModel.Fetch.Request(user_id :GlobalVariables.shared.user_id,dynamic_db: GlobalVariables.shared.dynamic_db))
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func sideMenuWillAppear(menu: SideMenuNavigationController, animated: Bool) {
        view.alpha = 0.8
    }
    
    func sideMenuWillDisappear(menu: SideMenuNavigationController, animated: Bool) {
           view.alpha = 1
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
        let interactor = BoardMembersListInteractor()
        let presenter = BoardMembersListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}


extension BoardMembersVC {
    
    func successFetchedItems(viewModel: BoardMembersListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedBoardMembersListData = viewModel.displayedBoardMembersListData
        
        for i in 1...10000 {
            self.serialNoArr.append(i)
        }
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: BoardMembersListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"An error occured", complition: {
        })
    }
}


extension BoardMembersVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedBoardMembersListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BoardMembersListCell
        
        let data = displayedBoardMembersListData[indexPath.row]
        
        cell.sNo.text = String(serialNoArr[indexPath.row])
        cell.name.text = data.name
        cell.selectionStyle = .none
        
        return cell
    }
}
