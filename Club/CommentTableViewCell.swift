//
//  CommentTableViewCell.swift
//  Club
//
//  Created by 张泽锟 on 2017/7/18.
//  Copyright © 2017年 张泽锟. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var commentLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLbl.text = user
        // Initialization code
    }
    
    func reloadCommentData(content: String){
        commentLbl.text = content
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
