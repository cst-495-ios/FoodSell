//
//  BusinessAccountViewController.swift
//  FoodSell
//
//  Created by user132893 on 4/9/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import UIKit
import Parse

class BusinessAccountViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var addBusiness: UIButton!
    
    var businessAccounts: [BusinessAccount]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 155
        // Do any additional setup after loading the view.
        fetch()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetch(){
        let query = PFQuery(className: "BusinessAccount")
        query.whereKey("admin", equalTo: PFUser.current()?.username! ?? "")
        query.findObjectsInBackground { (objects: [PFObject]?, error) in
            if let error = error{
                print(error.localizedDescription)
            }
            else
            {
                self.businessAccounts = objects as! [BusinessAccount]
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if businessAccounts != nil
        {
            if businessAccounts.count < 1 {
                addBusiness.isHidden = false
            }
            else
            {
                addBusiness.isHidden = true
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count = 0
        if businessAccounts != nil
        {
           count = self.businessAccounts.count
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "BusinessAccountCell", for: indexPath) as! BusinessAccountCell
        cell.business = businessAccounts[indexPath.row]
        return cell
    }
    
    
    @IBAction func addBusiness(_ sender: Any) {
        if(businessAccounts.count < 1)
        {
            self.performSegue(withIdentifier: "addBusiness", sender: nil)
        }
    }
    
    

}
