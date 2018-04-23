//
//  MenuItemCell.swift
//  FoodSell
//
//  Created by user132893 on 4/19/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import UIKit

class MenuItemCell: UITableViewCell {

    @IBOutlet weak var itemNameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var item: [String:Any]! {
        didSet{
            itemNameLabel.text = "\(item["name"] ?? "")"
            priceLabel.text = "$\(item["cost"] ?? "")"
            descriptionLabel.text = "\(item["description"] ?? "")"
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
