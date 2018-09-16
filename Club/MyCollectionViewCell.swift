//
//  MyCollectionViewCell.swift
//  hangge_1591
//
//  Created by hangge on 2017/3/12.
//  Copyright © 2017年 hangge.com. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    //用于显示封面缩略图
    @IBOutlet weak var clubLabel: UILabel!
    @IBOutlet weak var badgeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        badgeImageView.contentMode = UIViewContentMode.scaleToFill
    }
}
