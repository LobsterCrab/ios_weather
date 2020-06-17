//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by Peter Yakovlev on 28.04.2020.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var dayPic: UIImageView!
    @IBOutlet weak var nightPic: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var dayTemp: UILabel!
    @IBOutlet weak var nightTemp: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
