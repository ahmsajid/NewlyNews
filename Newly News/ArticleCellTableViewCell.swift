//
//  ArticleCellTableViewCell.swift
//  Newly News
//
//  Created by A H M Masfiqur Rahman Sajid on 5/1/17.
//  Copyright © 2017 A H M Masfiqur Rahman Sajid. All rights reserved.
//

import UIKit

class ArticleCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var author: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
