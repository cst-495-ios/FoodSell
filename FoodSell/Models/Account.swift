//
//  Account.swift
//  FoodSell
//
//  Created by user132893 on 3/28/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import Parse

class Account: PFObject, PFSubclassing{
    
    @NSManaged var key: String
    @NSManaged var type: Int
    @NSManaged var cards: [[String:Any]]
    @NSManaged var billing_info: [String:Any]
    
    
    static func parseClassName()->String{
        return "Account"
    }
    
    
    
}
