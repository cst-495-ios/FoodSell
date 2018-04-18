//
//  AddHoursViewController.swift
//  FoodSell
//
//  Created by user132893 on 4/11/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import UIKit
import DropDown


class AddHoursViewController: UIViewController {
    
    var hours: [String] = ["12:00 AM", "11:00 PM", "10:00 PM", "9:00 PM", "8:00 PM", "7:00 PM", "6:00 PM", "5:00 PM", "4:00 PM", "3:00 PM", "2:00 PM", "1:00PM", "12:00 PM", "11:00 AM", "10:00 AM", "9:00 AM", "8:00 AM", "7:00 AM", "6:00 AM", "5:00 AM", "4:00 AM", "3:00 AM", "2:00 AM", "1:00 AM"]
    
    var selectedHours = ["Monday_Start":"12:00 AM","Tuesday_Start":"12:00 AM","Wednesday_Start":"12:00 AM","Thursday_Start":"12:00 AM","Friday_Start":"12:00 AM","Saturday_Start":"12:00 AM","Sunday_Start":"12:00 AM","Monday_End":"12:00 AM","Tuesday_End":"12:00 AM","Wednesday_End":"12:00 AM","Thursday_End":"12:00 AM","Friday_End":"12:00 AM","Saturday_End":"12:00 AM","Sunday_End":"12:00 AM"]
    
    
    @IBOutlet weak var mondayStart: UIView!
    @IBOutlet weak var mondayStartLabel: UILabel!
    
    @IBOutlet weak var mondayEnd: UIView!
    @IBOutlet weak var mondayEndLabel: UILabel!
    
    
    @IBOutlet weak var tuesdayStart: UIView!
    @IBOutlet weak var tuesdayStartLabel: UILabel!
    
    @IBOutlet weak var tuesdayEnd: UIView!
    @IBOutlet weak var tuesdayEndLabel: UILabel!
    
    
    @IBOutlet weak var wednesdayStart: UIView!
    @IBOutlet weak var wednesdayStartLabel: UILabel!
    
    @IBOutlet weak var wednesdayEnd: UIView!
    @IBOutlet weak var wednesdayEndLabel: UILabel!
    
    
    @IBOutlet weak var thursdayStart: UIView!
    @IBOutlet weak var thursdayStartLabel: UILabel!
    
    @IBOutlet weak var thursdayEnd: UIView!
    @IBOutlet weak var thursdayEndLabel: UILabel!
    
    
    @IBOutlet weak var fridayStart: UIView!
    @IBOutlet weak var fridayStartLabel: UILabel!
    
    @IBOutlet weak var fridayEnd: UIView!
    @IBOutlet weak var fridayEndLabel: UILabel!
    
    
    @IBOutlet weak var saturdayStart: UIView!
    @IBOutlet weak var saturdayStartLabel: UILabel!
    
    @IBOutlet weak var saturdayEnd: UIView!
    @IBOutlet weak var saturdayEndLabel: UILabel!
    
    
    @IBOutlet weak var sundayStart: UIView!
    @IBOutlet weak var sundayStartLabel: UILabel!
    
    @IBOutlet weak var sundayEnd: UIView!
    @IBOutlet weak var sundayEndLabel: UILabel!
    
    
    var mondayStartDropDown: DropDown!
    var mondayEndDropDown: DropDown!
    
    var tuesdayStartDropDown: DropDown!
    var tuesdayEndDropDown: DropDown!
    
    var wednesdayStartDropDown: DropDown!
    var wednesdayEndDropDown: DropDown!
    
    var thursdayStartDropDown: DropDown!
    var thursdayEndDropDown: DropDown!
    
    var fridayStartDropDown: DropDown!
    var fridayEndDropDown: DropDown!
    
    var saturdayStartDropDown: DropDown!
    var saturdayEndDropDown: DropDown!
    
    var sundayStartDropDown: DropDown!
    var sundayEndDropDown: DropDown!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mondayStartDropDown = DropDown(anchorView: mondayStart)
        self.mondayStartDropDown.dataSource = hours
        
        self.mondayStartDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.mondayStartLabel.text = item
            self.selectedHours["Monday_Start"] = item
        }
        
        self.mondayEndDropDown = DropDown(anchorView: mondayEnd)
        self.mondayEndDropDown.dataSource = hours
        
        self.mondayEndDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.mondayEndLabel.text = item
            self.selectedHours["Monday_End"] = item
        }
        
        self.tuesdayStartDropDown = DropDown(anchorView: tuesdayStart)
        self.tuesdayStartDropDown.dataSource = hours
        
        self.tuesdayStartDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.tuesdayStartLabel.text = item
            self.selectedHours["Tuesday_Start"] = item
        }
        
        self.tuesdayEndDropDown = DropDown(anchorView: tuesdayEnd)
        self.tuesdayEndDropDown.dataSource = hours
        
        self.tuesdayEndDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.tuesdayEndLabel.text = item
            self.selectedHours["Tuesday_End"] = item
        }
        
        self.wednesdayStartDropDown = DropDown(anchorView: wednesdayStart)
        self.wednesdayStartDropDown.dataSource = hours
        
        self.wednesdayStartDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.wednesdayStartLabel.text = item
            self.selectedHours["Wednesday_Start"] = item
        }
        
        self.wednesdayEndDropDown = DropDown(anchorView: wednesdayEnd)
        self.wednesdayEndDropDown.dataSource = hours
        
        self.wednesdayEndDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.wednesdayEndLabel.text = item
            self.selectedHours["Wednesday_End"] = item
        }
        
        self.thursdayStartDropDown = DropDown(anchorView: thursdayStart)
        self.thursdayStartDropDown.dataSource = hours
        
        self.thursdayStartDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.thursdayStartLabel.text = item
            self.selectedHours["Thursday_Start"] = item
        }
        self.thursdayEndDropDown = DropDown(anchorView: thursdayEnd)
        self.thursdayEndDropDown.dataSource = hours
        
        self.thursdayEndDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.thursdayEndLabel.text = item
            self.selectedHours["Thursday_End"] = item
        }
        
        self.fridayStartDropDown = DropDown(anchorView: fridayStart)
        self.fridayStartDropDown.dataSource = hours
        
        self.fridayStartDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.fridayStartLabel.text = item
            self.selectedHours["Friday_Start"] = item
        }
        
        self.fridayEndDropDown = DropDown(anchorView: fridayEnd)
        self.fridayEndDropDown.dataSource = hours
        
        self.fridayEndDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.fridayEndLabel.text = item
            self.selectedHours["Friday_End"] = item
        }
        
        self.saturdayStartDropDown = DropDown(anchorView: saturdayStart)
        self.saturdayStartDropDown.dataSource = hours
        
        self.saturdayStartDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.saturdayStartLabel.text = item
            self.selectedHours["Saturday_Start"] = item
        }
        
        self.saturdayEndDropDown = DropDown(anchorView: saturdayEnd)
        self.saturdayEndDropDown.dataSource = hours
        
        self.saturdayEndDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.saturdayEndLabel.text = item
            self.selectedHours["Saturday_End"] = item
        }
        
        self.sundayStartDropDown = DropDown(anchorView: sundayStart)
        self.sundayStartDropDown.dataSource = hours
        
        self.sundayStartDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.sundayStartLabel.text = item
            self.selectedHours["Sunday_Start"] = item
        }
        
        self.sundayEndDropDown = DropDown(anchorView: sundayEnd)
        self.sundayEndDropDown.dataSource = hours
        
        self.sundayEndDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.sundayEndLabel.text = item
            self.selectedHours["Sunday_End"] = item
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "addBusinessHours")
        {
            let nav = segue.destination as? UINavigationController
            let vc = nav?.viewControllers.first as! AddBusinessViewController
            vc.hours = self.selectedHours
        }
        
        
        
    }
    

    @IBAction func mondayStartSelected(_ sender: Any) {
        self.mondayStartDropDown.show()
    }
    
    @IBAction func mondayEndSelected(_ sender: Any) {
        self.mondayEndDropDown.show()
    }
    
    @IBAction func tuesdayStartSelected(_ sender: Any) {
        self.tuesdayStartDropDown.show()
    }
    
    @IBAction func tuesdayEndSelected(_ sender: Any) {
        self.tuesdayEndDropDown.show()
    }
    
    @IBAction func wednesdayStartSelected(_ sender: Any) {
        self.wednesdayStartDropDown.show()
    }
    
    @IBAction func wednesdayEndSelected(_ sender: Any) {
        self.wednesdayEndDropDown.show()
    }
    
    @IBAction func thursdayStartSelected(_ sender: Any) {
        self.thursdayStartDropDown.show()
    }
    
    @IBAction func thursdayEndSelected(_ sender: Any) {
        self.thursdayEndDropDown.show()
    }
    
    @IBAction func fridayStartSelected(_ sender: Any) {
        self.fridayStartDropDown.show()
    }
    
    @IBAction func fridayEndSelected(_ sender: Any) {
        self.fridayEndDropDown.show()
    }
    
    @IBAction func saturdayStartSelected(_ sender: Any) {
        self.saturdayStartDropDown.show()
    }
    
    @IBAction func saturdayEndSelected(_ sender: Any) {
        self.saturdayEndDropDown.show()
    }
    
    @IBAction func sundayStartSelected(_ sender: Any) {
        self.sundayStartDropDown.show()
    }
    
    @IBAction func sundayEndSelected(_ sender: Any) {
        self.sundayEndDropDown.show()
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.performSegue(withIdentifier: "cancelAddHours", sender: nil)
    }
    

}
