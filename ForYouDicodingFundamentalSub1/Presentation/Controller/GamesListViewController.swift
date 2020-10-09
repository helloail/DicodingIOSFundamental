//
//  GamesListViewController.swift
//  ForYouDicodingFundamentalSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 03/07/20.
//  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
//

import UIKit
import Foundation
import SVProgressHUD
import CoreData

class GamesListViewController: UIViewController {
    
    @IBOutlet weak var searchlist: UISearchBar!
    @IBOutlet weak var TvListGames: UITableView!
    private var ogameslistViewModel : GamesListViewModels!
    private let coredatamanager = CoreDataManager ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ogameslistViewModel = GamesListViewModelsimpl(useCase: DIContainer.makeViewOGameUseCase())
        
        
        self.TvListGames.delegate = self
        self.TvListGames.dataSource = self
        self.searchlist.delegate = self
        TvListGames.separatorStyle = UITableViewCell.SeparatorStyle.none
        TvListGames.tableFooterView = UIView()
        ogameslistViewModel.didload("")
        observe()
        registerGamesListCell()
    }
    
    private func observe(){
        ogameslistViewModel.list.observe(on: self, observerBlock: { games in
            self.TvListGames.reloadData()
            
            if games?.isEmpty ?? true{
                self.registerNoItemCell()
                
            }else{
                self.TvListGames.backgroundView = nil
            }
        })
        
        ogameslistViewModel.loading.observe(on: self) { isLoading in
            if isLoading {
                SVProgressHUD.show()
            } else{
                SVProgressHUD.dismiss()
            }
        }
        
        ogameslistViewModel.errorMessage.observe(on: self) { errorMessage in
            print(errorMessage)
        }
        
        ogameslistViewModel.route.observe(on: self) { route in
            switch(route){
                
            case .initial:
                break
            case .profile:
                let vc = UIStoryboard(name: "Profile", bundle: Bundle.main).instantiateViewController(identifier: UserProfileViewController.idUserProfileViewController) as! UserProfileViewController
                
                self.present(vc, animated: true, completion: nil)
                
            case .search(_):
                break
            case .detailgames(let id):
                
                guard let  vc = UIStoryboard(name: "GameDetails", bundle: Bundle.main).instantiateViewController(identifier: GamesDetailViewController.idGamesDetails) as? UINavigationController else{
                    fatalError("UINavigationController not found")
                }
                
                let vcb = vc.viewControllers.first as! GamesDetailViewController
                
                let id : String? = "\(id)"
                
                vcb.setid = id
                
                self.navigationController?.pushViewController(vcb, animated: true)
                
            }
        }
    }
    
   
    
    
    @IBAction func rightbarbutton(_ sender: Any) {
        
        self.ogameslistViewModel.route.value = .profile
        
    }
    
}

extension GamesListViewController{
    
    func registerGamesListCell() {
        
        let nibName = UINib(nibName: "GamesListViewTableViewCell", bundle: nil)
        TvListGames.register(nibName, forCellReuseIdentifier: GamesListViewTableViewCell.idGamesListViewTableViewCell)
    }
    
    func registerNoItemCell() {
        guard let  vcnoitem = UIStoryboard(name: "Noitem", bundle: Bundle.main).instantiateViewController(identifier: NoItemViewController.idnoitem) as? NoItemViewController else{
            fatalError("NoItemViewController not found")
        }
        
        TvListGames.backgroundView = vcnoitem.view
    }
    
}


//
extension GamesListViewController{
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let insert = UITableViewRowAction(style: .destructive, title: "Favourites") { (action, indexPath) in
            
            let position = indexPath.row
            let vm = self.ogameslistViewModel.list.value?[position]
            self.coredatamanager.saveData(id: vm?.id, name: vm?.name, image: vm?.backgroundImage, release: vm?.released, rating: vm?.rating)
        }
        
        insert.backgroundColor = UIColor.green
        
        return [insert]
    }
    
}


extension GamesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.ogameslistViewModel.list.value?.count ?? 0
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vm = self.ogameslistViewModel.list.value?[indexPath.row]
        
        guard let cell = TvListGames.dequeueReusableCell(withIdentifier: GamesListViewTableViewCell.idGamesListViewTableViewCell, for: indexPath) as? GamesListViewTableViewCell else{
            fatalError("GamesListViewTableViewCell not found")
        }
        
        cell.selectionStyle = .none
        
        cell.initCellDest(vm?.backgroundImage,vm?.name,vm?.released,vm?.rating)
        
        return cell
    }
    
}

extension GamesListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        self.ogameslistViewModel.didload(searchText)
        
    }
    
    
}


extension GamesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let position = indexPath.row
        let vm = self.ogameslistViewModel.list.value?[position]
        
        self.ogameslistViewModel.route.value = .detailgames(vm?.id ?? 0)
        
        
    }
    
}
