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
    
    var account: Account!
    
    
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
                    var query = PFQuery(className: "Account")
                    query.whereKey("key", equalTo: user?.username ?? "")
                    
                    query.findObjectsInBackground(block: { (objects: [PFObject]?, error) in
                        if let error = error{
                            print(error.localizedDescription)
                        }
                        else
                        {
                            if let objects = objects{
                                self.account = objects[0] as? Account
                                
                                if self.account.type == 0
                                {
                                    self.performSegue(withIdentifier: "businessLogin", sender: nil)
                                }
                                else
                                {
                                    self.performSegue(withIdentifier: "customerLogin", sender: nil)
                                }
                            }
                        }
                    })
                }else
                    {
                        print(error?.localizedDescription ?? "Could not print error.")
                }
            
            })
        
    }
    
    
    @IBAction func sendEmail(_ sender: Any) {
    }
    
}
