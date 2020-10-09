//
//  FavouritesViewController.swift
//  ForYouDicodingFundamentalSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 21/07/20.
//  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
//

import UIKit
import CoreData

class FavouritesViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    var game : [Game] = []
    
    private let coredatamanager = CoreDataManager()
    
    @IBOutlet weak var TVfavourites: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        registerGamesListCell()
        self.TVfavourites.delegate = self
        self.TVfavourites.dataSource = self
        self.TVfavourites.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.TVfavourites.tableFooterView = UIView()

        
        // Do any additional setup after loading the view.
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        game = coredatamanager.fetchGame()
        setBackground()

        self.TVfavourites.reloadData()
    }
    
    func setBackground(){
        print(game.count)
        if game.count == 0{
            registerNoItemCell()
        }else{
            TVfavourites.backgroundView?.isHidden = true
        }
                
        
    }
    
    
    func registerNoItemCell() {
        guard let  vcnoitem = UIStoryboard(name: "Noitem", bundle: Bundle.main).instantiateViewController(identifier: NoItemViewController.idnoitem) as? NoItemViewController else{
            fatalError("NoItemViewController not found")
        }
        
        TVfavourites.backgroundView = vcnoitem.view
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return game.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = TVfavourites.dequeueReusableCell(withIdentifier: GamesListViewTableViewCell.idGamesListViewTableViewCell, for: indexPath) as? GamesListViewTableViewCell else{
            fatalError("GamesListViewTableViewCell not found")
        }
        
        let gamelist = game[indexPath.row]
        
        cell.selectionStyle = .none
        cell.GameLabel?.text =
            gamelist.value(forKeyPath: "title") as? String
        
        cell.initCellDest(gamelist.value(forKeyPath: "image") as? String, gamelist.value(forKeyPath: "title") as? String, gamelist.value(forKeyPath: "released") as? String, gamelist.value(forKeyPath: "rating") as? Double)
        return cell
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let position = indexPath.row
        let vm = game[position]

        
        guard let  vc = UIStoryboard(name: "GameDetails", bundle: Bundle.main).instantiateViewController(identifier: GamesDetailViewController.idGamesDetails) as? UINavigationController else{
            fatalError("UINavigationController not found")
        }
        
        let vcb = vc.viewControllers.first as! GamesDetailViewController


        if let setid = vm.value(forKey: "id") {
            
                let id : String? = "\(setid)"
        
                vcb.setid = id
            }
        self.navigationController?.pushViewController(vcb, animated: true)
    }

    
    func registerGamesListCell() {
        
        let nibName = UINib(nibName: "GamesListViewTableViewCell", bundle: nil)
        TVfavourites.register(nibName, forCellReuseIdentifier: GamesListViewTableViewCell.idGamesListViewTableViewCell)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == .delete) {
        
            let managedContext = coredatamanager.moc
            
            managedContext.delete(game[indexPath.row] as NSManagedObject)
            game.remove(at: indexPath.row)
            do {
                try managedContext.save()
                setBackground()
            }
            catch{
                print(error)
            }
            print("delete")
            self.TVfavourites.reloadData()
        }
    }

    
}
