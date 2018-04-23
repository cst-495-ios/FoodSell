//
//  AddMenuItemViewController.swift
//  FoodSell
//
//  Created by user132893 on 4/19/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import UIKit
import Parse

class AddMenuItemViewController: UIViewController {

    @IBOutlet weak var itemNameTextField: UITextField!
    
    @IBOutlet weak var priceTextField: UITextField!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var business: String!
    var menu: Menu!
    var items: [[String:Any]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addMenuItem(_ sender: Any) {
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
                
                var query2 = PFQuery(className: "Menu")
                query2.whereKey("business", equalTo: self.business)
                query2.findObjectsInBackground(block: { (objects: [PFObject]?, error) in
                    if let error = error{
                        print(error.localizedDescription)
                    }
                    else
                    {
                        if objects?.isEmpty == false
                        {
                            var object = objects![0] as? Menu
                            self.menu = object
                            self.items = self.menu.items
                            let item = ["name":self.itemNameTextField.text!,"cost": Int(self.priceTextField.text!)!,"description":self.descriptionTextView.text] as [String : Any]
                            self.items.append(item)
                            
                            self.menu["items"] = self.items
                            
                            self.menu.saveInBackground(block: { (success, error) in
                                if let error = error{
                                    print(error.localizedDescription)
                                }
                                else
                                {
                                    print("Menu updated!")
                                }
                            })
                        }
                        else
                        {
                            
                        }
                        
                    }
                })
            }
        }
        
        
        
    }
    
}
