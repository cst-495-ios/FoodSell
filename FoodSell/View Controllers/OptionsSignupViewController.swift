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

    var selection: Int!
    
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "onContinue"{
            if(selection == nil)
            {
                
            }
            else
            {
                let nav = segue.destination as? UINavigationController
                let vc = nav?.viewControllers.first as! SignupViewController
                vc.selection = self.selection
            }
        }
    }
    
    @IBAction func businessSelected(_ sender: Any) {
        selection = 0
    }
    
    @IBAction func customerSelected(_ sender: Any) {
        selection = 1
    }
    
}
