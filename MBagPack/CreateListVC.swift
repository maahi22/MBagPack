//
//  CreateListVC.swift
//  MBagPack
//
//  Created by Maahi on 08/05/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit

class CreateListVC: UIViewController,UITextFieldDelegate {

    
    
    @IBOutlet weak var txtTripname: UITextField!
    @IBOutlet weak var segmentType: UISegmentedControl!
    @IBOutlet weak var txtDays: UITextField!
    @IBOutlet weak var txtTemprature: UITextField!
    @IBOutlet weak var segmentGender: UISegmentedControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    
    
        if segue.identifier == "toAddItems"{
            if let nextViewController = segue.destination as? EditLIstVC{
                //nextViewController.editManageobj =  editEvent
              
                let dict = NSMutableDictionary()
                
                dict.setValue(txtTripname.text, forKey: "tripName")
                dict.setValue(Int(txtDays.text!), forKey: "duration")
                dict.setValue(Double(txtTemprature.text!), forKey: "temprature")
                if segmentGender.selectedSegmentIndex == 0 {
                    dict.setValue(0, forKey: "travelerGender")
                }else{
                       dict.setValue(1, forKey: "travelerGender")
                }
                
                if segmentType.selectedSegmentIndex == 0 {
                    dict.setValue("Bussiness", forKey: "tripType")
                }else{
                    dict.setValue("Casual", forKey: "tripType")
                }
                
                
             DbHelper.sharedInstance.AddTripList(tripData: dict, callback: { (success) in
                
                
                
                
             })
                
                
                
            }
            
        }
    
    
    
    }
    
    
    
    
    
    
    
    
    @IBAction func segmentChange(_ sender: AnyObject) {
        
        
        
    }
    
    
    
    
    
    

}
