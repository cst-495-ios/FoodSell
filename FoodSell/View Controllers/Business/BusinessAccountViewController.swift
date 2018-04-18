//
//  BusinessAccountViewController.swift
//  FoodSell
//
//  Created by user132893 on 4/9/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import UIKit

class BusinessAccountViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var businessAccounts: [BusinessAccount] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.businessAccounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "BusinessAccountCell", for: indexPath) as! BusinessAccountCell
        cell.business = businessAccounts[indexPath.row]
        return cell
    }
    
    
    @IBAction func addBusiness(_ sender: Any) {
        
    }
    
    

}
