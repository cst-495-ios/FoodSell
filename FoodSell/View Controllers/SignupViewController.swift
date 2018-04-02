//
//  SignupViewController.swift
//  FoodSell
//
//  Created by user132893 on 3/26/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import UIKit
import Parse

class SignupViewController: UIViewController {

    var selection: Int!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.performSegue(withIdentifier: "goToOptions", sender: nil)
    }
    
    
    @IBAction func onSignup(_ sender: Any) {
        
        let email = emailTextField.text
        let username = usernameTextField.text
        let password = passwordTextField.text
        
        var user = PFUser()
        user.email = email
        user.username = username
        user.password = password
        
        user.signUpInBackground(block: { (success, error) -> Void in
        if let error = error{
            print(error.localizedDescription)
        }
        else
        {
            var account = Account()
            account.key = username!
            account.type = self.selection
            account.billing_info = [:]
            account.cards = [[:]]
            
            account.saveInBackground(block: {(success, error) -> Void in
                if let error = error{
                    print(error.localizedDescription)
                }
                else
                {
                    print("Account saved!")
                }
            })
            
            
            
        }
            
        })
        
    }
    
}
