//
//  SearchCategoriesCell.swift
//  TG app
//
//  Created by NikoGenn on 16.04.15.
//  Copyright (c) 2015 MyMac. All rights reserved.
//

import UIKit

class SearchCategoriesCell: UITableViewCell {

    @IBOutlet var back: UIImageView!
    @IBOutlet var starred: UILabel!
    @IBOutlet var starB: UIButton!
    @IBOutlet var countP: UILabel!
    @IBOutlet var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func star(sender: AnyObject) {
    }
}
