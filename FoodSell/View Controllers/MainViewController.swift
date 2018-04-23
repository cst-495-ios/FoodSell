//
//  MainViewController.swift
//  FoodSell
//
//  Created by user132893 on 4/19/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func login(_ sender: Any) {
        self.performSegue(withIdentifier: "login", sender: nil)
    }
    
    @IBAction func signup(_ sender: Any) {
        self.performSegue(withIdentifier: "signup", sender: nil)
    }
    
    @IBAction func searchAsGuest(_ sender: Any) {
        self.performSegue(withIdentifier: "searchAsGuest", sender: nil)
    }
}
