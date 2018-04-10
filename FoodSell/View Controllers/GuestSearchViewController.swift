//
//  GuestSearchViewController.swift
//  FoodSell
//
//  Created by user132893 on 3/27/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import UIKit

class GuestSearchViewController: UIViewController, UITableViewDataSource {
    
    var businesses: [[String: Any]] = []
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businesses.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantCell", for: indexPath) as! RestaurantCell
        let business = businesses[indexPath.row]
        
        //        let movie = movies[indexPath.row]
        //        let title = movie["title"] as! String
        //        let overview = movie["overview"] as! String
        //
        //        cell.titleLabel.text = title
        //        cell.overviewLabel.text = overview
        //
        //        let posterPathString = movie["poster_path"] as! String
        //        let baseURLString = "https://image.tmdb.org/t/p/w500"
        //        let posterURL = URL(string: baseURLString + posterPathString)!
        //        cell.posterImageView.af_setImage(withURL: posterURL)
        
        return cell
    }

    
}

