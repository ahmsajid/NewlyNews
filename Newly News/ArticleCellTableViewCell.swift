//
//  ArticleCellTableViewCell.swift
//  Newly News
//
//  Created by A H M Masfiqur Rahman Sajid on 5/1/17.
//  Copyright © 2017 A H M Masfiqur Rahman Sajid. All rights reserved.
//

import UIKit

class ArticleCellTableViewCell: UITableViewCell {

    @IBOutlet weak var articleImgView: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleDescription: UILabel!
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
