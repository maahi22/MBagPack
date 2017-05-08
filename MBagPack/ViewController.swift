//
//  ViewController.swift
//  MBagPack
//
//  Created by Maahi on 28/04/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {

    @IBOutlet weak var tblViewTripList: UITableView!
     var tripList = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
    
    @IBAction func shareClick(_ sender: AnyObject) {
        
        
        
        
    }
    
    
}


extension ViewController:UITableViewDataSource,UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
        
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       // let dict = tripList.object(at: indexPath.section) as? [String : Any]
        let cell = tblViewTripList.dequeueReusableCell(withIdentifier: "Cell", for: indexPath )
            return cell
    
        //  Cell
        //  let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell")
        // Configure Table View Cell
        //  configureCell(cell: cell!, atIndexPath: indexPath as NSIndexPath)
        //  return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return tripList.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let dict = tripList.object(at: section) as? [String : Any]
        let str = dict?["showDate"]
        return str as! String?
    }
    
    
    
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return 1
        
    }
    
    func configureCell(cell: UITableViewCell, atIndexPath indexPath: NSIndexPath) {
        // Fetch Record
        
        
       // cell.textLabel.text = eventDict.value(forKey: "title")  as! String//["title"] as? String
        
    }
    
    
    
  
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    private func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]?
    {
        let delete = UITableViewRowAction(style: .normal, title: "Delete")
        { action, index in
            print("delete")
        }
        let done = UITableViewRowAction(style: .default, title: "Done")
        { action, index in
            print("done")
        }
        return [delete, done]
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        
    }
    
    
}
