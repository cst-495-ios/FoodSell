//
//  OrderSendViewController.swift
//  FoodSell
//
//  Created by user132893 on 4/30/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import UIKit

class OrderSendViewController: UIViewController {
    
    var order: [Any]!
    var business: BusinessAccount!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToConfirm"{
            let email = emailTextField.text
            let phone = phoneTextField.text
            
            if !(email?.isEmpty)! && !(phone?.isEmpty)!{
                var total = 0
                
                for i in order{
                    
                }
            }
            else
            {
                
            }
        }
        
    }
    

}
