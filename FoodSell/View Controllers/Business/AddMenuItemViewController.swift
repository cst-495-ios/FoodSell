//
//  AddMenuItemViewController.swift
//  FoodSell
//
//  Created by user132893 on 4/19/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import UIKit
import Parse

class AddMenuItemViewController: UIViewController, UITextViewDelegate{

    @IBOutlet weak var itemNameTextField: UITextField!
    
    @IBOutlet weak var priceTextField: UITextField!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var business: String!
    var menu: Menu!
    var items: [[String:Any]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.descriptionTextView.delegate = self
        self.descriptionTextView.text = "Description"
        self.descriptionTextView.textColor = UIColor.lightGray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if self.descriptionTextView.text == "Description"
        {
            textView.text = nil
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if self.descriptionTextView.text.isEmpty{
            self.descriptionTextView.text = "Description"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "menuItemAdded"{
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
                                
                                if self.items.count == 1{
                                    let name = self.items[0]["name"] as! String
                                    if name.isEmpty{
                                        self.items.remove(at: 0)
                                    }
                                }
                                
                                if (self.itemNameTextField.text?.isEmpty)! || (self.priceTextField.text?.isEmpty)! || self.descriptionTextView.text.isEmpty{
                                    print("Fields empty!")
                                }
                                else
                                {
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
                                            self.navigationController?.setNavigationBarHidden(true, animated: true)
                                            if let tabVC = segue.destination as? UITabBarController{
                                                tabVC.selectedIndex = 1
                                            }
                                            
                                        }
                                    })
                                }
                            }
                            
                        }
                    })
                }
                
            }
        }
        else if segue.identifier == "cancelAddMenuItem"{
            if let tabVC = segue.destination as? UITabBarController{
                tabVC.selectedIndex = 1
            }
            
        }
    }
    
    
}
