//
//  RestaurantCell.swift
//  FoodSell
//
//  Created by angel gonzalez on 4/2/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var hoursLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    var business: BusinessAccount!{
        didSet{
            nameLabel.text = business.name
            categoryLabel.text = business.category
            hoursLabel.text = "Hours:\n Monday: \(business.hours["Monday_Start"] ?? "") to \(business.hours["Monday_End"] ?? "") \nTuesday: \(business.hours["Tuesday_Start"] ?? "") to \(business.hours["Tuesday_End"] ?? "") \nWednesday: \(business.hours["Wednesday_Start"] ?? "") to \(business.hours["Wednesday_End"] ?? "") \nThursday: \(business.hours["Thursday_Start"] ?? "") to \(business.hours["Thursday_End"] ?? "") \nFriday: \(business.hours["Friday_Start"] ?? "") to \(business.hours["Friday_End"] ?? "") \nSaturday: \(business.hours["Saturday_Start"] ?? "") to \(business.hours["Saturday_End"] ?? "") \nSunday: \(business.hours["Sunday_Start"] ?? "") to \(business.hours["Sunday_End"] ?? "")"
            
            addressLabel.text = "\(business.location_info["street_address"] ?? ""), \(business.location_info["city"] ?? ""), \(business.location_info["state"] ?? "") \(business.location_info["zip"] ?? "")"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
