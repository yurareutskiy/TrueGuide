//
//  PlacesFavoritesCell.swift
//  TG app
//
//  Created by NikoGenn on 17.04.15.
//  Copyright (c) 2015 MyMac. All rights reserved.
//

import UIKit

class PlacesFavoritesCell: UITableViewCell {

    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var address: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
