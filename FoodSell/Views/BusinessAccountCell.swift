//
//  BusinessAccountCell.swift
//  FoodSell
//
//  Created by user132893 on 4/11/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import UIKit

class BusinessAccountCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    var business: BusinessAccount! {
        didSet{
            nameLabel.text = business.name
            
            let location = "Address: \(business.location_info["street_address"] ?? ""), \(business.location_info["city"] ?? ""), \(business.location_info["state"] ?? "") \(business.location_info["zip"] ?? "")"
            
            locationLabel.text = location
            
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
