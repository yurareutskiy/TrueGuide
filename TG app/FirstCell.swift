//
//  FirstCell.swift
//  TG app
//
//  Created by NikoGenn on 09.04.15.
//  Copyright (c) 2015 MyMac. All rights reserved.
//

import UIKit

class FirstCell: UITableViewCell {

    @IBOutlet var icon: UIImageView!
    @IBOutlet var adress: UILabel!
    @IBOutlet var titleL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
