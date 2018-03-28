//
//  OptionsSignupViewController.swift
//  FoodSell
//
//  Created by user132893 on 3/26/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import UIKit

import DLRadioButton

class OptionsSignupViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func goBack(_ sender: Any) {
        self.performSegue(withIdentifier: "goToMenu", sender: nil)
    }
    
    @IBAction func onContinue(_ sender: Any) {
    }
    
    @IBAction func businessSelected(_ sender: Any) {
        
    }
    
    @IBAction func customerSelected(_ sender: Any) {
    }
    
}
