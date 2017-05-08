//
//  ViewController.swift
//  MBagPack
//
//  Created by Maahi on 28/04/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit
import CoreData
import Social
import MessageUI
import Messages


class ViewController: UIViewController,UIActionSheetDelegate,MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate {

    @IBOutlet weak var tblViewTripList: UITableView!
    var tripList = NSMutableArray()
    var tripObj : NSManagedObject!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let navigationBarAppearace = UINavigationBar.appearance()
//        navigationBarAppearace.tintColor = UIColor(red:255.0/255.0, green:111.0/255.0, blue:64.0/255.0, alpha:1.0)
        
        
        
        if DbHelper.sharedInstance.getPlaceListFromDB().count > 0 {
            tripList = NSMutableArray(array: DbHelper.sharedInstance.getPlaceListFromDB() )as! NSMutableArray
            tblViewTripList .reloadData()
        }
      
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
    
    @IBAction func shareClick(_ sender: AnyObject) {
        
        //Create the AlertController and add Its action like button in Actionsheet
        let actionSheetControllerIOS8: UIAlertController = UIAlertController(title: " Share", message: "", preferredStyle: .actionSheet)
        
        let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel")
        }
    
        actionSheetControllerIOS8.addAction(cancelActionButton)
        
        let saveActionButton = UIAlertAction(title: "WhatsApp", style: .default)
        { _ in
            print("WhatsApp")
            self.callWhatsApp(title: "WhatsApp")
        }
        actionSheetControllerIOS8.addAction(saveActionButton)
        
        let FBButton = UIAlertAction(title: "Facebook", style: .default)
        { _ in
            print("FB")
            self.shareonFB(title: "FB")
        }
        actionSheetControllerIOS8.addAction(FBButton)
       
        let twitterButton = UIAlertAction(title: "twitter", style: .default)
        { _ in
            print("twitter")
            self.shareontwitter(title: "twitter")
        }
        actionSheetControllerIOS8.addAction(twitterButton)
        
        
        let EmailButton = UIAlertAction(title: "Email", style: .default)
        { _ in
            print("mail")
             self.sendMail(text: "hii");
        }
        actionSheetControllerIOS8.addAction(EmailButton)
        
        let SMSButton = UIAlertAction(title: "SMS", style: .default)
        { _ in
            print("message")
            self.sendSMS(text: "hii");
        }
        actionSheetControllerIOS8.addAction(SMSButton)
        
        actionSheetControllerIOS8.view.tintColor =  UIColor(red:255.0/255.0, green:111.0/255.0, blue:64.0/255.0, alpha:1.0)

        
        self.present(actionSheetControllerIOS8, animated: true, completion: nil)
        
    }
    
    
    func sendSMS(text:String)  {
        
        if (MFMessageComposeViewController.canSendText()) {
            let messageVC = MFMessageComposeViewController()
            
            messageVC.body = "Enter a message";
            messageVC.recipients = ["Enter tel-nr"]
            messageVC.messageComposeDelegate = self;
            
            self.present(messageVC, animated: false, completion: nil)
        }else{
            let errorAlert = UIAlertView(title: "Cannot Send SMS", message: "Your device is not able to send  SMS.", delegate: self, cancelButtonTitle: "OK")
            errorAlert.show()
        }
        
        
        
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch (result.rawValue) {
        case MessageComposeResult.cancelled.rawValue:
            print("Message was cancelled")
            self.dismiss(animated: true, completion: nil)
        case MessageComposeResult.failed.rawValue:
            print("Message failed")
            self.dismiss(animated: true, completion: nil)
        case MessageComposeResult.sent.rawValue:
            print("Message was sent")
            self.dismiss(animated: true, completion: nil)
        default:
            break;
        }
    }
    
    
    //http://stackoverflow.com/questions/40887721/sending-an-email-from-swift-3
    func sendMail(text:String) {
        
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail()
        {
            self.present(mailComposeViewController, animated: true, completion: nil)
        }
        else
        {
            self.showSendMailErrorAlert()
        }
    
    }
    
    
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        mailComposerVC.setToRecipients(["abc@gmail.com"])
        mailComposerVC.setSubject("Sending you an in-app e-mail...")
        mailComposerVC.setMessageBody("Sending e-mail in-app is not so bad!", isHTML: false)
        
        return mailComposerVC
    }
    
    
    func showSendMailErrorAlert()
    {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    //http://www.oodlestechnologies.com/blogs/Sending-WhatsApp-message-through-app-in-Swift
    func callWhatsApp(title:String)  {
        let urlString = "Sending WhatsApp message through app in Swift"
        let urlStringEncoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        
        let url  = NSURL(string: "whatsapp://send?text=\(urlStringEncoded!)")
        
        if UIApplication.shared.canOpenURL(url! as URL) {
            UIApplication.shared.openURL(url! as URL)
        } else {
            let errorAlert = UIAlertView(title: "Cannot Send Message", message: "Your device is not able to send WhatsApp messages.", delegate: self, cancelButtonTitle: "OK")
            errorAlert.show()
        }
        
    }
    
    
    //https://medium.com/@h_shib8/share-contents-on-facebook-and-twitter-in-swift-3-slcomposeviewcontroller-fb02de241416
    
    func shareonFB (title:String){
    
        let vc = SLComposeViewController(forServiceType:SLServiceTypeFacebook)
        vc?.add(UIImage.init(named: "Logo"))
        vc?.add(URL(string: "http://www.example.com/"))
        vc?.setInitialText("Initial text here.")
        self.present(vc!, animated: true, completion: nil)
    }
    
    func shareontwitter (title:String){
        
        let vc = SLComposeViewController(forServiceType:SLServiceTypeTwitter)
        vc?.add(UIImage.init(named: "Logo"))
        vc?.add(URL(string: "http://www.example.com/"))
        vc?.setInitialText("Initial text here.")
        self.present(vc!, animated: true, completion: nil)
    }
    
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        if segue.identifier == "toShowItems"{
            if let nextViewController = segue.destination as? IteamsListVC{
                nextViewController.ListManageobj =  tripObj
            }
        }
    }
    
}


extension ViewController:UITableViewDataSource,UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
        
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dict = tripList.object(at: indexPath.section) as? NSManagedObject
        
        let cell = tblViewTripList.dequeueReusableCell(withIdentifier: "Cell", for: indexPath )
        let str = dict?.value(forKey: "tripName") as! String
        cell.textLabel?.text = str
        cell.textLabel?.textAlignment = NSTextAlignment.center
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
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let dict = tripList.object(at: section) as? [String : Any]
//        let str = dict?["showDate"]
//        return str as! String?
//    }
    
    
    
    
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
        
         tripObj = tripList.object(at: indexPath.section) as? NSManagedObject
        self.performSegue(withIdentifier: "toShowItems", sender: self)

    }
    
    
}
