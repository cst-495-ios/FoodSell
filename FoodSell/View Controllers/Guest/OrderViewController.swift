//
//  OrderViewController.swift
//  FoodSell
//
//  Created by user132893 on 4/30/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import UIKit
import Parse
import DropDown

class OrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, OrderCellDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    var business: BusinessAccount!
    var menu: Menu!
    var items: [[String:Any]] = [[:]]
    
    var order: [Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self

        // Do any additional setup after loading the view.
        
        if self.business != nil{
            let name = self.business.name
            
            let query = PFQuery(className:"Menu")
            query.whereKey("business", equalTo: name)
            query.findObjectsInBackground(block: { (objects: [PFObject]?, error) in
                if let error = error{
                    print(error.localizedDescription)
                }
                else{
                    let menu = objects![0] as! Menu
                    self.menu = menu
                    self.items = menu.items
                    self.tableView.reloadData()
                }
            })
        }
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath) as! OrderCell
        
        if self.menu != nil{
            cell.item = items[indexPath.row]
            cell.delegate = self
        }
        return cell
    }
    
   
    func addToOrder(_ sender: Any) {
        
        if let indexPath = self.tableView.indexPathForSelectedRow{
            let currentCell = self.tableView.cellForRow(at: indexPath) as! OrderCell
            
            let quantity = Int(currentCell.selectedQuantity)! as Int
            if quantity > 0{
                let order = [currentCell.item, quantity] as [Any]
                self.order.append(order)
                let message = "\(quantity) \(currentCell.item["name"] ?? "") added!"
                let alert = UIAlertController(title: "Updated Cart", message: message, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else
            {
                let message = "Item must be 1 or more!"
                let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
            
            
        }
    }
    
    func selectQuantity(_ sender: Any) {
        if let indexPath = self.tableView.indexPathForSelectedRow
        {
            let currentCell = self.tableView.cellForRow(at: indexPath) as! OrderCell
            
            currentCell.quantityDropDown.show()
            
            
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToOrderSend"{
            let nav = segue.destination as? UINavigationController
            let vc = nav?.viewControllers.first as! OrderSendViewController
            vc.order = self.order
            vc.business = self.business
        }
        
    }

}
