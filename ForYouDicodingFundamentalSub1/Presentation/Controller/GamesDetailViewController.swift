//
//  GamesDetailViewController.swift
//  ForYouDicodingFundamentalSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 04/07/20.
//  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
//

import UIKit
import SVProgressHUD

class GamesDetailViewController: UIViewController {
    @IBOutlet weak var TVGameDetails: UITableView!
    private var gamesdetailviewmodel : GamesDetailViewModels!
    var setid : String?
    static let idGamesDetails = "idGamesDetails"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gamesdetailviewmodel = GamesDetailViewModelsimpl(useCase: DIContainer.makeDetailGameUseCase())
        
        registerDetailCell()
        TVGameDetails.separatorStyle = UITableViewCell.SeparatorStyle.none
        TVGameDetails.tableFooterView = UIView()
       
        if let id = setid{
             gamesdetailviewmodel.didload(id)
        }
        observe()
        
    }
    
    private func observe(){
        gamesdetailviewmodel.detail.observe(on: self) { games in
            self.TVGameDetails.reloadData()
            self.TVGameDetails.dataSource = self
            
        }
        gamesdetailviewmodel.loading.observe(on: self) { isLoading in
            if isLoading {
                SVProgressHUD.show()
            } else{
                SVProgressHUD.dismiss()
            }
        }
        

        
        gamesdetailviewmodel.errorMessage.observe(on: self) { errorMessage in
            print(errorMessage)
        }
        
        
    }

   
    
}

extension GamesDetailViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        
        if section == 0{
            return makeDetailGameCell(at: indexPath)
        }
        
        return makeDetailGameCell(at: indexPath)
    }
    
}

extension GamesDetailViewController {
    
    func makeDetailGameCell(at indexPath: IndexPath) -> UITableViewCell {
        let vm = self.gamesdetailviewmodel.detail.value
        let cell =  TVGameDetails.dequeueReusableCell(withIdentifier : GameDetailTableViewCell.idgamesdetailtableviewcell, for: indexPath) as! GameDetailTableViewCell
        
        cell.initCellDetail(vm.backgroundImage, vm.name, vm.released, vm.rating, vm.playtime, vm.detailGamesDescription)
        
        return cell
    }
    
    func registerDetailCell() {
           
           let nibName = UINib(nibName: "GameDetailTableViewCell", bundle: nil)
           TVGameDetails.register(nibName, forCellReuseIdentifier: GameDetailTableViewCell.idgamesdetailtableviewcell)
       }
}
