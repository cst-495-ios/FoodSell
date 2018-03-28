//
//  OptionsSignupViewController.swift
//  FoodSell
//
//  Created by user132893 on 3/26/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import UIKit
import RadioButton

class OptionsSignupViewController: UIViewController {

    
    @IBOutlet weak var opt_business: RadioButton!
    
    @IBOutlet weak var opt_customer: RadioButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onContinue(_ sender: Any) {
    }
    
    

}
