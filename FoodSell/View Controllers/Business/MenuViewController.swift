//
//  MenuViewController.swift
//  FoodSell
//
//  Created by user132893 on 4/18/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import UIKit
import Parse

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var menu: Menu!
    var items: [[String:Any]] = [[:]]
    var business: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.rowHeight = 300
        fetch()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.menu == nil{
            return 0
        }
        print("\(self.items.count)")
        return self.items.count
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "MenuItemCell", for: indexPath) as! MenuItemCell
        
        if self.menu != nil && self.items.count > 0{
            cell.item = self.items[indexPath.row]
            
        }
        
        
        return cell
    }
    
    
    func fetch(){
        let user = PFUser.current()?.username
        
        
        var query1 = PFQuery(className: "BusinessAccount")
        query1.whereKey("admin", equalTo: user!)
        query1.findObjectsInBackground { (objects: [PFObject]?, error) in
            if let error = error{
                print(error.localizedDescription)
            }
            else
            {
                let object = objects![0] as! BusinessAccount
                self.business = object.name
                
                print(self.business)
            
                var query2 = PFQuery(className: "Menu")
                query2.whereKey("business", equalTo: self.business)
                query2.findObjectsInBackground { (objects: [PFObject]?, error) in
                    if let error = error{
                        print(error.localizedDescription)
                    }
                    else
                    {
                        if objects?.isEmpty == false{
                            var object = objects![0] as! Menu
                            
                            self.menu = object
                            self.items = self.menu.items
                            self.tableView.reloadData()
                        }
                        else
                        {
                            print("No menu items!")
                        }
                    }
                }
            }
        }
        
        
       
        
        
        
    }
    
    @IBAction func addMenuItem(_ sender: Any) {
        self.performSegue(withIdentifier: "addMenuItem", sender: nil)
    }
    
    

}
