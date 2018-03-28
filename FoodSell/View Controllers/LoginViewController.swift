//
//  LoginViewController.swift
//  FoodSell
//
//  Created by user132893 on 3/26/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(_ sender: Any) {
        let loginText = loginTextField.text
        let passwordText = passwordTextField.text
        
        PFUser.logInWithUsername(inBackground: loginText!, password: passwordText!, block: { (user, error) -> Void in
            
                if(user != nil)
                {
                    print("Success!")
                }else
                    {
                        print(error?.localizedDescription ?? "Could not print error.")
                }
            
            })
        
    }
    
    
    @IBAction func sendEmail(_ sender: Any) {
    }
    
}
