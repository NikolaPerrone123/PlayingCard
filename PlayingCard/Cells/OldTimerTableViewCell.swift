//
//  OldTimerTableViewCell.swift
//  PlayingCard
//
//  Created by Nikola Popovic on 3/9/18.
//  Copyright © 2018 Nikola Popovic. All rights reserved.
//

import UIKit

class OldTimerTableViewCell: UITableViewCell {

    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var titileText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
