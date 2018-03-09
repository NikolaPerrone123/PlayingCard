//
//  TwoCarsTableViewCell.swift
//  PlayingCard
//
//  Created by Nikola Popovic on 3/9/18.
//  Copyright © 2018 Nikola Popovic. All rights reserved.
//

import UIKit

class TwoCarsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var firstCarImage: UIImageView!
    @IBOutlet weak var secondCarImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
