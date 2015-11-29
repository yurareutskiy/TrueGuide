//
//  RoutesFavoritesCell.swift
//  TG app
//
//  Created by NikoGenn on 17.04.15.
//  Copyright (c) 2015 MyMac. All rights reserved.
//

import UIKit

class RoutesFavoritesCell: UITableViewCell {

    @IBOutlet var amount: UILabel!
    @IBOutlet var title: UILabel!
    @IBOutlet var count: UILabel!
    @IBOutlet var routesbg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
