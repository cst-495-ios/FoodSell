//
//  GuestBusinessDetailViewController.swift
//  FoodSell
//
//  Created by user132893 on 4/22/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import UIKit

class GuestBusinessDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    @IBOutlet weak var hoursLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    var business: BusinessAccount!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = business.name
        
        categoryLabel.text = business.category
        
        hoursLabel.text = "Hours:\nMonday: \(business.hours["Monday_Start"] ?? "") to \(business.hours["Monday_End"] ?? "") \nTuesday: \(business.hours["Tuesday_Start"] ?? "") to \(business.hours["Tuesday_End"] ?? "") \nWednesday: \(business.hours["Wednesday_Start"] ?? "") to \(business.hours["Wednesday_End"] ?? "") \nThursday: \(business.hours["Thursday_Start"] ?? "") to \(business.hours["Thursday_End"] ?? "") \nFriday: \(business.hours["Friday_Start"] ?? "") to \(business.hours["Friday_End"] ?? "") \nSaturday: \(business.hours["Saturday_Start"] ?? "") to \(business.hours["Saturday_End"] ?? "") \nSunday: \(business.hours["Sunday_Start"] ?? "") to \(business.hours["Sunday_End"] ?? "")"
        
        addressLabel.text = "\(business.location_info["street_address"] ?? ""), \(business.location_info["city"] ?? ""), \(business.location_info["state"] ?? "") \(business.location_info["zip"] ?? "")"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
        
    }
    

    @IBAction func startOrder(_ sender: Any) {
        
    }
    
}
