//
//  Order.swift
//  FoodSell
//
//  Created by user132893 on 4/30/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import Parse

class Order: PFObject, PFSubclassing{
    @NSManaged var items: [Any]
    @NSManaged var total: Float
    @NSManaged var business: String!
    @NSManaged var email: String!
    @NSManaged var phone: String!
    @NSManaged var done: Bool
    
    
    static func parseClassName()->String{
        return "Order"
    }
}
