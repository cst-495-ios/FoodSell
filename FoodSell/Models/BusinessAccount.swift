//
//  BusinessAccount.swift
//  FoodSell
//
//  Created by user132893 on 4/9/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import Parse

class BusinessAccount: PFObject, PFSubclassing{
    
    @NSManaged var name: String
    @NSManaged var photo: PFFile
    @NSManaged var location_info: [String:Any]
    @NSManaged var contact_info: String
    @NSManaged var category: String
    @NSManaged var hours: [String:String]
    @NSManaged var admin: String
    
    
    static func parseClassName()->String{
        return "BusinessAccount"
    }
    
    
    
}
