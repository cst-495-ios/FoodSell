//
//  MenuViewController.swift
//  FoodSell
//
//  Created by user132893 on 3/26/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func login(_ sender: Any) {
        self.performSegue(withIdentifier: "login", sender: nil)
    }
    
    @IBAction func signup(_ sender: Any) {
        self.performSegue(withIdentifier: "signup", sender: nil)
    }
    
    @IBAction func guestLogin(_ sender: Any) {
        self.performSegue(withIdentifier: "searchAsGuest", sender: nil)
    }
}
