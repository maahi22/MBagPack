//
//  addItemCell.swift
//  MBagPack
//
//  Created by Maahi on 09/05/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit

class addItemCell: UITableViewCell {

    @IBOutlet weak var txtItemName: UITextField!
    @IBOutlet weak var txtItemQuantity: UITextField!
    @IBOutlet weak var btnAddNote: UIButton!
    @IBOutlet weak var btnCheck: UIButton!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
