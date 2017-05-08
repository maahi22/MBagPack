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
            }
            
        }
    
    
    
    }
    
    
    
    
    
    
    
    
    @IBAction func segmentChange(_ sender: AnyObject) {
        
        
        
    }
    
    
    
    
    
    

}
