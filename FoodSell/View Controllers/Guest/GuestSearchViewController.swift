//
//  GuestSearchViewController.swift
//  FoodSell
//
//  Created by user132893 on 3/27/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import UIKit
import Parse

class GuestSearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var businesses: [BusinessAccount] = []
    var filteredBusinesses: [BusinessAccount]!
    var searchController: UISearchController!
   
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.searchResultsUpdater = self
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "Search Businesses"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        
        
        fetchAll()
        
        self.tableView.rowHeight = 300
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        definesPresentationContext = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFiltering(){
            return filteredBusinesses.count
        }
        return self.businesses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "BusinessCell", for: indexPath) as! BusinessCell
        
        if isFiltering(){
            cell.business = filteredBusinesses[indexPath.row]
        }
        else
        {
            cell.business = businesses[indexPath.row]
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = self.tableView.indexPathForSelectedRow
        let currentCell = self.tableView.cellForRow(at: indexPath!) as! BusinessCell
        
        
        let currentBusiness = currentCell.business
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "GuestSearchBusinessDetail") as! GuestBusinessDetailViewController
        vc.business = currentBusiness
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
  

    
    
    func fetchAll(){
        var query = PFQuery(className: "BusinessAccount")
        query.findObjectsInBackground { (objects: [PFObject]?, error) in
            if let error = error{
                print(error.localizedDescription)
            }
            else{
                self.businesses = (objects as? [BusinessAccount])!
                self.tableView.reloadData()
                
            }
        }
    }
    
    func isFiltering() -> Bool{
        return self.searchController.isActive && !searchBarIsEmpty()
    }
    
    func searchBarIsEmpty() -> Bool{
        return self.searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All"){
        self.filteredBusinesses = businesses.filter({ (business: BusinessAccount) -> Bool in
            return business.name.lowercased().contains(searchText.lowercased())
        })
        
        self.tableView.reloadData()
    }
}

extension GuestSearchViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(self.searchController.searchBar.text!)
    }
}

