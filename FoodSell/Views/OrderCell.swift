//
//  OrderCell.swift
//  FoodSell
//
//  Created by user132893 on 4/30/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import UIKit
import DropDown

protocol OrderCellDelegate: class{
    func addToOrder(_ sender: Any)
    func selectQuantity(_ sender: Any)
}

class OrderCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var costLabel: UILabel!
    
    @IBOutlet weak var addToCart: UIButton!
    
    weak var delegate: OrderCellDelegate?
    
    var quantityDropDown: DropDown!
    
    @IBOutlet weak var quantityView: UIButton!
    
    
    var quantity_amounts: [String] = ["0","1","2","3","4","5"]
    
    var item: [String:Any]!{
        didSet{
            nameLabel.text = "\(item["name"] ?? "")"
            descriptionLabel.text = "\(item["description"] ?? "")"
            costLabel.text = "$\(item["cost"] ?? "")"
        }
    }
    

    
    var selectedQuantity: String = "0"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
       self.quantityDropDown = DropDown(anchorView: self.quantityView)
       self.quantityDropDown.dataSource = self.quantity_amounts
        self.quantityDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.selectedQuantity = item
            self.quantityView.setTitle(item, for: .normal)
            
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func addToCart(_ sender: Any) {
        delegate?.addToOrder(sender)
    }
    
    @IBAction func selectQuantity(_ sender: Any) {
        delegate?.selectQuantity(sender)
    }
    
    
}
