//
//  HeaderTVC.swift
//  EIjebo
//
//  Created by Sonu Sharma on 12/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class HeaderTVC: UITableViewCell {
    @IBOutlet var btnSelected : UIButton!
      @IBOutlet var  lblTitle : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}