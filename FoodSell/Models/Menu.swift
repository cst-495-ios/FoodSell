//
//  Menu.swift
//  FoodSell
//
//  Created by user132893 on 4/9/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import Parse

class Menu: PFObject, PFSubclassing{
    @NSManaged var business: String!
    @NSManaged var items: [[String: Any]]
    
    
    static func parseClassName()->String{
        return "Menu"
    }
    
}
