//
//  DrawerTVVC.swift
//  EIjebo
//
//  Created by Sonu Sharma on 13/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class DrawerTVC: UITableViewCell {
    //MARK:- Outlets
    
    @IBOutlet weak var imgViewDrawer: UIImageView!
    @IBOutlet weak var lblDrawerItem: UILabel!
    @IBOutlet weak var lblBottom: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
