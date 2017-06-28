//
//  videoTableViewCell.swift
//  playlocalvideo
//
//  Created by zhangfanghui on 16/12/29.
//  Copyright © 2016年 zhangfanghui. All rights reserved.
//

import UIKit

struct video {
    let image: String
    let title: String
    let source: String
}

class videoTableViewCell: UITableViewCell {

    //MARK: properties
    
    @IBOutlet weak var videoScreenshot: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
