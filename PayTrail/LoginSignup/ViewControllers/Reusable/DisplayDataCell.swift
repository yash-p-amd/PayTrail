//
//  DisplayDataCell.swift
//  PayTrail
//
//  Created by Yash Patel on 2018-02-26.
//  Copyright © 2018 Yash Patel. All rights reserved.
//

import UIKit

class DisplayDataCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var data: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        title.textColor = UIColor.black
        data.textColor = UIColor.black
    }

}
