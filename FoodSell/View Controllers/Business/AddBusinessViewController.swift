//
//  AddBusinessViewController.swift
//  FoodSell
//
//  Created by user132893 on 4/11/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import UIKit
import DropDown
import Parse

class AddBusinessViewController: UIViewController {

    @IBOutlet weak var businessName: UITextField!
    
    @IBOutlet weak var address: UITextField!
    
    
    @IBOutlet weak var city: UITextField!
    
    
    @IBOutlet weak var state: UIView!
    
   
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var zip: UITextField!
    
    @IBOutlet weak var phoneNumber: UITextField!
    
    @IBOutlet weak var category: UIView!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    var hours: [String:String] = ["Monday_Start":"12:00 AM","Tuesday_Start":"12:00 AM","Wednesday_Start":"12:00 AM","Thursday_Start":"12:00 AM","Friday_Start":"12:00 AM","Saturday_Start":"12:00 AM","Sunday_Start":"12:00 AM","Monday_End":"12:00 AM","Tuesday_End":"12:00 AM","Wednesday_End":"12:00 AM","Thursday_End":"12:00 AM","Friday_End":"12:00 AM","Saturday_End":"12:00 AM","Sunday_End":"12:00 AM"]
    
    let states = ["AL","AK","AZ","AR","CA","CO","CT","DE","DC","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV","WI","WY"]
    
    let categories = ["Asian","American","European","Casual","African","Middle Eastern"]
    var stateDropDown: DropDown!
    
    var categoryDropDown: DropDown!
    
    var selectedState: String!
    
    var selectedCategory: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.stateDropDown = DropDown(anchorView: state)
        self.stateDropDown.dataSource = states
        self.stateDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.stateLabel.text = item
            self.selectedState = item
        }
        
        self.categoryDropDown = DropDown(anchorView: category)
        self.categoryDropDown.dataSource = categories
        self.categoryDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.categoryLabel.text = item
            self.selectedCategory = item
        }
        
        
        
    }
    
    @IBAction func stateSelected(_ sender: Any) {
        self.stateDropDown.show()
    }
    
    @IBAction func categorySelected(_ sender: Any) {
        self.categoryDropDown.show()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addBusiness(_ sender: Any) {
        let businessNameText = self.businessName.text
        let addressText = self.address.text
        let cityText = self.city.text
        let stateText = self.selectedState ?? "AL"
        let zipText = self.zip.text
        let phoneNumberText = self.phoneNumber.text
        let categoryText = self.selectedCategory ?? "Asian"
        let location_info = ["street_address":addressText,"city":cityText, "state":stateText, "zip": zipText]
        
        
        var businessAccount = PFObject(className:"BusinessAccount")
        
        businessAccount["name"] = businessNameText
        businessAccount["location_info"] = location_info
        businessAccount["contact_info"] = phoneNumberText
        businessAccount["category"] = categoryText
        businessAccount["hours"] = self.hours
        businessAccount["admin"] = PFUser.current()?.username
        
        businessAccount.saveInBackground { (success, error) in
            if let error = error{
                print(error.localizedDescription)
            }
            else
            {
                print("Business Account added!")
                self.performSegue(withIdentifier: "businessAdded", sender: nil)
                
            }
        }
        
       
    }
    
    @IBAction func addHours(_ sender: Any) {
        self.performSegue(withIdentifier: "addHours", sender: nil)
    }
    
}
