//
//  ProfileCell.swift
//  TG app
//
//  Created by NikoGenn on 14.04.15.
//  Copyright (c) 2015 MyMac. All rights reserved.
//

import UIKit
import Kingfisher

class ProfileCell: UITableViewCell {

    @IBOutlet var back: UIImageView!
    @IBOutlet var avatar: UIImageView!
    @IBOutlet var username: UILabel!
    @IBOutlet var status: UILabel!
    @IBOutlet var progress: UIProgressView!
    @IBOutlet var more: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        avatar.layer.cornerRadius = 5
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    internal func cellOnTableView(tableView:UITableView, didScrollOnView view: UIView)
    {
        var rectInSuperview:CGRect = tableView.convertRect(self.frame, toView:view)
        var distanceFromCenter = CGRectGetHeight(view.frame)/2 - CGRectGetMinY(rectInSuperview)
        var difference = CGRectGetHeight(self.back.frame) - CGRectGetHeight(self.frame)
        var move = (distanceFromCenter / CGRectGetHeight(view.frame)) * difference
        var imageRect = self.back.frame
        imageRect.origin.y = -(difference/2)+move
        self.back.frame = imageRect
}

}
