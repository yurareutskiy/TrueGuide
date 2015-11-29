//
//  SearchPlacesCell.swift
//  TG app
//
//  Created by NikoGenn on 15.04.15.
//  Copyright (c) 2015 MyMac. All rights reserved.
//

import UIKit

class SearchPlacesCell: UITableViewCell {

    @IBOutlet var logo: UIImageView!
    @IBOutlet var adress: UILabel!
    @IBOutlet var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
